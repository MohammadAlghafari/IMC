/*
/// A Team Leader will have 'n' number of team members (technician) working under it
/// TeamLeaderTeamMembersModel will be used for a team leader which will contain the details like (team_leader_id,collaboration)
*/

/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":1,"message":"Success!"}
/// records : [{"id":1,"collaborator_id":8,"leader_id":4,"collaborator":{"id":8,"name":"Ali ITFAQ","email":"ali.shaikh@itfaq.global","username":"string","telephone":"string","picture":"https://demo2.itfaq.cloud/imc/public/assets/img/users/user.png","status":1,"email_verified_at":"string","last_login_at":"string","last_login_ip_address":"string","role_id":4,"created_at":"2022-10-05T10:10:23.000000Z","updated_at":"2022-10-05T10:10:23.000000Z","collaboration_id":1,"profile_img":"string"}}]
/// errors : []

class TeamLeaderTeamMembersModel {
  TeamLeaderTeamMembersModel({
    Metadata? metadata,
    List<Records>? records,
  }) {
    _metadata = metadata;
    _records = records;
  }

  TeamLeaderTeamMembersModel.fromJson(dynamic json) {
    _metadata = json['_metadata'] != null ? Metadata.fromJson(json['_metadata']) : null;
    if (json['records'] != null) {
      _records = [];
      json['records'].forEach((v) {
        _records?.add(Records.fromJson(v));
      });
    }
  }
  Metadata? _metadata;
  List<Records>? _records;

  TeamLeaderTeamMembersModel copyWith({
    Metadata? metadata,
    List<Records>? records,
    List<dynamic>? errors,
  }) =>
      TeamLeaderTeamMembersModel(
        metadata: metadata ?? _metadata,
        records: records ?? _records,
      );
  Metadata? get metadata => _metadata;
  List<Records>? get records => _records;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_metadata != null) {
      map['_metadata'] = _metadata?.toJson();
    }
    if (_records != null) {
      map['records'] = _records?.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

/// id : 1
/// collaborator_id : 8
/// leader_id : 4
/// collaborator : {"id":8,"name":"Ali ITFAQ","email":"ali.shaikh@itfaq.global","username":"string","telephone":"string","picture":"https://demo2.itfaq.cloud/imc/public/assets/img/users/user.png","status":1,"email_verified_at":"string","last_login_at":"string","last_login_ip_address":"string","role_id":4,"created_at":"2022-10-05T10:10:23.000000Z","updated_at":"2022-10-05T10:10:23.000000Z","collaboration_id":1,"profile_img":"string"}

class Records {
  Records({
    int? id,
    int? collaboratorId,
    int? leaderId,
    Collaborator? collaborator,
  }) {
    _id = id;
    _collaboratorId = collaboratorId;
    _leaderId = leaderId;
    _collaborator = collaborator;
  }

  Records.fromJson(dynamic json) {
    _id = json['id'];
    _collaboratorId = json['collaborator_id'];
    _leaderId = json['leader_id'];
    _collaborator = json['collaborator'] != null ? Collaborator.fromJson(json['collaborator']) : null;
  }
  int? _id;
  int? _collaboratorId;
  int? _leaderId;
  Collaborator? _collaborator;
  Records copyWith({
    int? id,
    int? collaboratorId,
    int? leaderId,
    Collaborator? collaborator,
  }) =>
      Records(
        id: id ?? _id,
        collaboratorId: collaboratorId ?? _collaboratorId,
        leaderId: leaderId ?? _leaderId,
        collaborator: collaborator ?? _collaborator,
      );
  int? get id => _id;
  int? get collaboratorId => _collaboratorId;
  int? get leaderId => _leaderId;
  Collaborator? get collaborator => _collaborator;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['collaborator_id'] = _collaboratorId;
    map['leader_id'] = _leaderId;
    if (_collaborator != null) {
      map['collaborator'] = _collaborator?.toJson();
    }
    return map;
  }
}

/// id : 8
/// name : "Ali ITFAQ"
/// email : "ali.shaikh@itfaq.global"
/// username : "string"
/// telephone : "string"
/// picture : "https://demo2.itfaq.cloud/imc/public/assets/img/users/user.png"
/// status : 1
/// email_verified_at : "string"
/// last_login_at : "string"
/// last_login_ip_address : "string"
/// role_id : 4
/// created_at : "2022-10-05T10:10:23.000000Z"
/// updated_at : "2022-10-05T10:10:23.000000Z"
/// collaboration_id : 1
/// profile_img : "string"

