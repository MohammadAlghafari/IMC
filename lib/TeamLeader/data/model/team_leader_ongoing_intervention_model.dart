/*
///[TeamLeaderOngoingInterventionModel] model will be used in the team leader's home screen which will contain all the
///details required for the ongoing interventions (client_id, schedule, techinician name)
*/

/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":2,"message":"Success!"}
/// records : [{"schedule":"2022-08-22 16:00:00","client_id":1,"team_lead_id":4,"collaboration_id":1,"technician_firstname":"Amisha","technician_lastname":"ITFAQ","technician_email":"amisha.developer@gmail.com","status":3,"client_firstname":"Albert","client_lastname":"Doe","client_address":"Lépaud","client_postal_code":"23170","client_city":"France"},{"schedule":"2022-08-22 20:00:00","client_id":1,"team_lead_id":4,"collaboration_id":1,"technician_firstname":"Amisha","technician_lastname":"ITFAQ","technician_email":"amisha.developer@gmail.com","status":4,"client_firstname":"Albert","client_lastname":"Doe","client_address":"Lépaud","client_postal_code":"23170","client_city":"France"}]

class TeamLeaderOngoingInterventionModel {
  TeamLeaderOngoingInterventionModel({
    Metadata? metadata,
    List<Records>? records,}){
    _metadata = metadata;
    _records = records;
  }

  TeamLeaderOngoingInterventionModel.fromJson(dynamic json) {
    // _metadata = json['_metadata'] != null ? Metadata.fromJson(json['_metadata']) : null;
    if (json['records'] != null) {
      _records = [];
      json['records'].forEach((v) {
        _records?.add(Records.fromJson(v));
      });
    }
  }
  Metadata? _metadata;
  List<Records>? _records;
  TeamLeaderOngoingInterventionModel copyWith({  Metadata? metadata,
    List<Records>? records,
  }) => TeamLeaderOngoingInterventionModel(  metadata: metadata ?? _metadata,
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

/// schedule : "2022-08-22 16:00:00"
/// client_id : 1
/// team_lead_id : 4
/// collaboration_id : 1
/// technician_firstname : "Amisha"
/// technician_lastname : "ITFAQ"
/// technician_email : "amisha.developer@gmail.com"
/// status : 3
/// client_firstname : "Albert"
/// client_lastname : "Doe"
/// client_address : "Lépaud"
/// client_postal_code : "23170"
/// client_city : "France"

class Records {
  Records({
    String? schedule,
    int? clientId,
    int? teamLeadId,
    int? collaborationId,
    String? collaborationPicture,
    String? technicianFirstname,
    String? technicianLastname,
    String? technicianEmail,
    int? status,
    String? clientFirstname,
    String? clientLastname,
    String? clientAddress,
    String? clientPostalCode,
    String? clientCity,}){
    _schedule = schedule;
    _clientId = clientId;
    _teamLeadId = teamLeadId;
    _collaborationId = collaborationId;
    _collaborationPicture= collaborationPicture;
    _technicianFirstname = technicianFirstname;
    _technicianLastname = technicianLastname;
    _technicianEmail = technicianEmail;
    _status = status;
    _clientFirstname = clientFirstname;
    _clientLastname = clientLastname;
    _clientAddress = clientAddress;
    _clientPostalCode = clientPostalCode;
    _clientCity = clientCity;
  }

  Records.fromJson(dynamic json) {
    _schedule = json['schedule'];
    _clientId = json['client_id'];
    _teamLeadId = json['team_lead_id'];
    _collaborationId = json['collaboration_id'];
    _collaborationPicture = json['collaboration_picture'];
    _technicianFirstname = json['technician_firstname'];
    _technicianLastname = json['technician_lastname'];
    _technicianEmail = json['technician_email'];
    _status = json['status'];
    _clientFirstname = json['client_firstname'];
    _clientLastname = json['client_lastname'];
    _clientAddress = json['client_address'];
    _clientPostalCode = json['client_postal_code'];
    _clientCity = json['client_city'];
  }
  String? _schedule;
  int? _clientId;
  int? _teamLeadId;
  int? _collaborationId;
  String? _collaborationPicture;
  String? _technicianFirstname;
  String? _technicianLastname;
  String? _technicianEmail;
  int? _status;
  String? _clientFirstname;
  String? _clientLastname;
  String? _clientAddress;
  String? _clientPostalCode;
  String? _clientCity;
  Records copyWith({  String? schedule,
    int? clientId,
    int? teamLeadId,
    int? collaborationId,
    String? collaborationPicture,
    String? technicianFirstname,
    String? technicianLastname,
    String? technicianEmail,
    int? status,
    String? clientFirstname,
    String? clientLastname,
    String? clientAddress,
    String? clientPostalCode,
    String? clientCity,
  }) => Records(  schedule: schedule ?? _schedule,
    clientId: clientId ?? _clientId,
    teamLeadId: teamLeadId ?? _teamLeadId,
    collaborationId: collaborationId ?? _collaborationId,
    collaborationPicture:collaborationPicture??_collaborationPicture,
    technicianFirstname: technicianFirstname ?? _technicianFirstname,
    technicianLastname: technicianLastname ?? _technicianLastname,
    technicianEmail: technicianEmail ?? _technicianEmail,
    status: status ?? _status,
    clientFirstname: clientFirstname ?? _clientFirstname,
    clientLastname: clientLastname ?? _clientLastname,
    clientAddress: clientAddress ?? _clientAddress,
    clientPostalCode: clientPostalCode ?? _clientPostalCode,
    clientCity: clientCity ?? _clientCity,
  );
  String? get schedule => _schedule;
  int? get clientId => _clientId;
  int? get teamLeadId => _teamLeadId;
  int? get collaborationId => _collaborationId;
  String? get collaborationPicture => _collaborationPicture;
  String? get technicianFirstname => _technicianFirstname;
  String? get technicianLastname => _technicianLastname;
  String? get technicianEmail => _technicianEmail;
  int? get status => _status;
  String? get clientFirstname => _clientFirstname;
  String? get clientLastname => _clientLastname;
  String? get clientAddress => _clientAddress;
  String? get clientPostalCode => _clientPostalCode;
  String? get clientCity => _clientCity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['schedule'] = _schedule;
    map['client_id'] = _clientId;
    map['team_lead_id'] = _teamLeadId;
    map['collaboration_id'] = _collaborationId;
    map['collaboration_picture'] = _collaborationPicture;
    map['technician_firstname'] = _technicianFirstname;
    map['technician_lastname'] = _technicianLastname;
    map['technician_email'] = _technicianEmail;
    map['status'] = _status;
    map['client_firstname'] = _clientFirstname;
    map['client_lastname'] = _clientLastname;
    map['client_address'] = _clientAddress;
    map['client_postal_code'] = _clientPostalCode;
    map['client_city'] = _clientCity;
    return map;
  }

}

/// status_text : "OK"
/// status_code : 200
/// number_of_records : 2
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