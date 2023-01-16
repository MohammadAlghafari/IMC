/*
///[InterventionsCountModel] model will used for both  team leader and techinician flow in home screens to show the
/// intervention counts' by type (to-do, realized, grip).
*/

/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":3,"message":"Success!"}
/// records : {"A ne pas réaliser":0,"Stand by":0,"Réalisée":0}


class InterventionsCountModel {
  InterventionsCountModel({
    Metadata? metadata,
    Records? records,
  }) {
    _metadata = metadata;
    _records = records;
  }

  InterventionsCountModel.fromJson(dynamic json) {
    _metadata = json['_metadata'] != null ? Metadata.fromJson(json['_metadata']) : null;
    _records = json['records'] != null ? Records.fromJson(json['records']) : null;
  }
  Metadata? _metadata;
  Records? _records;

  InterventionsCountModel copyWith({
    Metadata? metadata,
    Records? records,
  }) =>
      InterventionsCountModel(
        metadata: metadata ?? _metadata,
        records: records ?? _records,
      );
  Metadata? get metadata => _metadata;
  Records? get records => _records;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_metadata != null) {
      map['_metadata'] = _metadata?.toJson();
    }
    if (_records != null) {
      map['records'] = _records?.toJson();
    }

    return map;
  }
}

/// A ne pas réaliser : 0
/// Stand by : 0
/// Réalisée : 0

class Records {
  Records({
    int? anepasraliser,
    int? standby,
    int? ralise,
  }) {
    _anepasraliser = anepasraliser;
    _standby = standby;
    _ralise = ralise;
  }

  Records.fromJson(dynamic json) {
    _anepasraliser = json['A ne pas réaliser'];
    _standby = json['Stand by'];
    _ralise = json['Réalisée'];
  }
  int? _anepasraliser;
  int? _standby;
  int? _ralise;
  Records copyWith({
    int? anepasraliser,
    int? standby,
    int? ralise,
  }) =>
      Records(
        anepasraliser: anepasraliser ?? _anepasraliser,
        standby: standby ?? _standby,
        ralise: ralise ?? _ralise,
      );
  int? get anepasraliser => _anepasraliser;
  int? get standby => _standby;
  int? get ralise => _ralise;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['A ne pas réaliser'] = _anepasraliser;
    map['Stand by'] = _standby;
    map['Réalisée'] = _ralise;
    return map;
  }
}

/// status_text : "OK"
/// status_code : 200
/// number_of_records : 3
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