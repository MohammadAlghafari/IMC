/*
///AnalyticsTimeModel will be used in the analytics screen which will contain the total time spent
///by the user(Technician or Team leader) for interventions type (normal, grip,force grip)
*/

/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":3,"message":"Success!"}
/// success : {"time_success":[{"status":4,"hours":50}],"time_semiko":[{"status":4,"hours":50}],"time_ko":[{"status":4,"hours":50}]}
/// errors : []

class AnalyticsTimeModel {
  AnalyticsTimeModel({
    Metadata? metadata,
    Records? success,
  }) {
    _metadata = metadata;
    _records = success;
  }

  AnalyticsTimeModel.fromJson(dynamic json) {
    print("analtics_time_model === $json");
    _metadata = json['_metadata'] != null ? Metadata.fromJson(json['_metadata']) : null;
    _records = json['success'] != null ? Records.fromJson(json['success']) : null;
  }
  Metadata? _metadata;
  Records? _records;

  AnalyticsTimeModel copyWith({
    Metadata? metadata,
    Records? success,
  }) =>
      AnalyticsTimeModel(
        metadata: metadata ?? _metadata,
        success: success ?? _records,
      );
  Metadata? get metadata => _metadata;
  Records? get success => _records;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_metadata != null) {
      map['_metadata'] = _metadata?.toJson();
    }
    if (_records != null) {
      map['success'] = _records?.toJson();
    }

    return map;
  }
}

/// time_success : [{"status":4,"hours":50}]
/// time_semiko : [{"status":4,"hours":50}]
/// time_ko : [{"status":4,"hours":50}]

class Records {
  Records({
    List<TimeSuccess>? timeSuccess,
    List<TimeSemiko>? timeSemiko,
    List<TimeKo>? timeKo,
  }) {
    _timeSuccess = timeSuccess;
    _timeSemiko = timeSemiko;
    _timeKo = timeKo;
  }

  Records.fromJson(dynamic json) {
    print("analtics_time_model02 === $json");
    if (json['time_success'] != null) {
      _timeSuccess = [];
      json['time_success'].forEach((v) {
        _timeSuccess?.add(TimeSuccess.fromJson(v));
      });
    }
    if (json['time_semiko'] != null) {
      _timeSemiko = [];
      json['time_semiko'].forEach((v) {
        _timeSemiko?.add(TimeSemiko.fromJson(v));
      });
    }
    if (json['time_ko'] != null) {
      _timeKo = [];
      json['time_ko'].forEach((v) {
        _timeKo?.add(TimeKo.fromJson(v));
      });
    }
  }
  List<TimeSuccess>? _timeSuccess;
  List<TimeSemiko>? _timeSemiko;
  List<TimeKo>? _timeKo;
  Records copyWith({
    List<TimeSuccess>? timeSuccess,
    List<TimeSemiko>? timeSemiko,
    List<TimeKo>? timeKo,
  }) =>
      Records(
        timeSuccess: timeSuccess ?? _timeSuccess,
        timeSemiko: timeSemiko ?? _timeSemiko,
        timeKo: timeKo ?? _timeKo,
      );
  List<TimeSuccess>? get timeSuccess => _timeSuccess;
  List<TimeSemiko>? get timeSemiko => _timeSemiko;
  List<TimeKo>? get timeKo => _timeKo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_timeSuccess != null) {
      map['time_success'] = _timeSuccess?.map((v) => v.toJson()).toList();
    }
    if (_timeSemiko != null) {
      map['time_semiko'] = _timeSemiko?.map((v) => v.toJson()).toList();
    }
    if (_timeKo != null) {
      map['time_ko'] = _timeKo?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// status : 4
/// hours : 50

class TimeKo {
  TimeKo({
    int? status,
    int? hours,
  }) {
    _status = status;
    _hours = hours;
  }

  TimeKo.fromJson(dynamic json) {
    _status = json['status'];
    _hours = json['hours'];
  }
  int? _status;
  int? _hours;
  TimeKo copyWith({
    int? status,
    int? hours,
  }) =>
      TimeKo(
        status: status ?? _status,
        hours: hours ?? _hours,
      );
  int? get status => _status;
  int? get hours => _hours;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['hours'] = _hours;
    return map;
  }
}

/// status : 4
/// hours : 50

class TimeSemiko {
  TimeSemiko({
    int? status,
    int? hours,
  }) {
    _status = status;
    _hours = hours;
  }

  TimeSemiko.fromJson(dynamic json) {
    _status = json['status'];
    _hours = json['hours'];
  }
  int? _status;
  int? _hours;
  TimeSemiko copyWith({
    int? status,
    int? hours,
  }) =>
      TimeSemiko(
        status: status ?? _status,
        hours: hours ?? _hours,
      );
  int? get status => _status;
  int? get hours => _hours;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['hours'] = _hours;
    return map;
  }
}

/// status : 4
/// hours : 50

class TimeSuccess {
  TimeSuccess({
    int? status,
    int? hours,
  }) {
    _status = status;
    _hours = hours;
  }

  TimeSuccess.fromJson(dynamic json) {
    _status = json['status'];
    _hours = json['hours'];
  }
  int? _status;
  int? _hours;
  TimeSuccess copyWith({
    int? status,
    int? hours,
  }) =>
      TimeSuccess(
        status: status ?? _status,
        hours: hours ?? _hours,
      );
  int? get status => _status;
  int? get hours => _hours;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['hours'] = _hours;
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