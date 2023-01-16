/*
///An intervention will need to have many details like(it's start time of intervention, meter number,meter photo etc)
///This model will have all the details needed by the technician for the type(normal,grip,force-grip).
*/
/// startTimeOfIntervention : ""
/// endTimeOfIntervention : ""
/// latitude : 18.55
/// longitude : 16.77
/// localMeterImage : ""
/// meterNumberImage : ""
/// countingPanelImage : ""
/// confirmPpePorts : true
/// confirmMacronsInstallation : true
/// confirmTop : true
/// canYouGetStartedToday : false
/// circuitBreakerBrand : ""
/// month : ""
/// year : ""
/// serialNumberScanImage : ""
/// sizeControlImage : ""
/// testOfVat : false
/// settingsAnomaly : false
/// circuitBreakerMalfuncttion : false
/// meterRate : ""
/// fullTimeRate : ""
/// offPeakTime : ""
/// photoOfIndexImage : [""]
/// positionOfPhaseConductorImage : ""
/// isTheDriverWellPositioned : false
/// reasonFOrDriverNotWellPositioned : ""
/// beforeCcpiLoggingImage1 : ""
/// beforeCcpiLoggingImage2 : ""
/// afterCcpiLoggingImage1 : ""
/// afterCcpiLoggingImage2 : ""
/// identificationBetweenPhaseAndNeutral : false
/// oldMeterImage : ""
/// terminalBlockTightenedPowerImage : ""
/// terminalCoverPutBackInPlaceImage : ""
/// oldMeterDepositedImage : ""
/// electricalEquipmentDepositedImage : ""
/// enterAdditionallyMaterial : [""]
/// presenceOfPnt : false
/// inversionBetweenPhaseAndMaterial : false
/// resumptionOfEnslavement : false
/// ictCabling : false
/// photoOfWiringImage : ""
/// photosOfNewMeterInstalled : [""]
/// hasTheCircuitBreakerBeenReplaced : true
/// resonForCircuitBreakerNonReplacement : ""
/// circuitBreakerLead : false
/// reasonForNoncircuitBreakerLead : ""
/// leadCCPI : true
/// indicateReasonForCircuitBreakerSettings : ""
/// circuitBreakerGuageImage : ""
/// modifiedCircuitBreakerCapacity : false
/// calibratedPower : ""
/// reasonForNonModifiedCircuitBreakerCapacity : ""
/// statusOfInstalledMeter : false
/// enterTheAnomalyProgramming : ""
/// serialNumber : ""
/// meterAnomalyImage : ""
/// additionalInformationProgramming : ""
/// circuitBreakerProperlyEngaged : false
/// enterTheAnomalyCircuitBreakerInterlock : ""
/// additionalInformationCircuitBreakerInterlock : ""
/// customerFeedbackComment : ""
/// customerSignatureImage : ""
/// isGripCase : false
/// gripCaseReason : ""
/// noticeOfPassageImage1 : ""
/// noticeOfPassageImage2 : ""
/// displacementPhotoImage1 : ""
/// displacementPhotoImage2 : ""
/// gripCaseComment : ""

