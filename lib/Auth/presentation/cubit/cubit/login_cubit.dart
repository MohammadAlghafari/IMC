import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:imc/Auth/data/api/auth_api_handler.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/core/model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthApiHandler _authApiHandler;
  LoginCubit(this._authApiHandler) : super(LoginInitialState());

  /// [loginWithEmailPassword] function to login with passed [email] and [password]
  Future<void> loginWithEmailPassword({
    required String emailVal,
    required String passwordVal,
    // required oldRefreshToken,
  }) async {
    try {
      emit(LoginLoadingState());
      // fetching the user model by passing email, password from api
      UserModel? fetchedUserModel = await _authApiHandler.userLogin(
        email: emailVal,
        password: passwordVal,
      );

      // filtering the fetchedUser data to get the initial access token
      String? initialAccessToken = fetchedUserModel?.records.accessToken;
      // storing the initial access token in hive
      if (initialAccessToken != null) {
        AuthHiveHelper.saveAccessTokenInHive(initialAccessToken);
        AuthHiveHelper.saveUserRoleIdInHive(fetchedUserModel?.records.user.role.userRoleId);
        AuthHiveHelper.saveUserNameInHive(fetchedUserModel?.records.user.name);
        AuthHiveHelper.saveUserPictureInHive(fetchedUserModel?.records.user.picture);
      }

      // fetching the initial refresh token  from the api
      Token? fetchedRefreshToken = await _authApiHandler.getToken(
        email: emailVal,
        password: passwordVal,
      );

      // storing  the fetched initial RefreshToken inside hive
      if (fetchedRefreshToken != null) {
        AuthHiveHelper.saveRefreshTokenInHive(fetchedRefreshToken.refreshToken);
      }

      // setting is user logged in as true
      AuthHiveHelper.isUserLoggedIn(true);

      log('hive accessToken : ${AuthHiveHelper.getAccessTokenFromHive}');
      log('hive isLoggedIn : ${AuthHiveHelper.getIsUserLoggedIn}');
      log('hive isLoggedIn : ${AuthHiveHelper.getIsUserLoggedIn}');

      emit(LoginLoadedState(fetchedUserModel));
    }
    on DioError catch (e) {
      log("Dio ERROR");
      emit(LoginErrorState(e.response!.statusMessage.toString()));
    }
    catch (e) {
      String errorMessage = "$e";
      try {
        // decoding the error message from response given below
        // {"_metadata":{"status_text":"Forbidden","status_code":403,"number_of_records":0,"message":"Le compte utilisateur n'est pas actif, veuillez contacter l'administrateur"},"records":[],"errors":[]}
        errorMessage = jsonDecode("$e")["_metadata"]["message"].toString();
      }
      catch(error){
        errorMessage = "$e";
      }
      emit(LoginErrorState("$errorMessage"));
    }
  }

  void resetCubit() {
    emit(LoginInitialState());
    AuthHiveHelper.saveAccessTokenInHive(null);
    AuthHiveHelper.saveUserRoleIdInHive(null);
    AuthHiveHelper.saveRefreshTokenInHive(null);
    AuthHiveHelper.saveUserNameInHive(null);
    AuthHiveHelper.saveUserPictureInHive(null);
    AuthHiveHelper.isUserLoggedIn(false);
  }
}