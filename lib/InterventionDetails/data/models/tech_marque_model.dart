/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":20,"message":"Success!"}
/// records : [{"id":1,"title":"ACTARIS"},{"id":2,"title":"ARNOULD"},{"id":3,"title":"B.F.M"},{"id":4,"title":"BACO"},{"id":5,"title":"CCE"},{"id":6,"title":"CHANDOS"},{"id":7,"title":"FAE"},{"id":8,"title":"GARDY"},{"id":9,"title":"GENERAL ELECTRIC"},{"id":10,"title":"HAGER (GE)"},{"id":11,"title":"HAGER (LEGRAND)"},{"id":12,"title":"IES"},{"id":13,"title":"ITRON (LEGRAND)"},{"id":14,"title":"LANDIS ET GYR"},{"id":15,"title":"MERLIN GERIN"},{"id":16,"title":"SCHLUMBERGER"},{"id":17,"title":"SCHNEIDER ELECTRIQUE"},{"id":18,"title":"THOMSON"},{"id":19,"title":"EATON"},{"id":20,"title":"AUTRE"}]

class TechMarqueModel {
  TechMarqueModel({
      Metadata? metadata, 
      List<Records>? records,}){
    _metadata = metadata;
    _records = records;
}

  TechMarqueModel.fromJson(dynamic json) {
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
TechMarqueModel copyWith({  Metadata? metadata,
  List<Records>? records,
}) => TechMarqueModel(  metadata: metadata ?? _metadata,
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
/// title : "ACTARIS"

class Records {
  Records({
      int? id, 
      String? title,}){
    _id = id;
    _title = title;
}

  Records.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  int? _id;
  String? _title;
Records copyWith({  int? id,
  String? title,
}) => Records(  id: id ?? _id,
  title: title ?? _title,
);
  int? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}

/// status_text : "OK"
/// status_code : 200
/// number_of_records : 20
/// message : "Success!"

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