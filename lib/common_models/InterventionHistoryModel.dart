/*
///InterventionHistoryModel will be used to check the history for the intervention of the current client if the intervention is already completed
///then this model will contain the message,date time when intervention modified and the pdf of the intervention.
*/


/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":0,"message":"Success!"}
/// records : [{"message":"Super","pdf":"string","lastModified":"string"},{"message":"Super","pdf":"string","lastModified":"string"}]
/// errors : []

class InterventionHistoryModel {
  InterventionHistoryModel({
    Metadata? metadata,
    List<Records>? records,
  }) {
    _metadata = metadata;
    _records = records;
  }

  InterventionHistoryModel.fromJson(dynamic json) {
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

  InterventionHistoryModel copyWith({
    Metadata? metadata,
    List<Records>? records,
    List<dynamic>? errors,
  }) =>
      InterventionHistoryModel(
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

/// message : "Super"
/// pdf : "string"
/// lastModified : "string"

class Records {
  Records({
    String? message,
    String? pdf,
    String? lastModified,
  }) {
    _message = message;
    _pdf = pdf;
    _lastModified = lastModified;
  }

  Records.fromJson(dynamic json) {
    _message = json['message'];
    _pdf = json['pdf'];
    _lastModified = json['lastModified'];
  }
  String? _message;
  String? _pdf;
  String? _lastModified;
  Records copyWith({
    String? message,
    String? pdf,
    String? lastModified,
  }) =>
      Records(
        message: message ?? _message,
        pdf: pdf ?? _pdf,
        lastModified: lastModified ?? _lastModified,
      );
  String? get message => _message;
  String? get pdf => _pdf;
  String? get lastModified => _lastModified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['pdf'] = _pdf;
    map['lastModified'] = _lastModified;
    return map;
  }
}

/// status_text : "OK"
/// status_code : 200
/// number_of_records : 0
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