import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class HiveKeys {
  static String accessTokenKey = "accessTokenKey";
  static String refreshTokenKey = "refreshTokenKey";
  static String isUserLoggedInKey = "isUserLoggedIn";
  static String userRoleIdKey = "userRoleIdKey";
  static String userNameKey = "userNameKey";
  static String userPictureKey = "userPictureKey";
}

class AuthHiveHelper {
  static final _hiveBox = GetIt.I<Box>();

  // For saving access token
  static void saveAccessTokenInHive(String? accessToken) {
    _hiveBox.put(HiveKeys.accessTokenKey, accessToken);
  }

  // for saving refresh token
  static void saveRefreshTokenInHive(String? refreshToken) {
    _hiveBox.put(HiveKeys.refreshTokenKey, refreshToken);
  }

  // This keeps track that whether user is loggedIn or not
  static void isUserLoggedIn(bool value) {
    _hiveBox.put(HiveKeys.isUserLoggedInKey, value);
  }

  // for saving user role id
  static void saveUserRoleIdInHive(int? roleId) {
    _hiveBox.put(HiveKeys.userRoleIdKey, roleId);
  }

  // for saving user picture
  static void saveUserPictureInHive(String? userPicture) {
    _hiveBox.put(HiveKeys.userPictureKey, userPicture);
  }
  // for saving user name
  static void saveUserNameInHive(String? userName) {
    _hiveBox.put(HiveKeys.userNameKey,userName);
  }

  static String? get getAccessTokenFromHive => _hiveBox.get(HiveKeys.accessTokenKey);
  static String? get getRefreshTokenFromHive => _hiveBox.get(HiveKeys.refreshTokenKey);
  static bool get getIsUserLoggedIn => _hiveBox.get(HiveKeys.isUserLoggedInKey, defaultValue: false);
  static int get getUserRoleId => _hiveBox.get(HiveKeys.userRoleIdKey, defaultValue: 0);
  static String? get getUserPicture => _hiveBox.get(HiveKeys.userPictureKey);
  static String? get getUserName => _hiveBox.get(HiveKeys.userNameKey);
}