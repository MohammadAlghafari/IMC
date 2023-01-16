/*
/// UserModel will be used for the all the authenticated user which have all the details
/// like (it's tokens,id, email, telephone etc)
*/

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.metadata,
    required this.records,
  });

  Metadata metadata;
  Records records;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    metadata: Metadata.fromJson(json["_metadata"] ?? {}),
    records: Records.fromJson(json["records"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "_metadata": metadata.toJson(),
    "records": records.toJson(),
  };
}

class Metadata {
  Metadata({
    required this.message,
  });

  String message;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {"message": message};
}

class Records {
  Records({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  String accessToken;
  String tokenType;
  User user;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
    accessToken: json["access_token"] ?? "",
    tokenType: json["token_type"] ?? "",
    user: User.fromJson(json["user"] ?? ""),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "user": user.toJson(),
  };
}

enum UserRole { teamLeader, technician }

extension UserRoleExtension on UserRole {
  int get userRoleId {
    switch (this) {
      case UserRole.technician:
        return 4;
      case UserRole.teamLeader:
        return 5;
    }
  }

  UserRole getRoleFromId(int? id) {
    switch (id) {
      case 4:
        return UserRole.technician;
      case 5:
        return UserRole.teamLeader;
    }
    return UserRole.technician;
  }
}

class User {
  User({
    required this.id,
    required this.collaborationId,
    required this.role,
    required this.name,
    required this.email,
    required this.telephone,
    required this.status,
    required this.createdAt,
    required this.emailVerfiedAt,
    required this.lastLoginAt,
    required this.lastLoginIpAddress,
    required this.picture,
    required this.profileImg,
    required this.roleId,
    required this.updatedAt,
    required this.userName,
  });

  int id;
  int collaborationId;
  UserRole role;
  String name;
  String email;
  String telephone;
  int status;
  String picture;
  String emailVerfiedAt;
  String lastLoginAt;
  String lastLoginIpAddress;
  int roleId;
  String createdAt;
  String updatedAt;
  String userName;
  String profileImg;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    collaborationId: json["collaboration_id"] ?? 0,
    role: UserRole.technician.getRoleFromId(json["role_id"]),
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    telephone: json["telephone"] ?? "",
    status: json["status"] ?? "",
    createdAt: json['created_at']?? "",
    emailVerfiedAt: json['email_verified_at']?? "",
    lastLoginAt: json['last_login_at']?? "",
    lastLoginIpAddress: json['last_login_ip_address']?? "",
    picture: json['picture']?? "",
    profileImg: json['profile_img']?? "",
    roleId: json['role_id']??0,
    updatedAt: json['updated_at']?? "",
    userName: json['username']?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "collaboration_id": collaborationId,
    "role_id": role.userRoleId,
    "name": name,
    "email": email,
    "telephone": telephone,
    "status": status,
    "created_at": createdAt,
    "email_verified_at":emailVerfiedAt,
    "last_login_at":lastLoginAt,
    "last_login_ip_address":lastLoginIpAddress,
    "picture":picture,
    "profile_img":profileImg,
    "updated_at":updatedAt,
    "username":userName,
  };
}

class Token {
  Token({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };
}