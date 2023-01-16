import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Auth/presentation/pages/signin_email_screen.dart';
import 'package:imc/base_screen/presentation/pages/team_lead_base_screen_index.dart';
import 'package:imc/base_screen/presentation/pages/technician_base_screen_index.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/dio_interceptors/dio_interceptor.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/service_locator.dart';
import 'package:local_auth/local_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    initSplash();
  }

  Future<void> initSplash() async {
    // Setting up the service locator
    await setupLocator();

    Dio _dio = GetIt.I<Dio>();
    DioInterceptorUtil.addInterceptor(_dio);

    //after adding the dio interceptor initializing the setup for authentication
    _initLocalAuth();
  }

  /// [_initLocalAuth] will authenticate the user according to its role with help of biometrics
  Future<bool?> _initLocalAuth() async {
    try {
      // is the user logged in or not
      bool? isUserLoggedIn = AuthHiveHelper.getIsUserLoggedIn;
      // is biometric is supported by the device or not
      bool? _isBiometricSupported = await auth.isDeviceSupported();
      // are we able to use the bio metric
      bool? _canCheckBiometrics = await auth.canCheckBiometrics;
      // get us the list of biometrics
      List<BiometricType>? _availableBiometrics = await auth.getAvailableBiometrics();

      if (_isBiometricSupported == true && _canCheckBiometrics == true && isUserLoggedIn == true && (_availableBiometrics.isNotEmpty)) {
        bool? _isAuthenticated = await auth.authenticate(
          localizedReason: AppLocalizations.of(context).translate("please_authenticate_before_entering"),
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
        if (_isAuthenticated == true) {
          //getting the User Role from local DB, and logging according to the roles
          int roleId = AuthHiveHelper.getUserRoleId;
          if (roleId == UserRoles.TECHNICIAN_ROLE_ID) {
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_) {
              return BaseScreenIndex();
            }), (route) => false);
          } else {
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_) {
              return TeamLeadBaseScreenIndex();
            }), (route) => false);
          }
        }
        return _isAuthenticated;
      }
      else if((_isBiometricSupported != true || _canCheckBiometrics != true || _availableBiometrics.isEmpty) && isUserLoggedIn == true){
        //getting the User Role from local DB, and logging according to the roles
        int roleId = AuthHiveHelper.getUserRoleId;
        if (roleId == UserRoles.TECHNICIAN_ROLE_ID) {
          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_) {
            return BaseScreenIndex();
          }), (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_) {
            return TeamLeadBaseScreenIndex();
          }), (route) => false);
        }
      }
      else {
        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_) {
          return SignInEmailScreen();
        }), (route) => false);
      }
      return false;
    } catch (e) {
      log("$e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Image.asset(
                AppIcons.logo,
                scale: 1,
              )),
          Positioned(
            bottom: 0.04.sh,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 1.sw,
                child: CupertinoButton(
                    child: AppRegularText(
                      appLocalization.translate("continue_biometric"),
                      color: AppColor.kPrimaryColor,
                    ),
                    onPressed: () {
                      _initLocalAuth();
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}