/*
///An intervention of type RC will need to have many details like(it's start time of intervention, meter number,meter photo etc)
///This model will have all the details needed by the technician for the type(RC,grip,force-grip).
*/

/// id : 0
/// startTimeOfIntervention : ""
/// endTimeOfIntervention : ""
/// latitude : 1.1
/// longitude : 1.1
/// selectedRCInterventionOption : ""
/// confirmMeterReprogramming : false
/// meterReprogrammingImage1 : ""
/// meterReprogrammingImage2 : ""
/// additionalInfoOfMeterReprogramming : ""
/// confirmEnslavementTest : false
/// meterEnslavementTestImage1 : ""
/// meterEnslavementTestImage2 : ""
/// additionalInfoOfEnslavementTest : ""
/// specifyYourAction : ""
/// photosOfAction : [""]
/// additionalInfoOfActions : ""
/// photoOfWiring: ""
/// photoOfNewPoseMeter
/// isGripCase : false
/// gripCaseReason : ""
/// noticeOfPassageImage1 : ""
/// noticeOfPassageImage2 : ""
/// displacementPhotoImage1 : ""
/// displacementPhotoImage2 : ""
/// gripCaseComment : ""

class RCInterventionDetailsModel {
  RCInterventionDetailsModel({
    int? id,
    String? startTimeOfIntervention,
    String? endTimeOfIntervention,
    double? latitude,
    double? longitude,
    String? selectedRCInterventionOption,
    bool? confirmMeterReprogramming,
    String? meterReprogrammingImage1,
    String? meterReprogrammingImage2,
    String? additionalInfoOfMeterReprogramming,
    bool? confirmEnslavementTest,
    String? meterEnslavementTestImage1,
    String? meterEnslavementTestImage2,
    String? additionalInfoOfEnslavementTest,
    String? specifyYourAction,
    List<String>? photosOfAction,
    String? additionalInfoOfActions,
    String? photoOfWiring,
    String? photoOfNewPoseMeter,
    bool? isGripCase,
    String? gripCaseReason,
    String? noticeOfPassageImage1,
    String? noticeOfPassageImage2,
    String? displacementPhotoImage1,
    String? displacementPhotoImage2,
    String? gripCaseComment,
  }) {
    _id = id;
    _startTimeOfIntervention = startTimeOfIntervention;
    _endTimeOfIntervention = endTimeOfIntervention;
    _latitude = latitude;
    _longitude = longitude;
    _selectedRCInterventionOption = selectedRCInterventionOption;
    _confirmMeterReprogramming = confirmMeterReprogramming;
    _meterReprogrammingImage1 = meterReprogrammingImage1;
    _meterReprogrammingImage2 = meterReprogrammingImage2;
    _additionalInfoOfMeterReprogramming = additionalInfoOfMeterReprogramming;
    _confirmEnslavementTest = confirmEnslavementTest;
    _meterEnslavementTestImage1 = meterEnslavementTestImage1;
    _meterEnslavementTestImage2 = meterEnslavementTestImage2;
    _additionalInfoOfEnslavementTest = additionalInfoOfEnslavementTest;
    _specifyYourAction = specifyYourAction;
    _photosOfAction = photosOfAction;
    _additionalInfoOfActions = additionalInfoOfActions;
    _photoOfWiring = photoOfWiring;
    _photoOfNewPoseMeter = photoOfNewPoseMeter;
    _isGripCase = isGripCase;
    _gripCaseReason = gripCaseReason;
    _noticeOfPassageImage1 = noticeOfPassageImage1;
    _noticeOfPassageImage2 = noticeOfPassageImage2;
    _displacementPhotoImage1 = displacementPhotoImage1;
    _displacementPhotoImage2 = displacementPhotoImage2;
    _gripCaseComment = gripCaseComment;
  }

  RCInterventionDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _startTimeOfIntervention = json['startTimeOfIntervention'];
    _endTimeOfIntervention = json['endTimeOfIntervention'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _selectedRCInterventionOption = json['selectedRCInterventionOption'];
    _confirmMeterReprogramming = json['confirmMeterReprogramming'];
    _meterReprogrammingImage1 = json['meterReprogrammingImage1'];
    _meterReprogrammingImage2 = json['meterReprogrammingImage2'];
    _additionalInfoOfMeterReprogramming = json['additionalInfoOfMeterReprogramming'];
    _confirmEnslavementTest = json['confirmEnslavementTest'];
    _meterEnslavementTestImage1 = json['meterEnslavementTestImage1'];
    _meterEnslavementTestImage2 = json['meterEnslavementTestImage2'];
    _additionalInfoOfEnslavementTest = json['additionalInfoOfEnslavementTest'];
    _specifyYourAction = json['specifyYourAction'];
    _photosOfAction = json['photosOfAction'] != null ? json['photosOfAction'].cast<String>() : [];
    _additionalInfoOfActions = json['additionalInfoOfActions'];
    _photoOfWiring = json['photoOfWiring'];
    _photoOfNewPoseMeter = json['photoOfNewPoseMeter'];
    _isGripCase = json['isGripCase'];
    _gripCaseReason = json['gripCaseReason'];
    _noticeOfPassageImage1 = json['noticeOfPassageImage1'];
    _noticeOfPassageImage2 = json['noticeOfPassageImage2'];
    _displacementPhotoImage1 = json['displacementPhotoImage1'];
    _displacementPhotoImage2 = json['displacementPhotoImage2'];
    _gripCaseComment = json['gripCaseComment'];
  }
  int? _id;
  String? _startTimeOfIntervention;
  String? _endTimeOfIntervention;
  double? _latitude;
  double? _longitude;
  String? _selectedRCInterventionOption;
  bool? _confirmMeterReprogramming;
  String? _meterReprogrammingImage1;
  String? _meterReprogrammingImage2;
  String? _additionalInfoOfMeterReprogramming;
  bool? _confirmEnslavementTest;
  String? _meterEnslavementTestImage1;
  String? _meterEnslavementTestImage2;
  String? _additionalInfoOfEnslavementTest;
  String? _specifyYourAction;
  List<String>? _photosOfAction;
  String? _additionalInfoOfActions;
  String? _photoOfWiring;
  String? _photoOfNewPoseMeter;
  bool? _isGripCase;
  String? _gripCaseReason;
  String? _noticeOfPassageImage1;
  String? _noticeOfPassageImage2;
  String? _displacementPhotoImage1;
  String? _displacementPhotoImage2;
  String? _gripCaseComment;
  RCInterventionDetailsModel copyWith({
    int? id,
    String? startTimeOfIntervention,
    String? endTimeOfIntervention,
    double? latitude,
    double? longitude,
    String? selectedRCInterventionOption,
    bool? confirmMeterReprogramming,
    String? meterReprogrammingImage1,
    String? meterReprogrammingImage2,
    String? additionalInfoOfMeterReprogramming,
    bool? confirmEnslavementTest,
    String? meterEnslavementTestImage1,
    String? meterEnslavementTestImage2,
    String? additionalInfoOfEnslavementTest,
    String? specifyYourAction,
    List<String>? photosOfAction,
    String? additionalInfoOfActions,
    String? photoOfWiring,
    String? photoOfNewPoseMeter,
    bool? isGripCase,
    String? gripCaseReason,
    String? noticeOfPassageImage1,
    String? noticeOfPassageImage2,
    String? displacementPhotoImage1,
    String? displacementPhotoImage2,
    String? gripCaseComment,
  }) =>
      RCInterventionDetailsModel(
        id: id ?? _id,
        startTimeOfIntervention: startTimeOfIntervention ?? _startTimeOfIntervention,
        endTimeOfIntervention: endTimeOfIntervention ?? _endTimeOfIntervention,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        selectedRCInterventionOption: selectedRCInterventionOption ?? _selectedRCInterventionOption,
        confirmMeterReprogramming: confirmMeterReprogramming ?? _confirmMeterReprogramming,
        meterReprogrammingImage1: meterReprogrammingImage1 ?? _meterReprogrammingImage1,
        meterReprogrammingImage2: meterReprogrammingImage2 ?? _meterReprogrammingImage2,
        additionalInfoOfMeterReprogramming: additionalInfoOfMeterReprogramming ?? _additionalInfoOfMeterReprogramming,
        confirmEnslavementTest: confirmEnslavementTest ?? _confirmEnslavementTest,
        meterEnslavementTestImage1: meterEnslavementTestImage1 ?? _meterEnslavementTestImage1,
        meterEnslavementTestImage2: meterEnslavementTestImage2 ?? _meterEnslavementTestImage2,
        additionalInfoOfEnslavementTest: additionalInfoOfEnslavementTest ?? _additionalInfoOfEnslavementTest,
        specifyYourAction: specifyYourAction ?? _specifyYourAction,
        photosOfAction: photosOfAction ?? _photosOfAction,
        additionalInfoOfActions: additionalInfoOfActions ?? _additionalInfoOfActions,
        photoOfWiring: photoOfWiring ?? _photoOfWiring,
        photoOfNewPoseMeter: photoOfNewPoseMeter ?? _photoOfNewPoseMeter,
        isGripCase: isGripCase ?? _isGripCase,
        gripCaseReason: gripCaseReason ?? _gripCaseReason,
        noticeOfPassageImage1: noticeOfPassageImage1 ?? _noticeOfPassageImage1,
        noticeOfPassageImage2: noticeOfPassageImage2 ?? _noticeOfPassageImage2,
        displacementPhotoImage1: displacementPhotoImage1 ?? _displacementPhotoImage1,
        displacementPhotoImage2: displacementPhotoImage2 ?? _displacementPhotoImage2,
        gripCaseComment: gripCaseComment ?? _gripCaseComment,
      );
  int? get id => _id;
  String? get startTimeOfIntervention => _startTimeOfIntervention;
  String? get endTimeOfIntervention => _endTimeOfIntervention;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  String? get selectedRCInterventionOption => _selectedRCInterventionOption;
  bool? get confirmMeterReprogramming => _confirmMeterReprogramming;
  String? get meterReprogrammingImage1 => _meterReprogrammingImage1;
  String? get meterReprogrammingImage2 => _meterReprogrammingImage2;
  String? get additionalInfoOfMeterReprogramming => _additionalInfoOfMeterReprogramming;
  bool? get confirmEnslavementTest => _confirmEnslavementTest;
  String? get meterEnslavementTestImage1 => _meterEnslavementTestImage1;
  String? get meterEnslavementTestImage2 => _meterEnslavementTestImage2;
  String? get additionalInfoOfEnslavementTest => _additionalInfoOfEnslavementTest;
  String? get specifyYourAction => _specifyYourAction;
  List<String>? get photosOfAction => _photosOfAction;
  String? get additionalInfoOfActions => _additionalInfoOfActions;
  String? get photoOfWiring => _photoOfWiring;
  String? get photoOfNewPoseMeter => _photoOfNewPoseMeter;
  bool? get isGripCase => _isGripCase;
  String? get gripCaseReason => _gripCaseReason;
  String? get noticeOfPassageImage1 => _noticeOfPassageImage1;
  String? get noticeOfPassageImage2 => _noticeOfPassageImage2;
  String? get displacementPhotoImage1 => _displacementPhotoImage1;
  String? get displacementPhotoImage2 => _displacementPhotoImage2;
  String? get gripCaseComment => _gripCaseComment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['startTimeOfIntervention'] = _startTimeOfIntervention;
    map['endTimeOfIntervention'] = _endTimeOfIntervention;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['selectedRCInterventionOption'] = _selectedRCInterventionOption;
    map['confirmMeterReprogramming'] = _confirmMeterReprogramming;
    map['meterReprogrammingImage1'] = _meterReprogrammingImage1;
    map['meterReprogrammingImage2'] = _meterReprogrammingImage2;
    map['additionalInfoOfMeterReprogramming'] = _additionalInfoOfMeterReprogramming;
    map['confirmEnslavementTest'] = _confirmEnslavementTest;
    map['meterEnslavementTestImage1'] = _meterEnslavementTestImage1;
    map['meterEnslavementTestImage2'] = _meterEnslavementTestImage2;
    map['additionalInfoOfEnslavementTest'] = _additionalInfoOfEnslavementTest;
    map['specifyYourAction'] = _specifyYourAction;
    map['photosOfAction'] = _photosOfAction;
    map['additionalInfoOfActions'] = _additionalInfoOfActions;
    map['photoOfWiring'] = _photoOfWiring;
    map['photoOfNewPoseMeter'] = _photoOfNewPoseMeter;
    map['isGripCase'] = _isGripCase;
    map['gripCaseReason'] = _gripCaseReason;
    map['noticeOfPassageImage1'] = _noticeOfPassageImage1;
    map['noticeOfPassageImage2'] = _noticeOfPassageImage2;
    map['displacementPhotoImage1'] = _displacementPhotoImage1;
    map['displacementPhotoImage2'] = _displacementPhotoImage2;
    map['gripCaseComment'] = _gripCaseComment;
    return map;
  }
}