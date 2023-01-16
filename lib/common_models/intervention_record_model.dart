/*
///InterventionRecordModel will be used for techinician's flow for all type of interventions(normal,rc,grip,force-grip)
/// this model will have all the data required to perform any intervention(like id,intervention schedule date time)
/// it will also contain the details of the client(like id, first name,address).
*/

/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":3,"message":"Success!"}
/// records : [{"id":124,"schedule_start":"2022-11-21 04:00:00","schedule_end":"2022-11-21 06:00:00","start_date":"null","end_date":"null","diff_hours":"null","longitude":"2.351285","latitude":"48.853142","comment":"null","intervention_status_id":2,"visit_id":1,"collaborator_id":7,"intervention_type_id":1,"client":{"id":125,"firstname":"Elton","lastname":"Hamill","title":"Mrs.","pdl_number":"Ducimus eligendi ut.","email":"bins.jayda@rolfson.info","mobile_number":"null","address":"4, avenue Sawayn\n48 202 MarquardtBourg","street":"null","postal_code":"76510","latitude":"48.859006","longitude":"2.355587","installation_instructions":"null","acc_number":"null","status":1,"city":{"id":10,"name":"Lille"},"market":{"id":1,"title":"null"},"technical":{"nb_fils":"null","meter_range":"null","meter_number":"null","meter_type":"null","contract_rate":"null","power_subscription":"null","meter_brand":"null"},"deployment":{"computer_accessible":"NON-ACC","address":", Lille, ","contract":"INACTIF"}}}]

class InterventionRecordModel {
  InterventionRecordModel({
    Metadata? metadata,
    List<Records>? records,}){
    _metadata = metadata;
    _records = records;
  }

