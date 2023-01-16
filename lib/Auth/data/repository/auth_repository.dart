import 'package:imc/core/model/user_model.dart';

abstract class AuthRepository {
  /// [userLogin] login with provided [email], [password]
  Future<UserModel?> userLogin({
    required String email,
    required String password,
  });

  /// [getToken] will fetch the access token for provided [email], [password]
  Future<Token?> getToken({required String email, required String password});

  /// [getRefreshToken] will fetch new refresh token with provided [oldRefreshToken]
  Future<Token?> getRefreshToken({required String oldRefreshToken});
}