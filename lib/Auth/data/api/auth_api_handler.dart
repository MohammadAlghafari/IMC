import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/Auth/data/repository/auth_repository.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/model/user_model.dart';
import 'package:imc/core/service/api_routes.dart';

class AuthApiHandler implements AuthRepository {
  static Dio _dio = GetIt.I<Dio>();

  //* This function will login the user with given email and password
  @override
  Future<UserModel?> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> _body = {
        "email": email,
        "password": password,
      };

      Response response = await _dio.post(APIRoutes.login, data: _body);
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      // throw e.message;
      throw e.response!.toString();
      // throw e.response.toString();
    } catch (e, stacktrace) {
      log("$stacktrace");
      throw 'An Error Occured';
    }
  }

  //* This function will return us the initial refresh token
  @override
  Future<Token?> getToken(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> _body = {
        "grant_type": "password",
        "client_id": AppConstant.clientId,
        "client_secret": AppConstant.clientSecret,
        "username": email,
        "password": password,
      };

      Response response = await _dio.post(APIRoutes.getToken, data: _body);
      return Token.fromJson(response.data);
    } on DioError catch (e) {
      // throw e.message;
      throw e.response!.statusMessage.toString();
      // throw e.response.toString();
    } catch (e) {
      throw 'An Error Occured';
    }
  }

  //* The function will return us the new refresh token
  @override
  Future<Token?> getRefreshToken({required String oldRefreshToken}) async {
    try {
      Map<String, dynamic> _body = {
        "grant_type": "refresh_token",
        "client_id": AppConstant.clientId,
        "client_secret": AppConstant.clientSecret,
        "refresh_token": oldRefreshToken
      };

      Response response = await _dio.post(APIRoutes.getToken, data: _body);
      return Token.fromJson(response.data);
    } on DioError catch (e) {
      // throw e.message;
      throw e.response!.statusMessage.toString();
      // throw e.response.toString();
    } catch (e) {
      throw 'An Error Occured';
    }
  }
}
