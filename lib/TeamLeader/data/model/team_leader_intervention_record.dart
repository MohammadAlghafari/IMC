/*
///[TeamLeaderInterventionRecord] model will be used for all team leader's flows (home screen, planning day, planning week, planning month)
///it will have details like(user_id, client id, client details, intervention details)
*/
/// _metadata : {"status_text":"OK","status_code":200,"number_of_records":1,"message":"Success!"}
/// records : [{"id":1,"schedule_start":"2022-11-21 15:00:00","schedule_end":"2022-11-21 18:00:00","start_date":"null","end_date":"null","diff_hours":"null","longitude":"null","latitude":"null","comment":"null","visit_status_id":1,"visit_id":1,"collaborator_id":1,"intervention":{"id":1,"schedule_start":"null","schedule_end":"null","start_date":"null","end_date":"null","diff_hours":"null","longitude":"null","latitude":"null","comment":"null","details":{"id":1,"intervention_id":1,"confirm_ppe_ports":0,"confirm_macrons_installation":0,"confirm_top":0,"can_you_get_startedToday":0,"circuit_breaker_brand":"","month":"","year":"","test_of_vat":"","settings_anomaly":"","circuit_breaker_malfuncttion":"","meter_rate":"","full_time_rate":"","off_peak_time":"","is_the_driver_well_positioned":0,"reason_for_driver_not_well_positioned":"","identification_between_phase_and_neutral":"","presence_of_pnt":"","inversion_between_phase_and_material":"","resumption_of_enslavement":"","ict_cabling":"","photos_of_new_meter_installed":"","has_the_circuit_breaker_been_replaced":0,"reson_for_circuit_breaker_non_replacement":"","circuit_breaker_lead":"","reason_for_non_circuit_breaker_lead":"","lead_ccpi":"","indicate_reason_for_circuit_breaker_settings":"","modified_circuit_breaker_capacity":"","calibrated_power":"","reason_for_non_modified_circuit_breaker_capacity":"","status_of_installed_meter":"","enter_the_anomaly_programming":"","serial_number":"","additional_information_programming":"","circuit_breaker_properly_engaged":0,"enter_the_anomaly_circuit_breaker_interlock":"","additional_information_circuit_breaker_interlock":"","customer_feedback_comment":"","is_grip_case":0,"grip_case_reason":"","grip_case_comment":"","created_at":"","updated_at":""}},"client":{"id":26,"firstname":"Benjamin","lastname":"Medhurst","title":"Mr.","pdl_number":"Reprehenderit dicta.","email":"hickle.saul@yundt.info","mobile_number":"null","address":"66, impasse Prohaska\n93 872 Lehner","street":"null","postal_code":"21523","latitude":"48.857416","longitude":"2.355551","installation_instructions":"null","acc_number":"null","status":1,"city":{"id":9,"name":"Bordeaux"},"market":{"id":1,"title":"null"},"technical":{"nb_fils":"null","meter_range":"null","meter_number":"null","meter_type":"null","contract_rate":"null","power_subscription":"null","meter_brand":"null"},"deployment":{"computer_accessible":"NON-ACC","address":", Bordeaux, ","contract":"INACTIF"}}}]

class TeamLeaderInterventionRecord {
  TeamLeaderInterventionRecord({
    Metadata? metadata,
    List<Records>? records,}){
    _metadata = metadata;
    _records = records;
  }

