/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":0,"message":"success"}
/// records : {"time_remained":-5,"on_break":false}
/// errors : ["break time has been used up for today"]

class BreakTimeModel {
  BreakTimeModel({
      Metadata? metadata, 
      Records? records, 
      List<String>? errors,}){
    _metadata = metadata;
    _records = records;
    _errors = errors;
}

  BreakTimeModel.fromJson(dynamic json) {
    _metadata = json['_metadata'] != null ? Metadata.fromJson(json['_metadata']) : null;
    _records = json['records'] != null ? Records.fromJson(json['records']) : null;
    _errors = json['errors'] != null ? json['errors'].cast<String>() : [];
  }
  Metadata? _metadata;
  Records? _records;
  List<String>? _errors;
BreakTimeModel copyWith({  Metadata? metadata,
  Records? records,
  List<String>? errors,
}) => BreakTimeModel(  metadata: metadata ?? _metadata,
  records: records ?? _records,
  errors: errors ?? _errors,
);
  Metadata? get metadata => _metadata;
  Records? get records => _records;
  List<String>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_metadata != null) {
      map['_metadata'] = _metadata?.toJson();
    }
    if (_records != null) {
      map['records'] = _records?.toJson();
    }
    map['errors'] = _errors;
    return map;
  }

}

/// time_remained : -5
/// on_break : false

class Records {
  Records({
      int? timeRemained, 
      bool? onBreak,}){
    _timeRemained = timeRemained;
}

  Records.fromJson(dynamic json) {
    _timeRemained = json['time_remained'];
  }
  int? _timeRemained;
Records copyWith({  int? timeRemained,
}) => Records(  timeRemained: timeRemained ?? _timeRemained,
);
  int? get timeRemained => _timeRemained;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time_remained'] = _timeRemained;
    return map;
  }

}

/// status_text : "OK"
/// status_code : 200
/// number_of_records : 0
/// message : "success"

class Metadata {
  Metadata({
      String? statusText, 
      int? statusCode, 
      int? numberOfRecords, 
      String? message,}){
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
Metadata copyWith({  String? statusText,
  int? statusCode,
  int? numberOfRecords,
  String? message,
}) => Metadata(  statusText: statusText ?? _statusText,
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