class Collaborator {
  Collaborator({
    int? id,
    String? name,
    String? email,
    String? username,
    String? telephone,
    String? picture,
    int? status,
    String? emailVerifiedAt,
    String? lastLoginAt,
    String? lastLoginIpAddress,
    int? roleId,
    String? createdAt,
    String? updatedAt,
    int? collaborationId,
    String? profileImg,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _username = username;
    _telephone = telephone;
    _picture = picture;
    _status = status;
    _emailVerifiedAt = emailVerifiedAt;
    _lastLoginAt = lastLoginAt;
    _lastLoginIpAddress = lastLoginIpAddress;
    _roleId = roleId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _collaborationId = collaborationId;
    _profileImg = profileImg;
  }

  Collaborator.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _username = json['username'];
    _telephone = json['telephone'];
    _picture = json['picture'];
    _status = json['status'];
    _emailVerifiedAt = json['email_verified_at'];
    _lastLoginAt = json['last_login_at'];
    _lastLoginIpAddress = json['last_login_ip_address'];
    _roleId = json['role_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _collaborationId = json['collaboration_id'];
    _profileImg = json['profile_img'];
  }
  int? _id;
  String? _name;
  String? _email;
  String? _username;
  String? _telephone;
  String? _picture;
  int? _status;
  String? _emailVerifiedAt;
  String? _lastLoginAt;
  String? _lastLoginIpAddress;
  int? _roleId;
  String? _createdAt;
  String? _updatedAt;
  int? _collaborationId;
  String? _profileImg;
  Collaborator copyWith({
    int? id,
    String? name,
    String? email,
    String? username,
    String? telephone,
    String? picture,
    int? status,
    String? emailVerifiedAt,
    String? lastLoginAt,
    String? lastLoginIpAddress,
    int? roleId,
    String? createdAt,
    String? updatedAt,
    int? collaborationId,
    String? profileImg,
  }) =>
      Collaborator(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        username: username ?? _username,
        telephone: telephone ?? _telephone,
        picture: picture ?? _picture,
        status: status ?? _status,
        emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
        lastLoginAt: lastLoginAt ?? _lastLoginAt,
        lastLoginIpAddress: lastLoginIpAddress ?? _lastLoginIpAddress,
        roleId: roleId ?? _roleId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        collaborationId: collaborationId ?? _collaborationId,
        profileImg: profileImg ?? _profileImg,
      );
  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get username => _username;
  String? get telephone => _telephone;
  String? get picture => _picture;
  int? get status => _status;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get lastLoginAt => _lastLoginAt;
  String? get lastLoginIpAddress => _lastLoginIpAddress;
  int? get roleId => _roleId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get collaborationId => _collaborationId;
  String? get profileImg => _profileImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['username'] = _username;
    map['telephone'] = _telephone;
    map['picture'] = _picture;
    map['status'] = _status;
    map['email_verified_at'] = _emailVerifiedAt;
    map['last_login_at'] = _lastLoginAt;
    map['last_login_ip_address'] = _lastLoginIpAddress;
    map['role_id'] = _roleId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['collaboration_id'] = _collaborationId;
    map['profile_img'] = _profileImg;
    return map;
  }
}

/// status_text : "OK"
/// status_code : 200
/// number_of_records : 1
/// message : "Success!"

class Metadata {
  Metadata({
    String? statusText,
    int? statusCode,
    int? numberOfRecords,
    String? message,
  }) {
    _statusText = statusText;
    _statusCode = statusCode;
    _numberOfRecords = numberOfRecords;
    _message = message;
  }

  Metadata.fromJson(dynamic json) {
    _statusText = json['status_text'];
    _statusCode = json['status_code'];
    _numberOfRecords = json['number_of_records'];
    _message = json['message'];
  }
  String? _statusText;
  int? _statusCode;
  int? _numberOfRecords;
  String? _message;
  Metadata copyWith({
    String? statusText,
    int? statusCode,
    int? numberOfRecords,
    String? message,
  }) =>
      Metadata(
        statusText: statusText ?? _statusText,
        statusCode: statusCode ?? _statusCode,
        numberOfRecords: numberOfRecords ?? _numberOfRecords,
        message: message ?? _message,
      );
  String? get statusText => _statusText;
  int? get statusCode => _statusCode;
  int? get numberOfRecords => _numberOfRecords;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_text'] = _statusText;
    map['status_code'] = _statusCode;
    map['number_of_records'] = _numberOfRecords;
    map['message'] = _message;
    return map;
  }
}