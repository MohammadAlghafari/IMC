/*
///AnalyticsWeekModel will be used in the analytics screen which will contain the total numbers of
///of the interventions done by (Technician or Team leader) with interventon type (normal, grip,force grip)
*/


/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":4,"message":"Success!"}
/// records : {"week1":[{"status":4,"total":2}],"week2":[{"status":4,"total":2}],"week3":[{"status":4,"total":2}],"week4":[{"status":4,"total":2}]}
/// errors : []

class AnalyticsWeekModel {
  AnalyticsWeekModel({
    Metadata? metadata,
    Records? records,
  }) {
    _metadata = metadata;
    _records = records;
  }

  AnalyticsWeekModel.fromJson(dynamic json) {
    _metadata = json['_metadata'] != null ? Metadata.fromJson(json['_metadata']) : null;
    _records = json['records'] != null ? Records.fromJson(json['records']) : null;
  }
  Metadata? _metadata;
  Records? _records;

  AnalyticsWeekModel copyWith({
    Metadata? metadata,
    Records? records,
  }) =>
      AnalyticsWeekModel(
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

/// week1 : [{"status":4,"total":2}]
/// week2 : [{"status":4,"total":2}]
/// week3 : [{"status":4,"total":2}]
/// week4 : [{"status":4,"total":2}]

class Records {
  Records({
    List<Week1>? week1,
    List<Week2>? week2,
    List<Week3>? week3,
    List<Week4>? week4,
  }) {
    _week1 = week1;
    _week2 = week2;
    _week3 = week3;
    _week4 = week4;
  }

  Records.fromJson(dynamic json) {
    if (json['week1'] != null) {
      _week1 = [];
      json['week1'].forEach((v) {
        _week1?.add(Week1.fromJson(v));
      });
    }
    if (json['week2'] != null) {
      _week2 = [];
      json['week2'].forEach((v) {
        _week2?.add(Week2.fromJson(v));
      });
    }
    if (json['week3'] != null) {
      _week3 = [];
      json['week3'].forEach((v) {
        _week3?.add(Week3.fromJson(v));
      });
    }
    if (json['week4'] != null) {
      _week4 = [];
      json['week4'].forEach((v) {
        _week4?.add(Week4.fromJson(v));
      });
    }
  }
  List<Week1>? _week1;
  List<Week2>? _week2;
  List<Week3>? _week3;
  List<Week4>? _week4;
  Records copyWith({
    List<Week1>? week1,
    List<Week2>? week2,
    List<Week3>? week3,
    List<Week4>? week4,
  }) =>
      Records(
        week1: week1 ?? _week1,
        week2: week2 ?? _week2,
        week3: week3 ?? _week3,
        week4: week4 ?? _week4,
      );
  List<Week1>? get week1 => _week1;
  List<Week2>? get week2 => _week2;
  List<Week3>? get week3 => _week3;
  List<Week4>? get week4 => _week4;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_week1 != null) {
      map['week1'] = _week1?.map((v) => v.toJson()).toList();
    }
    if (_week2 != null) {
      map['week2'] = _week2?.map((v) => v.toJson()).toList();
    }
    if (_week3 != null) {
      map['week3'] = _week3?.map((v) => v.toJson()).toList();
    }
    if (_week4 != null) {
      map['week4'] = _week4?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// status : 4
/// total : 2

class Week4 {
  Week4({
    int? status,
    int? total,
  }) {
    _status = status;
    _total = total;
  }

  Week4.fromJson(dynamic json) {
    _status = json['status'];
    _total = json['total'];
  }
  int? _status;
  int? _total;
  Week4 copyWith({
    int? status,
    int? total,
  }) =>
      Week4(
        status: status ?? _status,
        total: total ?? _total,
      );
  int? get status => _status;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['total'] = _total;
    return map;
  }
}

/// status : 4
/// total : 2

class Week3 {
  Week3({
    int? status,
    int? total,
  }) {
    _status = status;
    _total = total;
  }

  Week3.fromJson(dynamic json) {
    _status = json['status'];
    _total = json['total'];
  }
  int? _status;
  int? _total;
  Week3 copyWith({
    int? status,
    int? total,
  }) =>
      Week3(
        status: status ?? _status,
        total: total ?? _total,
      );
  int? get status => _status;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['total'] = _total;
    return map;
  }
}

/// status : 4
/// total : 2

class Week2 {
  Week2({
    int? status,
    int? total,
  }) {
    _status = status;
    _total = total;
  }

  Week2.fromJson(dynamic json) {
    _status = json['status'];
    _total = json['total'];
  }
  int? _status;
  int? _total;
  Week2 copyWith({
    int? status,
    int? total,
  }) =>
      Week2(
        status: status ?? _status,
        total: total ?? _total,
      );
  int? get status => _status;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['total'] = _total;
    return map;
  }
}

/// status : 4
/// total : 2

class Week1 {
  Week1({
    int? status,
    int? total,
  }) {
    _status = status;
    _total = total;
  }

  Week1.fromJson(dynamic json) {
    _status = json['status'];
    _total = json['total'];
  }
  int? _status;
  int? _total;
  Week1 copyWith({
    int? status,
    int? total,
  }) =>
      Week1(
        status: status ?? _status,
        total: total ?? _total,
      );
  int? get status => _status;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['total'] = _total;
    return map;
  }
}

/// status_text : "OK"
/// status_code : 200
/// number_of_records : 4
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