  TeamLeaderInterventionRecord.fromJson(dynamic json) {
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
  TeamLeaderInterventionRecord copyWith({  Metadata? metadata,
    List<Records>? records,
  }) => TeamLeaderInterventionRecord(  metadata: metadata ?? _metadata,
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
/// schedule_start : "2022-11-21 15:00:00"
/// schedule_end : "2022-11-21 18:00:00"
/// start_date : "null"
/// end_date : "null"
/// diff_hours : "null"
/// longitude : "null"
/// latitude : "null"
/// comment : "null"
/// visit_status_id : 1
/// visit_id : 1
/// collaborator_id : 1
/// intervention : {"id":1,"schedule_start":"null","schedule_end":"null","start_date":"null","end_date":"null","diff_hours":"null","longitude":"null","latitude":"null","comment":"null","details":{"id":1,"intervention_id":1,"confirm_ppe_ports":0,"confirm_macrons_installation":0,"confirm_top":0,"can_you_get_startedToday":0,"circuit_breaker_brand":"","month":"","year":"","test_of_vat":"","settings_anomaly":"","circuit_breaker_malfuncttion":"","meter_rate":"","full_time_rate":"","off_peak_time":"","is_the_driver_well_positioned":0,"reason_for_driver_not_well_positioned":"","identification_between_phase_and_neutral":"","presence_of_pnt":"","inversion_between_phase_and_material":"","resumption_of_enslavement":"","ict_cabling":"","photos_of_new_meter_installed":"","has_the_circuit_breaker_been_replaced":0,"reson_for_circuit_breaker_non_replacement":"","circuit_breaker_lead":"","reason_for_non_circuit_breaker_lead":"","lead_ccpi":"","indicate_reason_for_circuit_breaker_settings":"","modified_circuit_breaker_capacity":"","calibrated_power":"","reason_for_non_modified_circuit_breaker_capacity":"","status_of_installed_meter":"","enter_the_anomaly_programming":"","serial_number":"","additional_information_programming":"","circuit_breaker_properly_engaged":0,"enter_the_anomaly_circuit_breaker_interlock":"","additional_information_circuit_breaker_interlock":"","customer_feedback_comment":"","is_grip_case":0,"grip_case_reason":"","grip_case_comment":"","created_at":"","updated_at":""}}
/// client : {"id":26,"firstname":"Benjamin","lastname":"Medhurst","title":"Mr.","pdl_number":"Reprehenderit dicta.","email":"hickle.saul@yundt.info","mobile_number":"null","address":"66, impasse Prohaska\n93 872 Lehner","street":"null","postal_code":"21523","latitude":"48.857416","longitude":"2.355551","installation_instructions":"null","acc_number":"null","status":1,"city":{"id":9,"name":"Bordeaux"},"market":{"id":1,"title":"null"},"technical":{"nb_fils":"null","meter_range":"null","meter_number":"null","meter_type":"null","contract_rate":"null","power_subscription":"null","meter_brand":"null"},"deployment":{"computer_accessible":"NON-ACC","address":", Bordeaux, ","contract":"INACTIF"}}

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
    int? visitStatusId,
    int? visitId,
    int? collaboratorId,
    Intervention? intervention,
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
    _visitStatusId = visitStatusId;
    _visitId = visitId;
    _collaboratorId = collaboratorId;
    _intervention = intervention;
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
    _visitStatusId = json['visit_status_id'];
    _visitId = json['visit_id'];
    _collaboratorId = json['collaborator_id'];
    _intervention = json['intervention'] != null ? Intervention.fromJson(json['intervention']) : null;
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
  int? _visitStatusId;
  int? _visitId;
  int? _collaboratorId;
  Intervention? _intervention;
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
    int? visitStatusId,
    int? visitId,
    int? collaboratorId,
    Intervention? intervention,
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
    visitStatusId: visitStatusId ?? _visitStatusId,
    visitId: visitId ?? _visitId,
    collaboratorId: collaboratorId ?? _collaboratorId,
    intervention: intervention ?? _intervention,
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
  int? get visitStatusId => _visitStatusId;
  int? get visitId => _visitId;
  int? get collaboratorId => _collaboratorId;
  Intervention? get intervention => _intervention;
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
    map['visit_status_id'] = _visitStatusId;
    map['visit_id'] = _visitId;
    map['collaborator_id'] = _collaboratorId;
    if (_intervention != null) {
      map['intervention'] = _intervention?.toJson();
    }
    if (_client != null) {
      map['client'] = _client?.toJson();
    }
    return map;
  }

}

/// id : 26
/// firstname : "Benjamin"
/// lastname : "Medhurst"
/// title : "Mr."
/// pdl_number : "Reprehenderit dicta."
/// email : "hickle.saul@yundt.info"
/// mobile_number : "null"
/// address : "66, impasse Prohaska\n93 872 Lehner"
/// street : "null"
/// postal_code : "21523"
/// latitude : "48.857416"
/// longitude : "2.355551"
/// installation_instructions : "null"
/// acc_number : "null"
/// status : 1
/// city : {"id":9,"name":"Bordeaux"}
/// market : {"id":1,"title":"null"}
/// technical : {"nb_fils":"null","meter_range":"null","meter_number":"null","meter_type":"null","contract_rate":"null","power_subscription":"null","meter_brand":"null"}
/// deployment : {"computer_accessible":"NON-ACC","address":", Bordeaux, ","contract":"INACTIF"}

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
/// address : ", Bordeaux, "
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

/// id : 9
/// name : "Bordeaux"

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

/// id : 1
/// schedule_start : "null"
/// schedule_end : "null"
/// start_date : "null"
/// end_date : "null"
/// diff_hours : "null"
/// longitude : "null"
/// latitude : "null"
/// comment : "null"
/// details : {"id":1,"intervention_id":1,"confirm_ppe_ports":0,"confirm_macrons_installation":0,"confirm_top":0,"can_you_get_startedToday":0,"circuit_breaker_brand":"","month":"","year":"","test_of_vat":"","settings_anomaly":"","circuit_breaker_malfuncttion":"","meter_rate":"","full_time_rate":"","off_peak_time":"","is_the_driver_well_positioned":0,"reason_for_driver_not_well_positioned":"","identification_between_phase_and_neutral":"","presence_of_pnt":"","inversion_between_phase_and_material":"","resumption_of_enslavement":"","ict_cabling":"","photos_of_new_meter_installed":"","has_the_circuit_breaker_been_replaced":0,"reson_for_circuit_breaker_non_replacement":"","circuit_breaker_lead":"","reason_for_non_circuit_breaker_lead":"","lead_ccpi":"","indicate_reason_for_circuit_breaker_settings":"","modified_circuit_breaker_capacity":"","calibrated_power":"","reason_for_non_modified_circuit_breaker_capacity":"","status_of_installed_meter":"","enter_the_anomaly_programming":"","serial_number":"","additional_information_programming":"","circuit_breaker_properly_engaged":0,"enter_the_anomaly_circuit_breaker_interlock":"","additional_information_circuit_breaker_interlock":"","customer_feedback_comment":"","is_grip_case":0,"grip_case_reason":"","grip_case_comment":"","created_at":"","updated_at":""}

class Intervention {
  Intervention({
    int? id,
    String? scheduleStart,
    String? scheduleEnd,
    String? startDate,
    String? endDate,
    String? diffHours,
    String? longitude,
    String? latitude,
    String? comment,
    Details? details,}){
    _id = id;
    _scheduleStart = scheduleStart;
    _scheduleEnd = scheduleEnd;
    _startDate = startDate;
    _endDate = endDate;
    _diffHours = diffHours;
    _longitude = longitude;
    _latitude = latitude;
    _comment = comment;
    _details = details;
  }

