/*
///RefreshTokenResponseModel will used to fetch new access, refresh token whenever required, it will
///have data like (token type, expire time, access, new refresh token)
*/
import 'dart:convert';

RefreshTokenResponseModel refreshTokenResponseModelFromJson(String str) =>
    RefreshTokenResponseModel.fromJson(json.decode(str));

String refreshTokenResponseModelToJson(RefreshTokenResponseModel data) =>
    json.encode(data.toJson());

class RefreshTokenResponseModel {
  RefreshTokenResponseModel({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  });

  String? tokenType;
  int? expiresIn;
  String? accessToken;
  String? refreshToken;

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponseModel(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