  InterventionRecordModel.fromJson(dynamic json) {
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
  InterventionRecordModel copyWith({  Metadata? metadata,
    List<Records>? records,
  }) => InterventionRecordModel(  metadata: metadata ?? _metadata,
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

/// id : 124
/// schedule_start : "2022-11-21 04:00:00"
/// schedule_end : "2022-11-21 06:00:00"
/// start_date : "null"
/// end_date : "null"
/// diff_hours : "null"
/// longitude : "2.351285"
/// latitude : "48.853142"
/// comment : "null"
/// intervention_status_id : 2
/// visit_id : 1
/// collaborator_id : 7
/// intervention_type_id : 1
/// client : {"id":125,"firstname":"Elton","lastname":"Hamill","title":"Mrs.","pdl_number":"Ducimus eligendi ut.","email":"bins.jayda@rolfson.info","mobile_number":"null","address":"4, avenue Sawayn\n48 202 MarquardtBourg","street":"null","postal_code":"76510","latitude":"48.859006","longitude":"2.355587","installation_instructions":"null","acc_number":"null","status":1,"city":{"id":10,"name":"Lille"},"market":{"id":1,"title":"null"},"technical":{"nb_fils":"null","meter_range":"null","meter_number":"null","meter_type":"null","contract_rate":"null","power_subscription":"null","meter_brand":"null"},"deployment":{"computer_accessible":"NON-ACC","address":", Lille, ","contract":"INACTIF"}}

class Records {
  Records({
    int? id,
    String? scheduleStart,
    String? scheduleEnd,
    String? startDate,
    String? endDate,
    String? diffHours,
    String? longitude,
    String? latitude,
    String? comment,
    int? interventionStatusId,
    int? visitId,
    int? collaboratorId,
    int? interventionTypeId,
    Client? client,}){
    _id = id;
    _scheduleStart = scheduleStart;
    _scheduleEnd = scheduleEnd;
    _startDate = startDate;
    _endDate = endDate;
    _diffHours = diffHours;
    _longitude = longitude;
    _latitude = latitude;
    _comment = comment;
    _interventionStatusId = interventionStatusId;
    _visitId = visitId;
    _collaboratorId = collaboratorId;
    _interventionTypeId = interventionTypeId;
    _client = client;
  }

  Records.fromJson(dynamic json) {
    _id = json['id'];
    _scheduleStart = json['schedule_start'];
    _scheduleEnd = json['schedule_end'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _diffHours = json['diff_hours'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _comment = json['comment'];
    _interventionStatusId = json['intervention_status_id'];
    _visitId = json['visit_id'];
    _collaboratorId = json['collaborator_id'];
    _interventionTypeId = json['intervention_type_id'];
    _client = json['client'] != null ? Client.fromJson(json['client']) : null;
  }
  int? _id;
  String? _scheduleStart;
  String? _scheduleEnd;
  String? _startDate;
  String? _endDate;
  String? _diffHours;
  String? _longitude;
  String? _latitude;
  String? _comment;
  int? _interventionStatusId;
  int? _visitId;
  int? _collaboratorId;
  int? _interventionTypeId;
  Client? _client;
  Records copyWith({  int? id,
    String? scheduleStart,
    String? scheduleEnd,
    String? startDate,
    String? endDate,
    String? diffHours,
    String? longitude,
    String? latitude,
    String? comment,
    int? interventionStatusId,
    int? visitId,
    int? collaboratorId,
    int? interventionTypeId,
    Client? client,
  }) => Records(  id: id ?? _id,
    scheduleStart: scheduleStart ?? _scheduleStart,
    scheduleEnd: scheduleEnd ?? _scheduleEnd,
    startDate: startDate ?? _startDate,
    endDate: endDate ?? _endDate,
    diffHours: diffHours ?? _diffHours,
    longitude: longitude ?? _longitude,
    latitude: latitude ?? _latitude,
    comment: comment ?? _comment,
    interventionStatusId: interventionStatusId ?? _interventionStatusId,
    visitId: visitId ?? _visitId,
    collaboratorId: collaboratorId ?? _collaboratorId,
    interventionTypeId: interventionTypeId ?? _interventionTypeId,
    client: client ?? _client,
  );
  int? get id => _id;
  String? get scheduleStart => _scheduleStart;
  String? get scheduleEnd => _scheduleEnd;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get diffHours => _diffHours;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get comment => _comment;
  int? get interventionStatusId => _interventionStatusId;
  int? get visitId => _visitId;
  int? get collaboratorId => _collaboratorId;
  int? get interventionTypeId => _interventionTypeId;
  Client? get client => _client;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['schedule_start'] = _scheduleStart;
    map['schedule_end'] = _scheduleEnd;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['diff_hours'] = _diffHours;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['comment'] = _comment;
    map['intervention_status_id'] = _interventionStatusId;
    map['visit_id'] = _visitId;
    map['collaborator_id'] = _collaboratorId;
    map['intervention_type_id'] = _interventionTypeId;
    if (_client != null) {
      map['client'] = _client?.toJson();
    }
    return map;
  }

}

/// id : 125
/// firstname : "Elton"
/// lastname : "Hamill"
/// title : "Mrs."
/// pdl_number : "Ducimus eligendi ut."
/// email : "bins.jayda@rolfson.info"
/// mobile_number : "null"
/// address : "4, avenue Sawayn\n48 202 MarquardtBourg"
/// street : "null"
/// postal_code : "76510"
/// latitude : "48.859006"
/// longitude : "2.355587"
/// installation_instructions : "null"
/// acc_number : "null"
/// status : 1
/// city : {"id":10,"name":"Lille"}
/// market : {"id":1,"title":"null"}
/// technical : {"nb_fils":"null","meter_range":"null","meter_number":"null","meter_type":"null","contract_rate":"null","power_subscription":"null","meter_brand":"null"}
/// deployment : {"computer_accessible":"NON-ACC","address":", Lille, ","contract":"INACTIF"}

class Client {
  Client({
    int? id,
    String? firstname,
    String? lastname,
    String? title,
    String? pdlNumber,
    String? email,
    String? mobileNumber,
    String? address,
    String? street,
    String? postalCode,
    String? latitude,
    String? longitude,
    String? installationInstructions,
    String? accNumber,
    int? status,
    City? city,
    Market? market,
    Technical? technical,
    Deployment? deployment,}){
    _id = id;
    _firstname = firstname;
    _lastname = lastname;
    _title = title;
    _pdlNumber = pdlNumber;
    _email = email;
    _mobileNumber = mobileNumber;
    _address = address;
    _street = street;
    _postalCode = postalCode;
    _latitude = latitude;
    _longitude = longitude;
    _installationInstructions = installationInstructions;
    _accNumber = accNumber;
    _status = status;
    _city = city;
    _market = market;
    _technical = technical;
    _deployment = deployment;
  }

  Client.fromJson(dynamic json) {
    _id = json['id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _title = json['title'];
    _pdlNumber = json['pdl_number'];
    _email = json['email'];
    _mobileNumber = json['mobile_number'];
    _address = json['address'];
    _street = json['street'];
    _postalCode = json['postal_code'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _installationInstructions = json['installation_instructions'];
    _accNumber = json['acc_number'];
    _status = json['status'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _market = json['market'] != null ? Market.fromJson(json['market']) : null;
    _technical = json['technical'] != null ? Technical.fromJson(json['technical']) : null;
    _deployment = json['deployment'] != null ? Deployment.fromJson(json['deployment']) : null;
  }
  int? _id;
  String? _firstname;
  String? _lastname;
  String? _title;
  String? _pdlNumber;
  String? _email;
  String? _mobileNumber;
  String? _address;
  String? _street;
  String? _postalCode;
  String? _latitude;
  String? _longitude;
  String? _installationInstructions;
  String? _accNumber;
  int? _status;
  City? _city;
  Market? _market;
  Technical? _technical;
  Deployment? _deployment;
  Client copyWith({  int? id,
    String? firstname,
    String? lastname,
    String? title,
    String? pdlNumber,
    String? email,
    String? mobileNumber,
    String? address,
    String? street,
    String? postalCode,
    String? latitude,
    String? longitude,
    String? installationInstructions,
    String? accNumber,
    int? status,
    City? city,
    Market? market,
    Technical? technical,
    Deployment? deployment,
  }) => Client(  id: id ?? _id,
    firstname: firstname ?? _firstname,
    lastname: lastname ?? _lastname,
    title: title ?? _title,
    pdlNumber: pdlNumber ?? _pdlNumber,
    email: email ?? _email,
    mobileNumber: mobileNumber ?? _mobileNumber,
    address: address ?? _address,
    street: street ?? _street,
    postalCode: postalCode ?? _postalCode,
    latitude: latitude ?? _latitude,
    longitude: longitude ?? _longitude,
    installationInstructions: installationInstructions ?? _installationInstructions,
    accNumber: accNumber ?? _accNumber,
    status: status ?? _status,
    city: city ?? _city,
    market: market ?? _market,
    technical: technical ?? _technical,
    deployment: deployment ?? _deployment,
  );
  int? get id => _id;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get title => _title;
  String? get pdlNumber => _pdlNumber;
  String? get email => _email;
  String? get mobileNumber => _mobileNumber;
  String? get address => _address;
  String? get street => _street;
  String? get postalCode => _postalCode;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get installationInstructions => _installationInstructions;
  String? get accNumber => _accNumber;
  int? get status => _status;
  City? get city => _city;
  Market? get market => _market;
  Technical? get technical => _technical;
  Deployment? get deployment => _deployment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['title'] = _title;
    map['pdl_number'] = _pdlNumber;
    map['email'] = _email;
    map['mobile_number'] = _mobileNumber;
    map['address'] = _address;
    map['street'] = _street;
    map['postal_code'] = _postalCode;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['installation_instructions'] = _installationInstructions;
    map['acc_number'] = _accNumber;
    map['status'] = _status;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    if (_market != null) {
      map['market'] = _market?.toJson();
    }
    if (_technical != null) {
      map['technical'] = _technical?.toJson();
    }
    if (_deployment != null) {
      map['deployment'] = _deployment?.toJson();
    }
    return map;
  }

}

/// computer_accessible : "NON-ACC"
/// address : ", Lille, "
/// contract : "INACTIF"

class Deployment {
  Deployment({
    String? computerAccessible,
    String? address,
    String? contract,}){
    _computerAccessible = computerAccessible;
    _address = address;
    _contract = contract;
  }

  Deployment.fromJson(dynamic json) {
    _computerAccessible = json['computer_accessible'];
    _address = json['address'];
    _contract = json['contract'];
  }
  String? _computerAccessible;
  String? _address;
  String? _contract;
  Deployment copyWith({  String? computerAccessible,
    String? address,
    String? contract,
  }) => Deployment(  computerAccessible: computerAccessible ?? _computerAccessible,
    address: address ?? _address,
    contract: contract ?? _contract,
  );
  String? get computerAccessible => _computerAccessible;
  String? get address => _address;
  String? get contract => _contract;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['computer_accessible'] = _computerAccessible;
    map['address'] = _address;
    map['contract'] = _contract;
    return map;
  }

}

/// nb_fils : "null"
/// meter_range : "null"
/// meter_number : "null"
/// meter_type : "null"
/// contract_rate : "null"
/// power_subscription : "null"
/// meter_brand : "null"

class Technical {
  Technical({
    String? nbFils,
    String? meterRange,
    String? meterNumber,
    String? meterType,
    String? contractRate,
    String? powerSubscription,
    String? meterBrand,}){
    _nbFils = nbFils;
    _meterRange = meterRange;
    _meterNumber = meterNumber;
    _meterType = meterType;
    _contractRate = contractRate;
    _powerSubscription = powerSubscription;
    _meterBrand = meterBrand;
  }

  Technical.fromJson(dynamic json) {
    _nbFils = json['nb_fils'];
    _meterRange = json['meter_range'];
    _meterNumber = json['meter_number'];
    _meterType = json['meter_type'];
    _contractRate = json['contract_rate'];
    _powerSubscription = json['power_subscription'];
    _meterBrand = json['meter_brand'];
  }
  String? _nbFils;
  String? _meterRange;
  String? _meterNumber;
  String? _meterType;
  String? _contractRate;
  String? _powerSubscription;
  String? _meterBrand;
  Technical copyWith({  String? nbFils,
    String? meterRange,
    String? meterNumber,
    String? meterType,
    String? contractRate,
    String? powerSubscription,
    String? meterBrand,
  }) => Technical(  nbFils: nbFils ?? _nbFils,
    meterRange: meterRange ?? _meterRange,
    meterNumber: meterNumber ?? _meterNumber,
    meterType: meterType ?? _meterType,
    contractRate: contractRate ?? _contractRate,
    powerSubscription: powerSubscription ?? _powerSubscription,
    meterBrand: meterBrand ?? _meterBrand,
  );
  String? get nbFils => _nbFils;
  String? get meterRange => _meterRange;
  String? get meterNumber => _meterNumber;
  String? get meterType => _meterType;
  String? get contractRate => _contractRate;
  String? get powerSubscription => _powerSubscription;
  String? get meterBrand => _meterBrand;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nb_fils'] = _nbFils;
    map['meter_range'] = _meterRange;
    map['meter_number'] = _meterNumber;
    map['meter_type'] = _meterType;
    map['contract_rate'] = _contractRate;
    map['power_subscription'] = _powerSubscription;
    map['meter_brand'] = _meterBrand;
    return map;
  }

}

/// id : 1
/// title : "null"

class Market {
  Market({
    int? id,
    String? title,}){
    _id = id;
    _title = title;
  }

  Market.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  int? _id;
  String? _title;
  Market copyWith({  int? id,
    String? title,
  }) => Market(  id: id ?? _id,
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

/// id : 10
/// name : "Lille"

class City {
  City({
    int? id,
    String? name,}){
    _id = id;
    _name = name;
  }

  City.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
  City copyWith({  int? id,
    String? name,
  }) => City(  id: id ?? _id,
    name: name ?? _name,
  );
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
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