  Intervention.fromJson(dynamic json) {
    _id = json['id'];
    _scheduleStart = json['schedule_start'];
    _scheduleEnd = json['schedule_end'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _diffHours = json['diff_hours'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _comment = json['comment'];
    _details = json['details'] != null ? Details.fromJson(json['details']) : null;
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
  Details? _details;
  Intervention copyWith({  int? id,
    String? scheduleStart,
    String? scheduleEnd,
    String? startDate,
    String? endDate,
    String? diffHours,
    String? longitude,
    String? latitude,
    String? comment,
    Details? details,
  }) => Intervention(  id: id ?? _id,
    scheduleStart: scheduleStart ?? _scheduleStart,
    scheduleEnd: scheduleEnd ?? _scheduleEnd,
    startDate: startDate ?? _startDate,
    endDate: endDate ?? _endDate,
    diffHours: diffHours ?? _diffHours,
    longitude: longitude ?? _longitude,
    latitude: latitude ?? _latitude,
    comment: comment ?? _comment,
    details: details ?? _details,
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
  Details? get details => _details;

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
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    return map;
  }

}

/// id : 1
/// intervention_id : 1
/// confirm_ppe_ports : 0
/// confirm_macrons_installation : 0
/// confirm_top : 0
/// can_you_get_startedToday : 0
/// circuit_breaker_brand : ""
/// month : ""
/// year : ""
/// test_of_vat : ""
/// settings_anomaly : ""
/// circuit_breaker_malfuncttion : ""
/// meter_rate : ""
/// full_time_rate : ""
/// off_peak_time : ""
/// is_the_driver_well_positioned : 0
/// reason_for_driver_not_well_positioned : ""
/// identification_between_phase_and_neutral : ""
/// presence_of_pnt : ""
/// inversion_between_phase_and_material : ""
/// resumption_of_enslavement : ""
/// ict_cabling : ""
/// photos_of_new_meter_installed : ""
/// has_the_circuit_breaker_been_replaced : 0
/// reson_for_circuit_breaker_non_replacement : ""
/// circuit_breaker_lead : ""
/// reason_for_non_circuit_breaker_lead : ""
/// lead_ccpi : ""
/// indicate_reason_for_circuit_breaker_settings : ""
/// modified_circuit_breaker_capacity : ""
/// calibrated_power : ""
/// reason_for_non_modified_circuit_breaker_capacity : ""
/// status_of_installed_meter : ""
/// enter_the_anomaly_programming : ""
/// serial_number : ""
/// additional_information_programming : ""
/// circuit_breaker_properly_engaged : 0
/// enter_the_anomaly_circuit_breaker_interlock : ""
/// additional_information_circuit_breaker_interlock : ""
/// customer_feedback_comment : ""
/// is_grip_case : 0
/// grip_case_reason : ""
/// grip_case_comment : ""
/// created_at : ""
/// updated_at : ""

class Details {
  Details({
    int? id,
    int? interventionId,
    int? confirmPpePorts,
    int? confirmMacronsInstallation,
    int? confirmTop,
    int? canYouGetStartedToday,
    String? circuitBreakerBrand,
    String? month,
    String? year,
    String? testOfVat,
    String? settingsAnomaly,
    String? circuitBreakerMalfuncttion,
    String? meterRate,
    String? fullTimeRate,
    String? offPeakTime,
    int? isTheDriverWellPositioned,
    String? reasonForDriverNotWellPositioned,
    String? identificationBetweenPhaseAndNeutral,
    String? presenceOfPnt,
    String? inversionBetweenPhaseAndMaterial,
    String? resumptionOfEnslavement,
    String? ictCabling,
    String? photosOfNewMeterInstalled,
    int? hasTheCircuitBreakerBeenReplaced,
    String? resonForCircuitBreakerNonReplacement,
    String? circuitBreakerLead,
    String? reasonForNonCircuitBreakerLead,
    String? leadCcpi,
    String? indicateReasonForCircuitBreakerSettings,
    String? modifiedCircuitBreakerCapacity,
    String? calibratedPower,
    String? reasonForNonModifiedCircuitBreakerCapacity,
    String? statusOfInstalledMeter,
    String? enterTheAnomalyProgramming,
    String? serialNumber,
    String? additionalInformationProgramming,
    int? circuitBreakerProperlyEngaged,
    String? enterTheAnomalyCircuitBreakerInterlock,
    String? additionalInformationCircuitBreakerInterlock,
    String? customerFeedbackComment,
    int? isGripCase,
    String? gripCaseReason,
    String? gripCaseComment,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _interventionId = interventionId;
    _confirmPpePorts = confirmPpePorts;
    _confirmMacronsInstallation = confirmMacronsInstallation;
    _confirmTop = confirmTop;
    _canYouGetStartedToday = canYouGetStartedToday;
    _circuitBreakerBrand = circuitBreakerBrand;
    _month = month;
    _year = year;
    _testOfVat = testOfVat;
    _settingsAnomaly = settingsAnomaly;
    _circuitBreakerMalfuncttion = circuitBreakerMalfuncttion;
    _meterRate = meterRate;
    _fullTimeRate = fullTimeRate;
    _offPeakTime = offPeakTime;
    _isTheDriverWellPositioned = isTheDriverWellPositioned;
    _reasonForDriverNotWellPositioned = reasonForDriverNotWellPositioned;
    _identificationBetweenPhaseAndNeutral = identificationBetweenPhaseAndNeutral;
    _presenceOfPnt = presenceOfPnt;
    _inversionBetweenPhaseAndMaterial = inversionBetweenPhaseAndMaterial;
    _resumptionOfEnslavement = resumptionOfEnslavement;
    _ictCabling = ictCabling;
    _photosOfNewMeterInstalled = photosOfNewMeterInstalled;
    _hasTheCircuitBreakerBeenReplaced = hasTheCircuitBreakerBeenReplaced;
    _resonForCircuitBreakerNonReplacement = resonForCircuitBreakerNonReplacement;
    _circuitBreakerLead = circuitBreakerLead;
    _reasonForNonCircuitBreakerLead = reasonForNonCircuitBreakerLead;
    _leadCcpi = leadCcpi;
    _indicateReasonForCircuitBreakerSettings = indicateReasonForCircuitBreakerSettings;
    _modifiedCircuitBreakerCapacity = modifiedCircuitBreakerCapacity;
    _calibratedPower = calibratedPower;
    _reasonForNonModifiedCircuitBreakerCapacity = reasonForNonModifiedCircuitBreakerCapacity;
    _statusOfInstalledMeter = statusOfInstalledMeter;
    _enterTheAnomalyProgramming = enterTheAnomalyProgramming;
    _serialNumber = serialNumber;
    _additionalInformationProgramming = additionalInformationProgramming;
    _circuitBreakerProperlyEngaged = circuitBreakerProperlyEngaged;
    _enterTheAnomalyCircuitBreakerInterlock = enterTheAnomalyCircuitBreakerInterlock;
    _additionalInformationCircuitBreakerInterlock = additionalInformationCircuitBreakerInterlock;
    _customerFeedbackComment = customerFeedbackComment;
    _isGripCase = isGripCase;
    _gripCaseReason = gripCaseReason;
    _gripCaseComment = gripCaseComment;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Details.fromJson(dynamic json) {
    _id = json['id'];
    _interventionId = json['intervention_id'];
    _confirmPpePorts = json['confirm_ppe_ports'];
    _confirmMacronsInstallation = json['confirm_macrons_installation'];
    _confirmTop = json['confirm_top'];
    _canYouGetStartedToday = json['can_you_get_startedToday'];
    _circuitBreakerBrand = json['circuit_breaker_brand'];
    _month = json['month'];
    _year = json['year'];
    _testOfVat = json['test_of_vat'];
    _settingsAnomaly = json['settings_anomaly'];
    _circuitBreakerMalfuncttion = json['circuit_breaker_malfuncttion'];
    _meterRate = json['meter_rate'];
    _fullTimeRate = json['full_time_rate'];
    _offPeakTime = json['off_peak_time'];
    _isTheDriverWellPositioned = json['is_the_driver_well_positioned'];
    _reasonForDriverNotWellPositioned = json['reason_for_driver_not_well_positioned'];
    _identificationBetweenPhaseAndNeutral = json['identification_between_phase_and_neutral'];
    _presenceOfPnt = json['presence_of_pnt'];
    _inversionBetweenPhaseAndMaterial = json['inversion_between_phase_and_material'];
    _resumptionOfEnslavement = json['resumption_of_enslavement'];
    _ictCabling = json['ict_cabling'];
    _photosOfNewMeterInstalled = json['photos_of_new_meter_installed'];
    _hasTheCircuitBreakerBeenReplaced = json['has_the_circuit_breaker_been_replaced'];
    _resonForCircuitBreakerNonReplacement = json['reson_for_circuit_breaker_non_replacement'];
    _circuitBreakerLead = json['circuit_breaker_lead'];
    _reasonForNonCircuitBreakerLead = json['reason_for_non_circuit_breaker_lead'];
    _leadCcpi = json['lead_ccpi'];
    _indicateReasonForCircuitBreakerSettings = json['indicate_reason_for_circuit_breaker_settings'];
    _modifiedCircuitBreakerCapacity = json['modified_circuit_breaker_capacity'];
    _calibratedPower = json['calibrated_power'];
    _reasonForNonModifiedCircuitBreakerCapacity = json['reason_for_non_modified_circuit_breaker_capacity'];
    _statusOfInstalledMeter = json['status_of_installed_meter'];
    _enterTheAnomalyProgramming = json['enter_the_anomaly_programming'];
    _serialNumber = json['serial_number'];
    _additionalInformationProgramming = json['additional_information_programming'];
    _circuitBreakerProperlyEngaged = json['circuit_breaker_properly_engaged'];
    _enterTheAnomalyCircuitBreakerInterlock = json['enter_the_anomaly_circuit_breaker_interlock'];
    _additionalInformationCircuitBreakerInterlock = json['additional_information_circuit_breaker_interlock'];
    _customerFeedbackComment = json['customer_feedback_comment'];
    _isGripCase = json['is_grip_case'];
    _gripCaseReason = json['grip_case_reason'];
    _gripCaseComment = json['grip_case_comment'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _interventionId;
  int? _confirmPpePorts;
  int? _confirmMacronsInstallation;
  int? _confirmTop;
  int? _canYouGetStartedToday;
  String? _circuitBreakerBrand;
  String? _month;
  String? _year;
  String? _testOfVat;
  String? _settingsAnomaly;
  String? _circuitBreakerMalfuncttion;
  String? _meterRate;
  String? _fullTimeRate;
  String? _offPeakTime;
  int? _isTheDriverWellPositioned;
  String? _reasonForDriverNotWellPositioned;
  String? _identificationBetweenPhaseAndNeutral;
  String? _presenceOfPnt;
  String? _inversionBetweenPhaseAndMaterial;
  String? _resumptionOfEnslavement;
  String? _ictCabling;
  String? _photosOfNewMeterInstalled;
  int? _hasTheCircuitBreakerBeenReplaced;
  String? _resonForCircuitBreakerNonReplacement;
  String? _circuitBreakerLead;
  String? _reasonForNonCircuitBreakerLead;
  String? _leadCcpi;
  String? _indicateReasonForCircuitBreakerSettings;
  String? _modifiedCircuitBreakerCapacity;
  String? _calibratedPower;
  String? _reasonForNonModifiedCircuitBreakerCapacity;
  String? _statusOfInstalledMeter;
  String? _enterTheAnomalyProgramming;
  String? _serialNumber;
  String? _additionalInformationProgramming;
  int? _circuitBreakerProperlyEngaged;
  String? _enterTheAnomalyCircuitBreakerInterlock;
  String? _additionalInformationCircuitBreakerInterlock;
  String? _customerFeedbackComment;
  int? _isGripCase;
  String? _gripCaseReason;
  String? _gripCaseComment;
  String? _createdAt;
  String? _updatedAt;
  Details copyWith({  int? id,
    int? interventionId,
    int? confirmPpePorts,
    int? confirmMacronsInstallation,
    int? confirmTop,
    int? canYouGetStartedToday,
    String? circuitBreakerBrand,
    String? month,
    String? year,
    String? testOfVat,
    String? settingsAnomaly,
    String? circuitBreakerMalfuncttion,
    String? meterRate,
    String? fullTimeRate,
    String? offPeakTime,
    int? isTheDriverWellPositioned,
    String? reasonForDriverNotWellPositioned,
    String? identificationBetweenPhaseAndNeutral,
    String? presenceOfPnt,
    String? inversionBetweenPhaseAndMaterial,
    String? resumptionOfEnslavement,
    String? ictCabling,
    String? photosOfNewMeterInstalled,
    int? hasTheCircuitBreakerBeenReplaced,
    String? resonForCircuitBreakerNonReplacement,
    String? circuitBreakerLead,
    String? reasonForNonCircuitBreakerLead,
    String? leadCcpi,
    String? indicateReasonForCircuitBreakerSettings,
    String? modifiedCircuitBreakerCapacity,
    String? calibratedPower,
    String? reasonForNonModifiedCircuitBreakerCapacity,
    String? statusOfInstalledMeter,
    String? enterTheAnomalyProgramming,
    String? serialNumber,
    String? additionalInformationProgramming,
    int? circuitBreakerProperlyEngaged,
    String? enterTheAnomalyCircuitBreakerInterlock,
    String? additionalInformationCircuitBreakerInterlock,
    String? customerFeedbackComment,
    int? isGripCase,
    String? gripCaseReason,
    String? gripCaseComment,
    String? createdAt,
    String? updatedAt,
  }) => Details(  id: id ?? _id,
    interventionId: interventionId ?? _interventionId,
    confirmPpePorts: confirmPpePorts ?? _confirmPpePorts,
    confirmMacronsInstallation: confirmMacronsInstallation ?? _confirmMacronsInstallation,
    confirmTop: confirmTop ?? _confirmTop,
    canYouGetStartedToday: canYouGetStartedToday ?? _canYouGetStartedToday,
    circuitBreakerBrand: circuitBreakerBrand ?? _circuitBreakerBrand,
    month: month ?? _month,
    year: year ?? _year,
    testOfVat: testOfVat ?? _testOfVat,
    settingsAnomaly: settingsAnomaly ?? _settingsAnomaly,
    circuitBreakerMalfuncttion: circuitBreakerMalfuncttion ?? _circuitBreakerMalfuncttion,
    meterRate: meterRate ?? _meterRate,
    fullTimeRate: fullTimeRate ?? _fullTimeRate,
    offPeakTime: offPeakTime ?? _offPeakTime,
    isTheDriverWellPositioned: isTheDriverWellPositioned ?? _isTheDriverWellPositioned,
    reasonForDriverNotWellPositioned: reasonForDriverNotWellPositioned ?? _reasonForDriverNotWellPositioned,
    identificationBetweenPhaseAndNeutral: identificationBetweenPhaseAndNeutral ?? _identificationBetweenPhaseAndNeutral,
    presenceOfPnt: presenceOfPnt ?? _presenceOfPnt,
    inversionBetweenPhaseAndMaterial: inversionBetweenPhaseAndMaterial ?? _inversionBetweenPhaseAndMaterial,
    resumptionOfEnslavement: resumptionOfEnslavement ?? _resumptionOfEnslavement,
    ictCabling: ictCabling ?? _ictCabling,
    photosOfNewMeterInstalled: photosOfNewMeterInstalled ?? _photosOfNewMeterInstalled,
    hasTheCircuitBreakerBeenReplaced: hasTheCircuitBreakerBeenReplaced ?? _hasTheCircuitBreakerBeenReplaced,
    resonForCircuitBreakerNonReplacement: resonForCircuitBreakerNonReplacement ?? _resonForCircuitBreakerNonReplacement,
    circuitBreakerLead: circuitBreakerLead ?? _circuitBreakerLead,
    reasonForNonCircuitBreakerLead: reasonForNonCircuitBreakerLead ?? _reasonForNonCircuitBreakerLead,
    leadCcpi: leadCcpi ?? _leadCcpi,
    indicateReasonForCircuitBreakerSettings: indicateReasonForCircuitBreakerSettings ?? _indicateReasonForCircuitBreakerSettings,
    modifiedCircuitBreakerCapacity: modifiedCircuitBreakerCapacity ?? _modifiedCircuitBreakerCapacity,
    calibratedPower: calibratedPower ?? _calibratedPower,
    reasonForNonModifiedCircuitBreakerCapacity: reasonForNonModifiedCircuitBreakerCapacity ?? _reasonForNonModifiedCircuitBreakerCapacity,
    statusOfInstalledMeter: statusOfInstalledMeter ?? _statusOfInstalledMeter,
    enterTheAnomalyProgramming: enterTheAnomalyProgramming ?? _enterTheAnomalyProgramming,
    serialNumber: serialNumber ?? _serialNumber,
    additionalInformationProgramming: additionalInformationProgramming ?? _additionalInformationProgramming,
    circuitBreakerProperlyEngaged: circuitBreakerProperlyEngaged ?? _circuitBreakerProperlyEngaged,
    enterTheAnomalyCircuitBreakerInterlock: enterTheAnomalyCircuitBreakerInterlock ?? _enterTheAnomalyCircuitBreakerInterlock,
    additionalInformationCircuitBreakerInterlock: additionalInformationCircuitBreakerInterlock ?? _additionalInformationCircuitBreakerInterlock,
    customerFeedbackComment: customerFeedbackComment ?? _customerFeedbackComment,
    isGripCase: isGripCase ?? _isGripCase,
    gripCaseReason: gripCaseReason ?? _gripCaseReason,
    gripCaseComment: gripCaseComment ?? _gripCaseComment,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  int? get id => _id;
  int? get interventionId => _interventionId;
  int? get confirmPpePorts => _confirmPpePorts;
  int? get confirmMacronsInstallation => _confirmMacronsInstallation;
  int? get confirmTop => _confirmTop;
  int? get canYouGetStartedToday => _canYouGetStartedToday;
  String? get circuitBreakerBrand => _circuitBreakerBrand;
  String? get month => _month;
  String? get year => _year;
  String? get testOfVat => _testOfVat;
  String? get settingsAnomaly => _settingsAnomaly;
  String? get circuitBreakerMalfuncttion => _circuitBreakerMalfuncttion;
  String? get meterRate => _meterRate;
  String? get fullTimeRate => _fullTimeRate;
  String? get offPeakTime => _offPeakTime;
  int? get isTheDriverWellPositioned => _isTheDriverWellPositioned;
  String? get reasonForDriverNotWellPositioned => _reasonForDriverNotWellPositioned;
  String? get identificationBetweenPhaseAndNeutral => _identificationBetweenPhaseAndNeutral;
  String? get presenceOfPnt => _presenceOfPnt;
  String? get inversionBetweenPhaseAndMaterial => _inversionBetweenPhaseAndMaterial;
  String? get resumptionOfEnslavement => _resumptionOfEnslavement;
  String? get ictCabling => _ictCabling;
  String? get photosOfNewMeterInstalled => _photosOfNewMeterInstalled;
  int? get hasTheCircuitBreakerBeenReplaced => _hasTheCircuitBreakerBeenReplaced;
  String? get resonForCircuitBreakerNonReplacement => _resonForCircuitBreakerNonReplacement;
  String? get circuitBreakerLead => _circuitBreakerLead;
  String? get reasonForNonCircuitBreakerLead => _reasonForNonCircuitBreakerLead;
  String? get leadCcpi => _leadCcpi;
  String? get indicateReasonForCircuitBreakerSettings => _indicateReasonForCircuitBreakerSettings;
  String? get modifiedCircuitBreakerCapacity => _modifiedCircuitBreakerCapacity;
  String? get calibratedPower => _calibratedPower;
  String? get reasonForNonModifiedCircuitBreakerCapacity => _reasonForNonModifiedCircuitBreakerCapacity;
  String? get statusOfInstalledMeter => _statusOfInstalledMeter;
  String? get enterTheAnomalyProgramming => _enterTheAnomalyProgramming;
  String? get serialNumber => _serialNumber;
  String? get additionalInformationProgramming => _additionalInformationProgramming;
  int? get circuitBreakerProperlyEngaged => _circuitBreakerProperlyEngaged;
  String? get enterTheAnomalyCircuitBreakerInterlock => _enterTheAnomalyCircuitBreakerInterlock;
  String? get additionalInformationCircuitBreakerInterlock => _additionalInformationCircuitBreakerInterlock;
  String? get customerFeedbackComment => _customerFeedbackComment;
  int? get isGripCase => _isGripCase;
  String? get gripCaseReason => _gripCaseReason;
  String? get gripCaseComment => _gripCaseComment;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['intervention_id'] = _interventionId;
    map['confirm_ppe_ports'] = _confirmPpePorts;
    map['confirm_macrons_installation'] = _confirmMacronsInstallation;
    map['confirm_top'] = _confirmTop;
    map['can_you_get_startedToday'] = _canYouGetStartedToday;
    map['circuit_breaker_brand'] = _circuitBreakerBrand;
    map['month'] = _month;
    map['year'] = _year;
    map['test_of_vat'] = _testOfVat;
    map['settings_anomaly'] = _settingsAnomaly;
    map['circuit_breaker_malfuncttion'] = _circuitBreakerMalfuncttion;
    map['meter_rate'] = _meterRate;
    map['full_time_rate'] = _fullTimeRate;
    map['off_peak_time'] = _offPeakTime;
    map['is_the_driver_well_positioned'] = _isTheDriverWellPositioned;
    map['reason_for_driver_not_well_positioned'] = _reasonForDriverNotWellPositioned;
    map['identification_between_phase_and_neutral'] = _identificationBetweenPhaseAndNeutral;
    map['presence_of_pnt'] = _presenceOfPnt;
    map['inversion_between_phase_and_material'] = _inversionBetweenPhaseAndMaterial;
    map['resumption_of_enslavement'] = _resumptionOfEnslavement;
    map['ict_cabling'] = _ictCabling;
    map['photos_of_new_meter_installed'] = _photosOfNewMeterInstalled;
    map['has_the_circuit_breaker_been_replaced'] = _hasTheCircuitBreakerBeenReplaced;
    map['reson_for_circuit_breaker_non_replacement'] = _resonForCircuitBreakerNonReplacement;
    map['circuit_breaker_lead'] = _circuitBreakerLead;
    map['reason_for_non_circuit_breaker_lead'] = _reasonForNonCircuitBreakerLead;
    map['lead_ccpi'] = _leadCcpi;
    map['indicate_reason_for_circuit_breaker_settings'] = _indicateReasonForCircuitBreakerSettings;
    map['modified_circuit_breaker_capacity'] = _modifiedCircuitBreakerCapacity;
    map['calibrated_power'] = _calibratedPower;
    map['reason_for_non_modified_circuit_breaker_capacity'] = _reasonForNonModifiedCircuitBreakerCapacity;
    map['status_of_installed_meter'] = _statusOfInstalledMeter;
    map['enter_the_anomaly_programming'] = _enterTheAnomalyProgramming;
    map['serial_number'] = _serialNumber;
    map['additional_information_programming'] = _additionalInformationProgramming;
    map['circuit_breaker_properly_engaged'] = _circuitBreakerProperlyEngaged;
    map['enter_the_anomaly_circuit_breaker_interlock'] = _enterTheAnomalyCircuitBreakerInterlock;
    map['additional_information_circuit_breaker_interlock'] = _additionalInformationCircuitBreakerInterlock;
    map['customer_feedback_comment'] = _customerFeedbackComment;
    map['is_grip_case'] = _isGripCase;
    map['grip_case_reason'] = _gripCaseReason;
    map['grip_case_comment'] = _gripCaseComment;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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