class InterventionDetailsModel {
  InterventionDetailsModel({
    int? id,
    String? startTimeOfIntervention,
    String? endTimeOfIntervention,
    double? latitude,
    double? longitude,
    String? localMeterImage,
    String? meterNumberImage,
    String? countingPanelImage,
    bool? confirmPpePorts,
    bool? confirmMacronsInstallation,
    bool? confirmTop,
    bool? canYouGetStartedToday,
    String? circuitBreakerBrand,
    String? month,
    String? year,
    String? serialNumberScanImage,
    String? sizeControlImage,
    bool? testOfVat,
    bool? settingsAnomaly,
    bool? circuitBreakerMalfuncttion,
    String? meterRate,
    String? fullTimeRate,
    String? offPeakTime,
    List<String>? photoOfIndexImage,
    String? positionOfPhaseConductorImage,
    bool? isTheDriverWellPositioned,
    String? reasonFOrDriverNotWellPositioned,
    String? beforeCcpiLoggingImage1,
    String? beforeCcpiLoggingImage2,
    String? afterCcpiLoggingImage1,
    String? afterCcpiLoggingImage2,
    bool? identificationBetweenPhaseAndNeutral,
    String? oldMeterImage,
    String? terminalBlockTightenedPowerImage,
    String? terminalCoverPutBackInPlaceImage,
    String? oldMeterDepositedImage,
    String? electricalEquipmentDepositedImage,
    List<String>? enterAdditionallyMaterial,
    bool? presenceOfPnt,
    bool? inversionBetweenPhaseAndMaterial,
    bool? resumptionOfEnslavement,
    bool? ictCabling,
    String? photoOfWiringImage,
    List<String>? photosOfNewMeterInstalled,
    bool? hasTheCircuitBreakerBeenReplaced,
    String? resonForCircuitBreakerNonReplacement,
    bool? circuitBreakerLead,
    String? reasonForNoncircuitBreakerLead,
    bool? leadCCPI,
    String? indicateReasonForCircuitBreakerSettings,
    String? circuitBreakerGuageImage,
    bool? modifiedCircuitBreakerCapacity,
    String? calibratedPower,
    String? reasonForNonModifiedCircuitBreakerCapacity,
    bool? statusOfInstalledMeter,
    String? enterTheAnomalyProgramming,
    String? serialNumber,
    String? meterAnomalyImage,
    String? additionalInformationProgramming,
    bool? circuitBreakerProperlyEngaged,
    String? enterTheAnomalyCircuitBreakerInterlock,
    String? additionalInformationCircuitBreakerInterlock,
    String? customerFeedbackComment,
    String? customerSignatureImage,
    bool? customerSignAdded,
    bool? isGripCase,
    String? gripCaseReason,
    String? noticeOfPassageImage1,
    String? noticeOfPassageImage2,
    String? displacementPhotoImage1,
    String? displacementPhotoImage2,
    String? gripCaseComment,}){
    _id = id;
    _startTimeOfIntervention = startTimeOfIntervention;
    _endTimeOfIntervention = endTimeOfIntervention;
    _latitude = latitude;
    _longitude = longitude;
    _localMeterImage = localMeterImage;
    _meterNumberImage = meterNumberImage;
    _countingPanelImage = countingPanelImage;
    _confirmPpePorts = confirmPpePorts;
    _confirmMacronsInstallation = confirmMacronsInstallation;
    _confirmTop = confirmTop;
    _canYouGetStartedToday = canYouGetStartedToday;
    _circuitBreakerBrand = circuitBreakerBrand;
    _month = month;
    _year = year;
    _serialNumberScanImage = serialNumberScanImage;
    _sizeControlImage = sizeControlImage;
    _testOfVat = testOfVat;
    _settingsAnomaly = settingsAnomaly;
    _circuitBreakerMalfuncttion = circuitBreakerMalfuncttion;
    _meterRate = meterRate;
    _fullTimeRate = fullTimeRate;
    _offPeakTime = offPeakTime;
    _photoOfIndexImage = photoOfIndexImage;
    _positionOfPhaseConductorImage = positionOfPhaseConductorImage;
    _isTheDriverWellPositioned = isTheDriverWellPositioned;
    _reasonFOrDriverNotWellPositioned = reasonFOrDriverNotWellPositioned;
    _beforeCcpiLoggingImage1 = beforeCcpiLoggingImage1;
    _beforeCcpiLoggingImage2 = beforeCcpiLoggingImage2;
    _afterCcpiLoggingImage1 = afterCcpiLoggingImage1;
    _afterCcpiLoggingImage2 = afterCcpiLoggingImage2;
    _identificationBetweenPhaseAndNeutral =
        identificationBetweenPhaseAndNeutral;
    _oldMeterImage = oldMeterImage;
    _terminalBlockTightenedPowerImage = terminalBlockTightenedPowerImage;
    _terminalCoverPutBackInPlaceImage = terminalCoverPutBackInPlaceImage;
    _oldMeterDepositedImage = oldMeterDepositedImage;
    _electricalEquipmentDepositedImage = electricalEquipmentDepositedImage;
    _enterAdditionallyMaterial = enterAdditionallyMaterial;
    _presenceOfPnt = presenceOfPnt;
    _inversionBetweenPhaseAndMaterial = inversionBetweenPhaseAndMaterial;
    _resumptionOfEnslavement = resumptionOfEnslavement;
    _ictCabling = ictCabling;
    _photoOfWiringImage = photoOfWiringImage;
    _photosOfNewMeterInstalled = photosOfNewMeterInstalled;
    _hasTheCircuitBreakerBeenReplaced = hasTheCircuitBreakerBeenReplaced;
    _resonForCircuitBreakerNonReplacement = resonForCircuitBreakerNonReplacement;
    _circuitBreakerLead = circuitBreakerLead;
    _reasonForNoncircuitBreakerLead = reasonForNoncircuitBreakerLead;
    _leadCCPI = leadCCPI;
    _indicateReasonForCircuitBreakerSettings = indicateReasonForCircuitBreakerSettings;
    _circuitBreakerGuageImage = circuitBreakerGuageImage;
    _modifiedCircuitBreakerCapacity = modifiedCircuitBreakerCapacity;
    _calibratedPower = calibratedPower;
    _reasonForNonModifiedCircuitBreakerCapacity = reasonForNonModifiedCircuitBreakerCapacity;
    _statusOfInstalledMeter = statusOfInstalledMeter;
    _enterTheAnomalyProgramming = enterTheAnomalyProgramming;
    _serialNumber = serialNumber;
    _meterAnomalyImage = meterAnomalyImage;
    _additionalInformationProgramming = additionalInformationProgramming;
    _circuitBreakerProperlyEngaged = circuitBreakerProperlyEngaged;
    _enterTheAnomalyCircuitBreakerInterlock = enterTheAnomalyCircuitBreakerInterlock;
    _additionalInformationCircuitBreakerInterlock = additionalInformationCircuitBreakerInterlock;
    _customerFeedbackComment = customerFeedbackComment;
    _customerSignatureImage = customerSignatureImage;
    _customerSignAdded = customerSignAdded;
    _isGripCase = isGripCase;
    _gripCaseReason = gripCaseReason;
    _noticeOfPassageImage1 = noticeOfPassageImage1;
    _noticeOfPassageImage2 = noticeOfPassageImage2;
    _displacementPhotoImage1 = displacementPhotoImage1;
    _displacementPhotoImage2 = displacementPhotoImage2;
    _gripCaseComment = gripCaseComment;
  }

  InterventionDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _startTimeOfIntervention = json['startTimeOfIntervention'];
    _endTimeOfIntervention = json['endTimeOfIntervention'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _localMeterImage = json['localMeterImage'];
    _meterNumberImage = json['meterNumberImage'];
    _countingPanelImage = json['countingPanelImage'];
    _confirmPpePorts = json['confirmPpePorts'];
    _confirmMacronsInstallation = json['confirmMacronsInstallation'];
    _confirmTop = json['confirmTop'];
    _canYouGetStartedToday = json['canYouGetStartedToday'];
    _circuitBreakerBrand = json['circuitBreakerBrand'];
    _month = json['month'];
    _year = json['year'];
    _serialNumberScanImage = json['serialNumberScanImage'];
    _sizeControlImage = json['sizeControlImage'];
    _testOfVat = json['testOfVat'];
    _settingsAnomaly = json['settingsAnomaly'];
    _circuitBreakerMalfuncttion = json['circuitBreakerMalfuncttion'];
    _meterRate = json['meterRate'];
    _fullTimeRate = json['fullTimeRate'];
    _offPeakTime = json['offPeakTime'];
    _photoOfIndexImage = json['photoOfIndexImage'] != null ? json['photoOfIndexImage'].cast<String>() : [];
    _positionOfPhaseConductorImage = json['positionOfPhaseConductorImage'];
    _isTheDriverWellPositioned = json['isTheDriverWellPositioned'];
    _reasonFOrDriverNotWellPositioned = json['reasonFOrDriverNotWellPositioned'];
    _beforeCcpiLoggingImage1 = json['beforeCcpiLoggingImage1'];
    _beforeCcpiLoggingImage2 = json['beforeCcpiLoggingImage2'];
    _afterCcpiLoggingImage1 = json['afterCcpiLoggingImage1'];
    _afterCcpiLoggingImage2 = json['afterCcpiLoggingImage2'];
    _identificationBetweenPhaseAndNeutral = json['identificationBetweenPhaseAndNeutral'];
    _oldMeterImage = json['oldMeterImage'];
    _terminalBlockTightenedPowerImage = json['terminalBlockTightenedPowerImage'];
    _terminalCoverPutBackInPlaceImage = json['terminalCoverPutBackInPlaceImage'];
    _oldMeterDepositedImage = json['oldMeterDepositedImage'];
    _electricalEquipmentDepositedImage = json['electricalEquipmentDepositedImage'];
    _enterAdditionallyMaterial = json['enterAdditionallyMaterial'] != null ? json['enterAdditionallyMaterial'].cast<String>() : [];
    _presenceOfPnt = json['presenceOfPnt'];
    _inversionBetweenPhaseAndMaterial = json['inversionBetweenPhaseAndMaterial'];
    _resumptionOfEnslavement = json['resumptionOfEnslavement'];
    _ictCabling = json['ictCabling'];
    _photoOfWiringImage = json['photoOfWiringImage'];
    _photosOfNewMeterInstalled = json['photosOfNewMeterInstalled'] != null ? json['photosOfNewMeterInstalled'].cast<String>() : [];
    _hasTheCircuitBreakerBeenReplaced = json['hasTheCircuitBreakerBeenReplaced'];
    _resonForCircuitBreakerNonReplacement = json['resonForCircuitBreakerNonReplacement'];
    _circuitBreakerLead = json['circuitBreakerLead'];
    _reasonForNoncircuitBreakerLead = json['reasonForNoncircuitBreakerLead'];
    _leadCCPI = json['leadCCPI'];
    _indicateReasonForCircuitBreakerSettings = json['indicateReasonForCircuitBreakerSettings'];
    _circuitBreakerGuageImage = json['circuitBreakerGuageImage'];
    _modifiedCircuitBreakerCapacity = json['modifiedCircuitBreakerCapacity'];
    _calibratedPower = json['calibratedPower'];
    _reasonForNonModifiedCircuitBreakerCapacity = json['reasonForNonModifiedCircuitBreakerCapacity'];
    _statusOfInstalledMeter = json['statusOfInstalledMeter'];
    _enterTheAnomalyProgramming = json['enterTheAnomalyProgramming'];
    _serialNumber = json['serialNumber'];
    _meterAnomalyImage = json['meterAnomalyImage'];
    _additionalInformationProgramming = json['additionalInformationProgramming'];
    _circuitBreakerProperlyEngaged = json['circuitBreakerProperlyEngaged'];
    _enterTheAnomalyCircuitBreakerInterlock = json['enterTheAnomalyCircuitBreakerInterlock'];
    _additionalInformationCircuitBreakerInterlock = json['additionalInformationCircuitBreakerInterlock'];
    _customerFeedbackComment = json['customerFeedbackComment'];
    _customerSignatureImage = json['customerSignatureImage'];
    _customerSignAdded = json['customerSignAdded'];
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
  String? _localMeterImage;
  String? _meterNumberImage;
  String? _countingPanelImage;
  bool? _confirmPpePorts;
  bool? _confirmMacronsInstallation;
  bool? _confirmTop;
  bool? _canYouGetStartedToday;
  String? _circuitBreakerBrand;
  String? _month;
  String? _year;
  String? _serialNumberScanImage;
  String? _sizeControlImage;
  bool? _testOfVat;
  bool? _settingsAnomaly;
  bool? _circuitBreakerMalfuncttion;
  String? _meterRate;
  String? _fullTimeRate;
  String? _offPeakTime;
  List<String>? _photoOfIndexImage;
  String? _positionOfPhaseConductorImage;
  bool? _isTheDriverWellPositioned;
  String? _reasonFOrDriverNotWellPositioned;
  String? _beforeCcpiLoggingImage1;
  String? _beforeCcpiLoggingImage2;
  String? _afterCcpiLoggingImage1;
  String? _afterCcpiLoggingImage2;
  bool? _identificationBetweenPhaseAndNeutral;
  String? _oldMeterImage;
  String? _terminalBlockTightenedPowerImage;
  String? _terminalCoverPutBackInPlaceImage;
  String? _oldMeterDepositedImage;
  String? _electricalEquipmentDepositedImage;
  List<String>? _enterAdditionallyMaterial;
  bool? _presenceOfPnt;
  bool? _inversionBetweenPhaseAndMaterial;
  bool? _resumptionOfEnslavement;
  bool? _ictCabling;
  String? _photoOfWiringImage;
  List<String>? _photosOfNewMeterInstalled;
  bool? _hasTheCircuitBreakerBeenReplaced;
  String? _resonForCircuitBreakerNonReplacement;
  bool? _circuitBreakerLead;
  String? _reasonForNoncircuitBreakerLead;
  bool? _leadCCPI;
  String? _indicateReasonForCircuitBreakerSettings;
  String? _circuitBreakerGuageImage;
  bool? _modifiedCircuitBreakerCapacity;
  String? _calibratedPower;
  String? _reasonForNonModifiedCircuitBreakerCapacity;
  bool? _statusOfInstalledMeter;
  String? _enterTheAnomalyProgramming;
  String? _serialNumber;
  String? _meterAnomalyImage;
  String? _additionalInformationProgramming;
  bool? _circuitBreakerProperlyEngaged;
  String? _enterTheAnomalyCircuitBreakerInterlock;
  String? _additionalInformationCircuitBreakerInterlock;
  String? _customerFeedbackComment;
  String? _customerSignatureImage;
  bool? _customerSignAdded;
  bool? _isGripCase;
  String? _gripCaseReason;
  String? _noticeOfPassageImage1;
  String? _noticeOfPassageImage2;
  String? _displacementPhotoImage1;
  String? _displacementPhotoImage2;
  String? _gripCaseComment;
  InterventionDetailsModel copyWith({
    String? startTimeOfIntervention,
    int? id,
    String? endTimeOfIntervention,
    double? latitude,
    double? longitude,
    String? localMeterImage,
    String? meterNumberImage,
    String? countingPanelImage,
    bool? confirmPpePorts,
    bool? confirmMacronsInstallation,
    bool? confirmTop,
    bool? canYouGetStartedToday,
    String? circuitBreakerBrand,
    String? month,
    String? year,
    String? serialNumberScanImage,
    String? sizeControlImage,
    bool? testOfVat,
    bool? settingsAnomaly,
    bool? circuitBreakerMalfuncttion,
    String? meterRate,
    String? fullTimeRate,
    String? offPeakTime,
    List<String>? photoOfIndexImage,
    String? positionOfPhaseConductorImage,
    bool? isTheDriverWellPositioned,
    String? reasonFOrDriverNotWellPositioned,
    String? beforeCcpiLoggingImage1,
    String? beforeCcpiLoggingImage2,
    String? afterCcpiLoggingImage1,
    String? afterCcpiLoggingImage2,
    bool? identificationBetweenPhaseAndNeutral,
    String? oldMeterImage,
    String? terminalBlockTightenedPowerImage,
    String? terminalCoverPutBackInPlaceImage,
    String? oldMeterDepositedImage,
    String? electricalEquipmentDepositedImage,
    List<String>? enterAdditionallyMaterial,
    bool? presenceOfPnt,
    bool? inversionBetweenPhaseAndMaterial,
    bool? resumptionOfEnslavement,
    bool? ictCabling,
    String? photoOfWiringImage,
    List<String>? photosOfNewMeterInstalled,
    bool? hasTheCircuitBreakerBeenReplaced,
    String? resonForCircuitBreakerNonReplacement,
    bool? circuitBreakerLead,
    String? reasonForNoncircuitBreakerLead,
    bool? leadCCPI,
    String? indicateReasonForCircuitBreakerSettings,
    String? circuitBreakerGuageImage,
    bool? modifiedCircuitBreakerCapacity,
    String? calibratedPower,
    String? reasonForNonModifiedCircuitBreakerCapacity,
    bool? statusOfInstalledMeter,
    String? enterTheAnomalyProgramming,
    String? serialNumber,
    String? meterAnomalyImage,
    String? additionalInformationProgramming,
    bool? circuitBreakerProperlyEngaged,
    String? enterTheAnomalyCircuitBreakerInterlock,
    String? additionalInformationCircuitBreakerInterlock,
    String? customerFeedbackComment,
    String? customerSignatureImage,
    bool? customerSignAdded,
    bool? isGripCase,
    String? gripCaseReason,
    String? noticeOfPassageImage1,
    String? noticeOfPassageImage2,
    String? displacementPhotoImage1,
    String? displacementPhotoImage2,
    String? gripCaseComment,
  }) =>
      InterventionDetailsModel(
        id: id ?? _id,
        startTimeOfIntervention:
        startTimeOfIntervention ?? _startTimeOfIntervention,
        endTimeOfIntervention: endTimeOfIntervention ?? _endTimeOfIntervention,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        localMeterImage: localMeterImage ?? _localMeterImage,
        meterNumberImage: meterNumberImage ?? _meterNumberImage,
        countingPanelImage: countingPanelImage ?? _countingPanelImage,
        confirmPpePorts: confirmPpePorts ?? _confirmPpePorts,
        confirmMacronsInstallation:
        confirmMacronsInstallation ?? _confirmMacronsInstallation,
        confirmTop: confirmTop ?? _confirmTop,
        canYouGetStartedToday: canYouGetStartedToday ?? _canYouGetStartedToday,
        circuitBreakerBrand: circuitBreakerBrand ?? _circuitBreakerBrand,
        month: month ?? _month,
        year: year ?? _year,
        serialNumberScanImage: serialNumberScanImage ?? _serialNumberScanImage,
        sizeControlImage: sizeControlImage ?? _sizeControlImage,
        testOfVat: testOfVat ?? _testOfVat,
        settingsAnomaly: settingsAnomaly ?? _settingsAnomaly,
        circuitBreakerMalfuncttion:
        circuitBreakerMalfuncttion ?? _circuitBreakerMalfuncttion,
        meterRate: meterRate ?? _meterRate,
        fullTimeRate: fullTimeRate ?? _fullTimeRate,
        offPeakTime: offPeakTime ?? _offPeakTime,
        photoOfIndexImage: photoOfIndexImage ?? _photoOfIndexImage,
        positionOfPhaseConductorImage:
        positionOfPhaseConductorImage ?? _positionOfPhaseConductorImage,
        isTheDriverWellPositioned:
        isTheDriverWellPositioned ?? _isTheDriverWellPositioned,
        reasonFOrDriverNotWellPositioned: reasonFOrDriverNotWellPositioned ??
            _reasonFOrDriverNotWellPositioned,
        beforeCcpiLoggingImage1:
        beforeCcpiLoggingImage1 ?? _beforeCcpiLoggingImage1,
        beforeCcpiLoggingImage2:
        beforeCcpiLoggingImage2 ?? _beforeCcpiLoggingImage2,
        afterCcpiLoggingImage1:
        afterCcpiLoggingImage1 ?? _afterCcpiLoggingImage1,
        afterCcpiLoggingImage2:
        afterCcpiLoggingImage2 ?? _afterCcpiLoggingImage2,
        identificationBetweenPhaseAndNeutral:
        identificationBetweenPhaseAndNeutral ??
            _identificationBetweenPhaseAndNeutral,
        oldMeterImage: oldMeterImage ?? _oldMeterImage,
        terminalBlockTightenedPowerImage: terminalBlockTightenedPowerImage ??
            _terminalBlockTightenedPowerImage,
        terminalCoverPutBackInPlaceImage: terminalCoverPutBackInPlaceImage ??
            _terminalCoverPutBackInPlaceImage,
        oldMeterDepositedImage:
        oldMeterDepositedImage ?? _oldMeterDepositedImage,
        electricalEquipmentDepositedImage: electricalEquipmentDepositedImage ??
            _electricalEquipmentDepositedImage,
        enterAdditionallyMaterial:
        enterAdditionallyMaterial ?? _enterAdditionallyMaterial,
        presenceOfPnt: presenceOfPnt ?? _presenceOfPnt,
        inversionBetweenPhaseAndMaterial: inversionBetweenPhaseAndMaterial ??
            _inversionBetweenPhaseAndMaterial,
        resumptionOfEnslavement:
        resumptionOfEnslavement ?? _resumptionOfEnslavement,
        ictCabling: ictCabling ?? _ictCabling,
        photoOfWiringImage: photoOfWiringImage ?? _photoOfWiringImage,
        photosOfNewMeterInstalled:
        photosOfNewMeterInstalled ?? _photosOfNewMeterInstalled,
        hasTheCircuitBreakerBeenReplaced: hasTheCircuitBreakerBeenReplaced ??
            _hasTheCircuitBreakerBeenReplaced,
        resonForCircuitBreakerNonReplacement:
        resonForCircuitBreakerNonReplacement ??
            _resonForCircuitBreakerNonReplacement,
        circuitBreakerLead: circuitBreakerLead ?? _circuitBreakerLead,
        reasonForNoncircuitBreakerLead:
        reasonForNoncircuitBreakerLead ?? _reasonForNoncircuitBreakerLead,
        leadCCPI: leadCCPI ?? _leadCCPI,
        indicateReasonForCircuitBreakerSettings:
        indicateReasonForCircuitBreakerSettings ??
            _indicateReasonForCircuitBreakerSettings,
        circuitBreakerGuageImage:
        circuitBreakerGuageImage ?? _circuitBreakerGuageImage,
        modifiedCircuitBreakerCapacity:
        modifiedCircuitBreakerCapacity ?? _modifiedCircuitBreakerCapacity,
        calibratedPower: calibratedPower ?? _calibratedPower,
        reasonForNonModifiedCircuitBreakerCapacity:
        reasonForNonModifiedCircuitBreakerCapacity ??
            _reasonForNonModifiedCircuitBreakerCapacity,
        statusOfInstalledMeter:
        statusOfInstalledMeter ?? _statusOfInstalledMeter,
        enterTheAnomalyProgramming:
        enterTheAnomalyProgramming ?? _enterTheAnomalyProgramming,
        serialNumber: serialNumber ?? _serialNumber,
        meterAnomalyImage: meterAnomalyImage ?? _meterAnomalyImage,
        additionalInformationProgramming: additionalInformationProgramming ??
            _additionalInformationProgramming,
        circuitBreakerProperlyEngaged:
        circuitBreakerProperlyEngaged ?? _circuitBreakerProperlyEngaged,
        enterTheAnomalyCircuitBreakerInterlock:
        enterTheAnomalyCircuitBreakerInterlock ??
            _enterTheAnomalyCircuitBreakerInterlock,
        additionalInformationCircuitBreakerInterlock:
        additionalInformationCircuitBreakerInterlock ??
            _additionalInformationCircuitBreakerInterlock,
        customerFeedbackComment:
        customerFeedbackComment ?? _customerFeedbackComment,
        customerSignatureImage: customerSignatureImage ?? _customerSignatureImage,
        customerSignAdded: customerSignAdded ?? _customerSignAdded,
        isGripCase: isGripCase ?? _isGripCase,
        gripCaseReason: gripCaseReason ?? _gripCaseReason,
        noticeOfPassageImage1: noticeOfPassageImage1 ?? _noticeOfPassageImage1,
        noticeOfPassageImage2: noticeOfPassageImage2 ?? _noticeOfPassageImage2,
        displacementPhotoImage1:
        displacementPhotoImage1 ?? _displacementPhotoImage1,
        displacementPhotoImage2:
        displacementPhotoImage2 ?? _displacementPhotoImage2,
        gripCaseComment: gripCaseComment ?? _gripCaseComment,
      );
  int? get id => _id;
  String? get startTimeOfIntervention => _startTimeOfIntervention;
  String? get endTimeOfIntervention => _endTimeOfIntervention;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  String? get localMeterImage => _localMeterImage;
  String? get meterNumberImage => _meterNumberImage;
  String? get countingPanelImage => _countingPanelImage;
  bool? get confirmPpePorts => _confirmPpePorts;
  bool? get confirmMacronsInstallation => _confirmMacronsInstallation;
  bool? get confirmTop => _confirmTop;
  bool? get canYouGetStartedToday => _canYouGetStartedToday;
  String? get circuitBreakerBrand => _circuitBreakerBrand;
  String? get month => _month;
  String? get year => _year;
  String? get serialNumberScanImage => _serialNumberScanImage;
  String? get sizeControlImage => _sizeControlImage;
  bool? get testOfVat => _testOfVat;
  bool? get settingsAnomaly => _settingsAnomaly;
  bool? get circuitBreakerMalfuncttion => _circuitBreakerMalfuncttion;
  String? get meterRate => _meterRate;
  String? get fullTimeRate => _fullTimeRate;
  String? get offPeakTime => _offPeakTime;
  List<String>? get photoOfIndexImage => _photoOfIndexImage;
  String? get positionOfPhaseConductorImage => _positionOfPhaseConductorImage;
  bool? get isTheDriverWellPositioned => _isTheDriverWellPositioned;
  String? get reasonFOrDriverNotWellPositioned =>
      _reasonFOrDriverNotWellPositioned;
  String? get beforeCcpiLoggingImage1 => _beforeCcpiLoggingImage1;
  String? get beforeCcpiLoggingImage2 => _beforeCcpiLoggingImage2;
  String? get afterCcpiLoggingImage1 => _afterCcpiLoggingImage1;
  String? get afterCcpiLoggingImage2 => _afterCcpiLoggingImage2;
  bool? get identificationBetweenPhaseAndNeutral =>
      _identificationBetweenPhaseAndNeutral;
  String? get oldMeterImage => _oldMeterImage;
  String? get terminalBlockTightenedPowerImage =>
      _terminalBlockTightenedPowerImage;
  String? get terminalCoverPutBackInPlaceImage =>
      _terminalCoverPutBackInPlaceImage;
  String? get oldMeterDepositedImage => _oldMeterDepositedImage;
  String? get electricalEquipmentDepositedImage =>
      _electricalEquipmentDepositedImage;
  List<String>? get enterAdditionallyMaterial => _enterAdditionallyMaterial;
  bool? get presenceOfPnt => _presenceOfPnt;
  bool? get inversionBetweenPhaseAndMaterial =>
      _inversionBetweenPhaseAndMaterial;
  bool? get resumptionOfEnslavement => _resumptionOfEnslavement;
  bool? get ictCabling => _ictCabling;
  String? get photoOfWiringImage => _photoOfWiringImage;
  List<String>? get photosOfNewMeterInstalled => _photosOfNewMeterInstalled;
  bool? get hasTheCircuitBreakerBeenReplaced =>
      _hasTheCircuitBreakerBeenReplaced;
  String? get resonForCircuitBreakerNonReplacement =>
      _resonForCircuitBreakerNonReplacement;
  bool? get circuitBreakerLead => _circuitBreakerLead;
  String? get reasonForNoncircuitBreakerLead => _reasonForNoncircuitBreakerLead;
  bool? get leadCCPI => _leadCCPI;
  String? get indicateReasonForCircuitBreakerSettings =>
      _indicateReasonForCircuitBreakerSettings;
  String? get circuitBreakerGuageImage => _circuitBreakerGuageImage;
  bool? get modifiedCircuitBreakerCapacity => _modifiedCircuitBreakerCapacity;
  String? get calibratedPower => _calibratedPower;
  String? get reasonForNonModifiedCircuitBreakerCapacity =>
      _reasonForNonModifiedCircuitBreakerCapacity;
  bool? get statusOfInstalledMeter => _statusOfInstalledMeter;
  String? get enterTheAnomalyProgramming => _enterTheAnomalyProgramming;
  String? get serialNumber => _serialNumber;
  String? get meterAnomalyImage => _meterAnomalyImage;
  String? get additionalInformationProgramming =>
      _additionalInformationProgramming;
  bool? get circuitBreakerProperlyEngaged => _circuitBreakerProperlyEngaged;
  String? get enterTheAnomalyCircuitBreakerInterlock =>
      _enterTheAnomalyCircuitBreakerInterlock;
  String? get additionalInformationCircuitBreakerInterlock =>
      _additionalInformationCircuitBreakerInterlock;
  String? get customerFeedbackComment => _customerFeedbackComment;
  String? get customerSignatureImage => _customerSignatureImage;
  bool? get customerSignAdded => _customerSignAdded;
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
    map['localMeterImage'] = _localMeterImage;
    map['meterNumberImage'] = _meterNumberImage;
    map['countingPanelImage'] = _countingPanelImage;
    map['confirmPpePorts'] = _confirmPpePorts;
    map['confirmMacronsInstallation'] = _confirmMacronsInstallation;
    map['confirmTop'] = _confirmTop;
    map['canYouGetStartedToday'] = _canYouGetStartedToday;
    map['circuitBreakerBrand'] = _circuitBreakerBrand;
    map['month'] = _month;
    map['year'] = _year;
    map['serialNumberScanImage'] = _serialNumberScanImage;
    map['sizeControlImage'] = _sizeControlImage;
    map['testOfVat'] = _testOfVat;
    map['settingsAnomaly'] = _settingsAnomaly;
    map['circuitBreakerMalfuncttion'] = _circuitBreakerMalfuncttion;
    map['meterRate'] = _meterRate;
    map['fullTimeRate'] = _fullTimeRate;
    map['offPeakTime'] = _offPeakTime;
    map['photoOfIndexImage'] = _photoOfIndexImage;
    map['positionOfPhaseConductorImage'] = _positionOfPhaseConductorImage;
    map['isTheDriverWellPositioned'] = _isTheDriverWellPositioned;
    map['reasonFOrDriverNotWellPositioned'] = _reasonFOrDriverNotWellPositioned;
    map['beforeCcpiLoggingImage1'] = _beforeCcpiLoggingImage1;
    map['beforeCcpiLoggingImage2'] = _beforeCcpiLoggingImage2;
    map['afterCcpiLoggingImage1'] = _afterCcpiLoggingImage1;
    map['afterCcpiLoggingImage2'] = _afterCcpiLoggingImage2;
    map['identificationBetweenPhaseAndNeutral'] =
        _identificationBetweenPhaseAndNeutral;
    map['oldMeterImage'] = _oldMeterImage;
    map['terminalBlockTightenedPowerImage'] = _terminalBlockTightenedPowerImage;
    map['terminalCoverPutBackInPlaceImage'] = _terminalCoverPutBackInPlaceImage;
    map['oldMeterDepositedImage'] = _oldMeterDepositedImage;
    map['electricalEquipmentDepositedImage'] =
        _electricalEquipmentDepositedImage;
    map['enterAdditionallyMaterial'] = _enterAdditionallyMaterial;
    map['presenceOfPnt'] = _presenceOfPnt;
    map['inversionBetweenPhaseAndMaterial'] = _inversionBetweenPhaseAndMaterial;
    map['resumptionOfEnslavement'] = _resumptionOfEnslavement;
    map['ictCabling'] = _ictCabling;
    map['photoOfWiringImage'] = _photoOfWiringImage;
    map['photosOfNewMeterInstalled'] = _photosOfNewMeterInstalled;
    map['hasTheCircuitBreakerBeenReplaced'] = _hasTheCircuitBreakerBeenReplaced;
    map['resonForCircuitBreakerNonReplacement'] =
        _resonForCircuitBreakerNonReplacement;
    map['circuitBreakerLead'] = _circuitBreakerLead;
    map['reasonForNoncircuitBreakerLead'] = _reasonForNoncircuitBreakerLead;
    map['leadCCPI'] = _leadCCPI;
    map['indicateReasonForCircuitBreakerSettings'] =
        _indicateReasonForCircuitBreakerSettings;
    map['circuitBreakerGuageImage'] = _circuitBreakerGuageImage;
    map['modifiedCircuitBreakerCapacity'] = _modifiedCircuitBreakerCapacity;
    map['calibratedPower'] = _calibratedPower;
    map['reasonForNonModifiedCircuitBreakerCapacity'] =
        _reasonForNonModifiedCircuitBreakerCapacity;
    map['statusOfInstalledMeter'] = _statusOfInstalledMeter;
    map['enterTheAnomalyProgramming'] = _enterTheAnomalyProgramming;
    map['serialNumber'] = _serialNumber;
    map['meterAnomalyImage'] = _meterAnomalyImage;
    map['additionalInformationProgramming'] = _additionalInformationProgramming;
    map['circuitBreakerProperlyEngaged'] = _circuitBreakerProperlyEngaged;
    map['enterTheAnomalyCircuitBreakerInterlock'] =
        _enterTheAnomalyCircuitBreakerInterlock;
    map['additionalInformationCircuitBreakerInterlock'] =
        _additionalInformationCircuitBreakerInterlock;
    map['customerFeedbackComment'] = _customerFeedbackComment;
    map['customerSignatureImage'] = _customerSignatureImage;
    map['customerSignAdded'] = _customerSignAdded;
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