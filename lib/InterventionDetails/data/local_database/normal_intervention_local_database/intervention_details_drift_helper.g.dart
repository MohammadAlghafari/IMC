// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_details_drift_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class InterventionDetailsTableData extends DataClass
    implements Insertable<InterventionDetailsTableData> {
  final int id;
  final String? startTimeOfIntervention;
  final String? endTimeOfIntervention;
  final double? latitude;
  final double? longitude;
  final String? localMeterImage;
  final String? meterNumberImage;
  final String? countingPanelImage;
  final bool? confirmPpePorts;
  final bool? confirmMacronsInstallation;
  final bool? confirmTop;
  final bool? canYouGetStartedToday;
  final String? circuitBreakerBrand;
  final String? month;
  final String? year;
  final String? serialNumberScanImage;
  final String? sizeControlImage;
  final bool? testOfVat;
  final bool? settingsAnomaly;
  final bool? circuitBreakerMalfuncttion;
  final String? meterRate;
  final String? fullTimeRate;
  final String? offPeakTime;
  final String? photoOfIndexImage;
  final String? positionOfPhaseConductorImage;
  final bool? isTheDriverWellPositioned;
  final String? reasonFOrDriverNotWellPositioned;
  final String? beforeCcpiLoggingImage1;
  final String? beforeCcpiLoggingImage2;
  final String? afterCcpiLoggingImage1;
  final String? afterCcpiLoggingImage2;
  final bool? identificationBetweenPhaseAndNeutral;
  final String? oldMeterImage;
  final String? terminalBlockTightenedPowerImage;
  final String? terminalCoverPutBackInPlaceImage;
  final String? oldMeterDepositedImage;
  final String? electricalEquipmentDepositedImage;
  final String? enterAdditionallyMaterial;
  final bool? presenceOfPnt;
  final bool? inversionBetweenPhaseAndMaterial;
  final bool? resumptionOfEnslavement;
  final bool? ictCabling;
  final String? photoOfWiringImage;
  final String? photosOfNewMeterInstalled;
  final bool? hasTheCircuitBreakerBeenReplaced;
  final String? resonForCircuitBreakerNonReplacement;
  final bool? circuitBreakerLead;
  final String? reasonForNoncircuitBreakerLead;
  final bool? leadCCPI;
  final String? indicateReasonForCircuitBreakerSettings;
  final String? circuitBreakerGuageImage;
  final bool? modifiedCircuitBreakerCapacity;
  final String? calibratedPower;
  final String? reasonForNonModifiedCircuitBreakerCapacity;
  final bool? statusOfInstalledMeter;
  final String? enterTheAnomalyProgramming;
  final String? serialNumber;
  final String? meterAnomalyImage;
  final String? additionalInformationProgramming;
  final bool? circuitBreakerProperlyEngaged;
  final String? enterTheAnomalyCircuitBreakerInterlock;
  final String? additionalInformationCircuitBreakerInterlock;
  final String? customerFeedbackComment;
  final String? customerSignatureImage;
  final bool? isGripCase;
  final String? gripCaseReason;
  final String? noticeOfPassageImage1;
  final String? noticeOfPassageImage2;
  final String? displacementPhotoImage1;
  final String? displacementPhotoImage2;
  final String? gripCaseComment;
  InterventionDetailsTableData(
      {required this.id,
        this.startTimeOfIntervention,
        this.endTimeOfIntervention,
        this.latitude,
        this.longitude,
        this.localMeterImage,
        this.meterNumberImage,
        this.countingPanelImage,
        this.confirmPpePorts,
        this.confirmMacronsInstallation,
        this.confirmTop,
        this.canYouGetStartedToday,
        this.circuitBreakerBrand,
        this.month,
        this.year,
        this.serialNumberScanImage,
        this.sizeControlImage,
        this.testOfVat,
        this.settingsAnomaly,
        this.circuitBreakerMalfuncttion,
        this.meterRate,
        this.fullTimeRate,
        this.offPeakTime,
        this.photoOfIndexImage,
        this.positionOfPhaseConductorImage,
        this.isTheDriverWellPositioned,
        this.reasonFOrDriverNotWellPositioned,
        this.beforeCcpiLoggingImage1,
        this.beforeCcpiLoggingImage2,
        this.afterCcpiLoggingImage1,
        this.afterCcpiLoggingImage2,
        this.identificationBetweenPhaseAndNeutral,
        this.oldMeterImage,
        this.terminalBlockTightenedPowerImage,
        this.terminalCoverPutBackInPlaceImage,
        this.oldMeterDepositedImage,
        this.electricalEquipmentDepositedImage,
        this.enterAdditionallyMaterial,
        this.presenceOfPnt,
        this.inversionBetweenPhaseAndMaterial,
        this.resumptionOfEnslavement,
        this.ictCabling,
        this.photoOfWiringImage,
        this.photosOfNewMeterInstalled,
        this.hasTheCircuitBreakerBeenReplaced,
        this.resonForCircuitBreakerNonReplacement,
        this.circuitBreakerLead,
        this.reasonForNoncircuitBreakerLead,
        this.leadCCPI,
        this.indicateReasonForCircuitBreakerSettings,
        this.circuitBreakerGuageImage,
        this.modifiedCircuitBreakerCapacity,
        this.calibratedPower,
        this.reasonForNonModifiedCircuitBreakerCapacity,
        this.statusOfInstalledMeter,
        this.enterTheAnomalyProgramming,
        this.serialNumber,
        this.meterAnomalyImage,
        this.additionalInformationProgramming,
        this.circuitBreakerProperlyEngaged,
        this.enterTheAnomalyCircuitBreakerInterlock,
        this.additionalInformationCircuitBreakerInterlock,
        this.customerFeedbackComment,
        this.customerSignatureImage,
        this.isGripCase,
        this.gripCaseReason,
        this.noticeOfPassageImage1,
        this.noticeOfPassageImage2,
        this.displacementPhotoImage1,
        this.displacementPhotoImage2,
        this.gripCaseComment});
  factory InterventionDetailsTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return InterventionDetailsTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      startTimeOfIntervention: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}start_time_of_intervention']),
      endTimeOfIntervention: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}end_time_of_intervention']),
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      localMeterImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_meter_image']),
      meterNumberImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}meter_number_image']),
      countingPanelImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}counting_panel_image']),
      confirmPpePorts: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}confirm_ppe_ports']),
      confirmMacronsInstallation: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}confirm_macrons_installation']),
      confirmTop: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}confirm_top']),
      canYouGetStartedToday: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}can_you_get_started_today']),
      circuitBreakerBrand: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}circuit_breaker_brand']),
      month: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}month']),
      year: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}year']),
      serialNumberScanImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}serial_number_scan_image']),
      sizeControlImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}size_control_image']),
      testOfVat: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}test_of_vat']),
      settingsAnomaly: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}settings_anomaly']),
      circuitBreakerMalfuncttion: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}circuit_breaker_malfuncttion']),
      meterRate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meter_rate']),
      fullTimeRate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}full_time_rate']),
      offPeakTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}off_peak_time']),
      photoOfIndexImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}photo_of_index_image']),
      positionOfPhaseConductorImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}position_of_phase_conductor_image']),
      isTheDriverWellPositioned: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}is_the_driver_well_positioned']),
      reasonFOrDriverNotWellPositioned: const StringType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}reason_f_or_driver_not_well_positioned']),
      beforeCcpiLoggingImage1: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}before_ccpi_logging_image1']),
      beforeCcpiLoggingImage2: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}before_ccpi_logging_image2']),
      afterCcpiLoggingImage1: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}after_ccpi_logging_image1']),
      afterCcpiLoggingImage2: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}after_ccpi_logging_image2']),
      identificationBetweenPhaseAndNeutral: const BoolType()
          .mapFromDatabaseResponse(data[
      '${effectivePrefix}identification_between_phase_and_neutral']),
      oldMeterImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}old_meter_image']),
      terminalBlockTightenedPowerImage: const StringType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}terminal_block_tightened_power_image']),
      terminalCoverPutBackInPlaceImage: const StringType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}terminal_cover_put_back_in_place_image']),
      oldMeterDepositedImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}old_meter_deposited_image']),
      electricalEquipmentDepositedImage: const StringType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}electrical_equipment_deposited_image']),
      enterAdditionallyMaterial: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}enter_additionally_material']),
      presenceOfPnt: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}presence_of_pnt']),
      inversionBetweenPhaseAndMaterial: const BoolType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}inversion_between_phase_and_material']),
      resumptionOfEnslavement: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}resumption_of_enslavement']),
      ictCabling: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ict_cabling']),
      photoOfWiringImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}photo_of_wiring_image']),
      photosOfNewMeterInstalled: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}photos_of_new_meter_installed']),
      hasTheCircuitBreakerBeenReplaced: const BoolType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}has_the_circuit_breaker_been_replaced']),
      resonForCircuitBreakerNonReplacement: const StringType()
          .mapFromDatabaseResponse(data[
      '${effectivePrefix}reson_for_circuit_breaker_non_replacement']),
      circuitBreakerLead: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}circuit_breaker_lead']),
      reasonForNoncircuitBreakerLead: const StringType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}reason_for_noncircuit_breaker_lead']),
      leadCCPI: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lead_c_c_p_i']),
      indicateReasonForCircuitBreakerSettings: const StringType()
          .mapFromDatabaseResponse(data[
      '${effectivePrefix}indicate_reason_for_circuit_breaker_settings']),
      circuitBreakerGuageImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}circuit_breaker_guage_image']),
      modifiedCircuitBreakerCapacity: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}modified_circuit_breaker_capacity']),
      calibratedPower: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}calibrated_power']),
      reasonForNonModifiedCircuitBreakerCapacity: const StringType()
          .mapFromDatabaseResponse(data[
      '${effectivePrefix}reason_for_non_modified_circuit_breaker_capacity']),
      statusOfInstalledMeter: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}status_of_installed_meter']),
      enterTheAnomalyProgramming: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}enter_the_anomaly_programming']),
      serialNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}serial_number']),
      meterAnomalyImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}meter_anomaly_image']),
      additionalInformationProgramming: const StringType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}additional_information_programming']),
      circuitBreakerProperlyEngaged: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}circuit_breaker_properly_engaged']),
      enterTheAnomalyCircuitBreakerInterlock: const StringType()
          .mapFromDatabaseResponse(data[
      '${effectivePrefix}enter_the_anomaly_circuit_breaker_interlock']),
      additionalInformationCircuitBreakerInterlock: const StringType()
          .mapFromDatabaseResponse(data[
      '${effectivePrefix}additional_information_circuit_breaker_interlock']),
      customerFeedbackComment: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}customer_feedback_comment']),
      customerSignatureImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}customer_signature_image']),
      isGripCase: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_grip_case']),
      gripCaseReason: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}grip_case_reason']),
      noticeOfPassageImage1: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}notice_of_passage_image1']),
      noticeOfPassageImage2: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}notice_of_passage_image2']),
      displacementPhotoImage1: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}displacement_photo_image1']),
      displacementPhotoImage2: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}displacement_photo_image2']),
      gripCaseComment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}grip_case_comment']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || startTimeOfIntervention != null) {
      map['start_time_of_intervention'] =
          Variable<String?>(startTimeOfIntervention);
    }
    if (!nullToAbsent || endTimeOfIntervention != null) {
      map['end_time_of_intervention'] =
          Variable<String?>(endTimeOfIntervention);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double?>(longitude);
    }
    if (!nullToAbsent || localMeterImage != null) {
      map['local_meter_image'] = Variable<String?>(localMeterImage);
    }
    if (!nullToAbsent || meterNumberImage != null) {
      map['meter_number_image'] = Variable<String?>(meterNumberImage);
    }
    if (!nullToAbsent || countingPanelImage != null) {
      map['counting_panel_image'] = Variable<String?>(countingPanelImage);
    }
    if (!nullToAbsent || confirmPpePorts != null) {
      map['confirm_ppe_ports'] = Variable<bool?>(confirmPpePorts);
    }
    if (!nullToAbsent || confirmMacronsInstallation != null) {
      map['confirm_macrons_installation'] =
          Variable<bool?>(confirmMacronsInstallation);
    }
    if (!nullToAbsent || confirmTop != null) {
      map['confirm_top'] = Variable<bool?>(confirmTop);
    }
    if (!nullToAbsent || canYouGetStartedToday != null) {
      map['can_you_get_started_today'] = Variable<bool?>(canYouGetStartedToday);
    }
    if (!nullToAbsent || circuitBreakerBrand != null) {
      map['circuit_breaker_brand'] = Variable<String?>(circuitBreakerBrand);
    }
    if (!nullToAbsent || month != null) {
      map['month'] = Variable<String?>(month);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<String?>(year);
    }
    if (!nullToAbsent || serialNumberScanImage != null) {
      map['serial_number_scan_image'] =
          Variable<String?>(serialNumberScanImage);
    }
    if (!nullToAbsent || sizeControlImage != null) {
      map['size_control_image'] = Variable<String?>(sizeControlImage);
    }
    if (!nullToAbsent || testOfVat != null) {
      map['test_of_vat'] = Variable<bool?>(testOfVat);
    }
    if (!nullToAbsent || settingsAnomaly != null) {
      map['settings_anomaly'] = Variable<bool?>(settingsAnomaly);
    }
    if (!nullToAbsent || circuitBreakerMalfuncttion != null) {
      map['circuit_breaker_malfuncttion'] =
          Variable<bool?>(circuitBreakerMalfuncttion);
    }
    if (!nullToAbsent || meterRate != null) {
      map['meter_rate'] = Variable<String?>(meterRate);
    }
    if (!nullToAbsent || fullTimeRate != null) {
      map['full_time_rate'] = Variable<String?>(fullTimeRate);
    }
    if (!nullToAbsent || offPeakTime != null) {
      map['off_peak_time'] = Variable<String?>(offPeakTime);
    }
    if (!nullToAbsent || photoOfIndexImage != null) {
      map['photo_of_index_image'] = Variable<String?>(photoOfIndexImage);
    }
    if (!nullToAbsent || positionOfPhaseConductorImage != null) {
      map['position_of_phase_conductor_image'] =
          Variable<String?>(positionOfPhaseConductorImage);
    }
    if (!nullToAbsent || isTheDriverWellPositioned != null) {
      map['is_the_driver_well_positioned'] =
          Variable<bool?>(isTheDriverWellPositioned);
    }
    if (!nullToAbsent || reasonFOrDriverNotWellPositioned != null) {
      map['reason_f_or_driver_not_well_positioned'] =
          Variable<String?>(reasonFOrDriverNotWellPositioned);
    }
    if (!nullToAbsent || beforeCcpiLoggingImage1 != null) {
      map['before_ccpi_logging_image1'] =
          Variable<String?>(beforeCcpiLoggingImage1);
    }
    if (!nullToAbsent || beforeCcpiLoggingImage2 != null) {
      map['before_ccpi_logging_image2'] =
          Variable<String?>(beforeCcpiLoggingImage2);
    }
    if (!nullToAbsent || afterCcpiLoggingImage1 != null) {
      map['after_ccpi_logging_image1'] =
          Variable<String?>(afterCcpiLoggingImage1);
    }
    if (!nullToAbsent || afterCcpiLoggingImage2 != null) {
      map['after_ccpi_logging_image2'] =
          Variable<String?>(afterCcpiLoggingImage2);
    }
    if (!nullToAbsent || identificationBetweenPhaseAndNeutral != null) {
      map['identification_between_phase_and_neutral'] =
          Variable<bool?>(identificationBetweenPhaseAndNeutral);
    }
    if (!nullToAbsent || oldMeterImage != null) {
      map['old_meter_image'] = Variable<String?>(oldMeterImage);
    }
    if (!nullToAbsent || terminalBlockTightenedPowerImage != null) {
      map['terminal_block_tightened_power_image'] =
          Variable<String?>(terminalBlockTightenedPowerImage);
    }
    if (!nullToAbsent || terminalCoverPutBackInPlaceImage != null) {
      map['terminal_cover_put_back_in_place_image'] =
          Variable<String?>(terminalCoverPutBackInPlaceImage);
    }
    if (!nullToAbsent || oldMeterDepositedImage != null) {
      map['old_meter_deposited_image'] =
          Variable<String?>(oldMeterDepositedImage);
    }
    if (!nullToAbsent || electricalEquipmentDepositedImage != null) {
      map['electrical_equipment_deposited_image'] =
          Variable<String?>(electricalEquipmentDepositedImage);
    }
    if (!nullToAbsent || enterAdditionallyMaterial != null) {
      map['enter_additionally_material'] =
          Variable<String?>(enterAdditionallyMaterial);
    }
    if (!nullToAbsent || presenceOfPnt != null) {
      map['presence_of_pnt'] = Variable<bool?>(presenceOfPnt);
    }
    if (!nullToAbsent || inversionBetweenPhaseAndMaterial != null) {
      map['inversion_between_phase_and_material'] =
          Variable<bool?>(inversionBetweenPhaseAndMaterial);
    }
    if (!nullToAbsent || resumptionOfEnslavement != null) {
      map['resumption_of_enslavement'] =
          Variable<bool?>(resumptionOfEnslavement);
    }
    if (!nullToAbsent || ictCabling != null) {
      map['ict_cabling'] = Variable<bool?>(ictCabling);
    }
    if (!nullToAbsent || photoOfWiringImage != null) {
      map['photo_of_wiring_image'] = Variable<String?>(photoOfWiringImage);
    }
    if (!nullToAbsent || photosOfNewMeterInstalled != null) {
      map['photos_of_new_meter_installed'] =
          Variable<String?>(photosOfNewMeterInstalled);
    }
    if (!nullToAbsent || hasTheCircuitBreakerBeenReplaced != null) {
      map['has_the_circuit_breaker_been_replaced'] =
          Variable<bool?>(hasTheCircuitBreakerBeenReplaced);
    }
    if (!nullToAbsent || resonForCircuitBreakerNonReplacement != null) {
      map['reson_for_circuit_breaker_non_replacement'] =
          Variable<String?>(resonForCircuitBreakerNonReplacement);
    }
    if (!nullToAbsent || circuitBreakerLead != null) {
      map['circuit_breaker_lead'] = Variable<bool?>(circuitBreakerLead);
    }
    if (!nullToAbsent || reasonForNoncircuitBreakerLead != null) {
      map['reason_for_noncircuit_breaker_lead'] =
          Variable<String?>(reasonForNoncircuitBreakerLead);
    }
    if (!nullToAbsent || leadCCPI != null) {
      map['lead_c_c_p_i'] = Variable<bool?>(leadCCPI);
    }
    if (!nullToAbsent || indicateReasonForCircuitBreakerSettings != null) {
      map['indicate_reason_for_circuit_breaker_settings'] =
          Variable<String?>(indicateReasonForCircuitBreakerSettings);
    }
    if (!nullToAbsent || circuitBreakerGuageImage != null) {
      map['circuit_breaker_guage_image'] =
          Variable<String?>(circuitBreakerGuageImage);
    }
    if (!nullToAbsent || modifiedCircuitBreakerCapacity != null) {
      map['modified_circuit_breaker_capacity'] =
          Variable<bool?>(modifiedCircuitBreakerCapacity);
    }
    if (!nullToAbsent || calibratedPower != null) {
      map['calibrated_power'] = Variable<String?>(calibratedPower);
    }
    if (!nullToAbsent || reasonForNonModifiedCircuitBreakerCapacity != null) {
      map['reason_for_non_modified_circuit_breaker_capacity'] =
          Variable<String?>(reasonForNonModifiedCircuitBreakerCapacity);
    }
    if (!nullToAbsent || statusOfInstalledMeter != null) {
      map['status_of_installed_meter'] =
          Variable<bool?>(statusOfInstalledMeter);
    }
    if (!nullToAbsent || enterTheAnomalyProgramming != null) {
      map['enter_the_anomaly_programming'] =
          Variable<String?>(enterTheAnomalyProgramming);
    }
    if (!nullToAbsent || serialNumber != null) {
      map['serial_number'] = Variable<String?>(serialNumber);
    }
    if (!nullToAbsent || meterAnomalyImage != null) {
      map['meter_anomaly_image'] = Variable<String?>(meterAnomalyImage);
    }
    if (!nullToAbsent || additionalInformationProgramming != null) {
      map['additional_information_programming'] =
          Variable<String?>(additionalInformationProgramming);
    }
    if (!nullToAbsent || circuitBreakerProperlyEngaged != null) {
      map['circuit_breaker_properly_engaged'] =
          Variable<bool?>(circuitBreakerProperlyEngaged);
    }
    if (!nullToAbsent || enterTheAnomalyCircuitBreakerInterlock != null) {
      map['enter_the_anomaly_circuit_breaker_interlock'] =
          Variable<String?>(enterTheAnomalyCircuitBreakerInterlock);
    }
    if (!nullToAbsent || additionalInformationCircuitBreakerInterlock != null) {
      map['additional_information_circuit_breaker_interlock'] =
          Variable<String?>(additionalInformationCircuitBreakerInterlock);
    }
    if (!nullToAbsent || customerFeedbackComment != null) {
      map['customer_feedback_comment'] =
          Variable<String?>(customerFeedbackComment);
    }
    if (!nullToAbsent || customerSignatureImage != null) {
      map['customer_signature_image'] =
          Variable<String?>(customerSignatureImage);
    }
    if (!nullToAbsent || isGripCase != null) {
      map['is_grip_case'] = Variable<bool?>(isGripCase);
    }
    if (!nullToAbsent || gripCaseReason != null) {
      map['grip_case_reason'] = Variable<String?>(gripCaseReason);
    }
    if (!nullToAbsent || noticeOfPassageImage1 != null) {
      map['notice_of_passage_image1'] =
          Variable<String?>(noticeOfPassageImage1);
    }
    if (!nullToAbsent || noticeOfPassageImage2 != null) {
      map['notice_of_passage_image2'] =
          Variable<String?>(noticeOfPassageImage2);
    }
    if (!nullToAbsent || displacementPhotoImage1 != null) {
      map['displacement_photo_image1'] =
          Variable<String?>(displacementPhotoImage1);
    }
    if (!nullToAbsent || displacementPhotoImage2 != null) {
      map['displacement_photo_image2'] =
          Variable<String?>(displacementPhotoImage2);
    }
    if (!nullToAbsent || gripCaseComment != null) {
      map['grip_case_comment'] = Variable<String?>(gripCaseComment);
    }
    return map;
  }

  InterventionDetailsTableCompanion toCompanion(bool nullToAbsent) {
    return InterventionDetailsTableCompanion(
      id: Value(id),
      startTimeOfIntervention: startTimeOfIntervention == null && nullToAbsent
          ? const Value.absent()
          : Value(startTimeOfIntervention),
      endTimeOfIntervention: endTimeOfIntervention == null && nullToAbsent
          ? const Value.absent()
          : Value(endTimeOfIntervention),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      localMeterImage: localMeterImage == null && nullToAbsent
          ? const Value.absent()
          : Value(localMeterImage),
      meterNumberImage: meterNumberImage == null && nullToAbsent
          ? const Value.absent()
          : Value(meterNumberImage),
      countingPanelImage: countingPanelImage == null && nullToAbsent
          ? const Value.absent()
          : Value(countingPanelImage),
      confirmPpePorts: confirmPpePorts == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmPpePorts),
      confirmMacronsInstallation:
      confirmMacronsInstallation == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmMacronsInstallation),
      confirmTop: confirmTop == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmTop),
      canYouGetStartedToday: canYouGetStartedToday == null && nullToAbsent
          ? const Value.absent()
          : Value(canYouGetStartedToday),
      circuitBreakerBrand: circuitBreakerBrand == null && nullToAbsent
          ? const Value.absent()
          : Value(circuitBreakerBrand),
      month:
      month == null && nullToAbsent ? const Value.absent() : Value(month),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      serialNumberScanImage: serialNumberScanImage == null && nullToAbsent
          ? const Value.absent()
          : Value(serialNumberScanImage),
      sizeControlImage: sizeControlImage == null && nullToAbsent
          ? const Value.absent()
          : Value(sizeControlImage),
      testOfVat: testOfVat == null && nullToAbsent
          ? const Value.absent()
          : Value(testOfVat),
      settingsAnomaly: settingsAnomaly == null && nullToAbsent
          ? const Value.absent()
          : Value(settingsAnomaly),
      circuitBreakerMalfuncttion:
      circuitBreakerMalfuncttion == null && nullToAbsent
          ? const Value.absent()
          : Value(circuitBreakerMalfuncttion),
      meterRate: meterRate == null && nullToAbsent
          ? const Value.absent()
          : Value(meterRate),
      fullTimeRate: fullTimeRate == null && nullToAbsent
          ? const Value.absent()
          : Value(fullTimeRate),
      offPeakTime: offPeakTime == null && nullToAbsent
          ? const Value.absent()
          : Value(offPeakTime),
      photoOfIndexImage: photoOfIndexImage == null && nullToAbsent
          ? const Value.absent()
          : Value(photoOfIndexImage),
      positionOfPhaseConductorImage:
      positionOfPhaseConductorImage == null && nullToAbsent
          ? const Value.absent()
          : Value(positionOfPhaseConductorImage),
      isTheDriverWellPositioned:
      isTheDriverWellPositioned == null && nullToAbsent
          ? const Value.absent()
          : Value(isTheDriverWellPositioned),
      reasonFOrDriverNotWellPositioned:
      reasonFOrDriverNotWellPositioned == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonFOrDriverNotWellPositioned),
      beforeCcpiLoggingImage1: beforeCcpiLoggingImage1 == null && nullToAbsent
          ? const Value.absent()
          : Value(beforeCcpiLoggingImage1),
      beforeCcpiLoggingImage2: beforeCcpiLoggingImage2 == null && nullToAbsent
          ? const Value.absent()
          : Value(beforeCcpiLoggingImage2),
      afterCcpiLoggingImage1: afterCcpiLoggingImage1 == null && nullToAbsent
          ? const Value.absent()
          : Value(afterCcpiLoggingImage1),
      afterCcpiLoggingImage2: afterCcpiLoggingImage2 == null && nullToAbsent
          ? const Value.absent()
          : Value(afterCcpiLoggingImage2),
      identificationBetweenPhaseAndNeutral:
      identificationBetweenPhaseAndNeutral == null && nullToAbsent
          ? const Value.absent()
          : Value(identificationBetweenPhaseAndNeutral),
      oldMeterImage: oldMeterImage == null && nullToAbsent
          ? const Value.absent()
          : Value(oldMeterImage),
      terminalBlockTightenedPowerImage:
      terminalBlockTightenedPowerImage == null && nullToAbsent
          ? const Value.absent()
          : Value(terminalBlockTightenedPowerImage),
      terminalCoverPutBackInPlaceImage:
      terminalCoverPutBackInPlaceImage == null && nullToAbsent
          ? const Value.absent()
          : Value(terminalCoverPutBackInPlaceImage),
      oldMeterDepositedImage: oldMeterDepositedImage == null && nullToAbsent
          ? const Value.absent()
          : Value(oldMeterDepositedImage),
      electricalEquipmentDepositedImage:
      electricalEquipmentDepositedImage == null && nullToAbsent
          ? const Value.absent()
          : Value(electricalEquipmentDepositedImage),
      enterAdditionallyMaterial:
      enterAdditionallyMaterial == null && nullToAbsent
          ? const Value.absent()
          : Value(enterAdditionallyMaterial),
      presenceOfPnt: presenceOfPnt == null && nullToAbsent
          ? const Value.absent()
          : Value(presenceOfPnt),
      inversionBetweenPhaseAndMaterial:
      inversionBetweenPhaseAndMaterial == null && nullToAbsent
          ? const Value.absent()
          : Value(inversionBetweenPhaseAndMaterial),
      resumptionOfEnslavement: resumptionOfEnslavement == null && nullToAbsent
          ? const Value.absent()
          : Value(resumptionOfEnslavement),
      ictCabling: ictCabling == null && nullToAbsent
          ? const Value.absent()
          : Value(ictCabling),
      photoOfWiringImage: photoOfWiringImage == null && nullToAbsent
          ? const Value.absent()
          : Value(photoOfWiringImage),
      photosOfNewMeterInstalled:
      photosOfNewMeterInstalled == null && nullToAbsent
          ? const Value.absent()
          : Value(photosOfNewMeterInstalled),
      hasTheCircuitBreakerBeenReplaced:
      hasTheCircuitBreakerBeenReplaced == null && nullToAbsent
          ? const Value.absent()
          : Value(hasTheCircuitBreakerBeenReplaced),
      resonForCircuitBreakerNonReplacement:
      resonForCircuitBreakerNonReplacement == null && nullToAbsent
          ? const Value.absent()
          : Value(resonForCircuitBreakerNonReplacement),
      circuitBreakerLead: circuitBreakerLead == null && nullToAbsent
          ? const Value.absent()
          : Value(circuitBreakerLead),
      reasonForNoncircuitBreakerLead:
      reasonForNoncircuitBreakerLead == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonForNoncircuitBreakerLead),
      leadCCPI: leadCCPI == null && nullToAbsent
          ? const Value.absent()
          : Value(leadCCPI),
      indicateReasonForCircuitBreakerSettings:
      indicateReasonForCircuitBreakerSettings == null && nullToAbsent
          ? const Value.absent()
          : Value(indicateReasonForCircuitBreakerSettings),
      circuitBreakerGuageImage: circuitBreakerGuageImage == null && nullToAbsent
          ? const Value.absent()
          : Value(circuitBreakerGuageImage),
      modifiedCircuitBreakerCapacity:
      modifiedCircuitBreakerCapacity == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedCircuitBreakerCapacity),
      calibratedPower: calibratedPower == null && nullToAbsent
          ? const Value.absent()
          : Value(calibratedPower),
      reasonForNonModifiedCircuitBreakerCapacity:
      reasonForNonModifiedCircuitBreakerCapacity == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonForNonModifiedCircuitBreakerCapacity),
      statusOfInstalledMeter: statusOfInstalledMeter == null && nullToAbsent
          ? const Value.absent()
          : Value(statusOfInstalledMeter),
      enterTheAnomalyProgramming:
      enterTheAnomalyProgramming == null && nullToAbsent
          ? const Value.absent()
          : Value(enterTheAnomalyProgramming),
      serialNumber: serialNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(serialNumber),
      meterAnomalyImage: meterAnomalyImage == null && nullToAbsent
          ? const Value.absent()
          : Value(meterAnomalyImage),
      additionalInformationProgramming:
      additionalInformationProgramming == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalInformationProgramming),
      circuitBreakerProperlyEngaged:
      circuitBreakerProperlyEngaged == null && nullToAbsent
          ? const Value.absent()
          : Value(circuitBreakerProperlyEngaged),
      enterTheAnomalyCircuitBreakerInterlock:
      enterTheAnomalyCircuitBreakerInterlock == null && nullToAbsent
          ? const Value.absent()
          : Value(enterTheAnomalyCircuitBreakerInterlock),
      additionalInformationCircuitBreakerInterlock:
      additionalInformationCircuitBreakerInterlock == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalInformationCircuitBreakerInterlock),
      customerFeedbackComment: customerFeedbackComment == null && nullToAbsent
          ? const Value.absent()
          : Value(customerFeedbackComment),
      customerSignatureImage: customerSignatureImage == null && nullToAbsent
          ? const Value.absent()
          : Value(customerSignatureImage),
      isGripCase: isGripCase == null && nullToAbsent
          ? const Value.absent()
          : Value(isGripCase),
      gripCaseReason: gripCaseReason == null && nullToAbsent
          ? const Value.absent()
          : Value(gripCaseReason),
      noticeOfPassageImage1: noticeOfPassageImage1 == null && nullToAbsent
          ? const Value.absent()
          : Value(noticeOfPassageImage1),
      noticeOfPassageImage2: noticeOfPassageImage2 == null && nullToAbsent
          ? const Value.absent()
          : Value(noticeOfPassageImage2),
      displacementPhotoImage1: displacementPhotoImage1 == null && nullToAbsent
          ? const Value.absent()
          : Value(displacementPhotoImage1),
      displacementPhotoImage2: displacementPhotoImage2 == null && nullToAbsent
          ? const Value.absent()
          : Value(displacementPhotoImage2),
      gripCaseComment: gripCaseComment == null && nullToAbsent
          ? const Value.absent()
          : Value(gripCaseComment),
    );
  }

  factory InterventionDetailsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InterventionDetailsTableData(
      id: serializer.fromJson<int>(json['id']),
      startTimeOfIntervention:
      serializer.fromJson<String?>(json['startTimeOfIntervention']),
      endTimeOfIntervention:
      serializer.fromJson<String?>(json['endTimeOfIntervention']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      localMeterImage: serializer.fromJson<String?>(json['localMeterImage']),
      meterNumberImage: serializer.fromJson<String?>(json['meterNumberImage']),
      countingPanelImage:
      serializer.fromJson<String?>(json['countingPanelImage']),
      confirmPpePorts: serializer.fromJson<bool?>(json['confirmPpePorts']),
      confirmMacronsInstallation:
      serializer.fromJson<bool?>(json['confirmMacronsInstallation']),
      confirmTop: serializer.fromJson<bool?>(json['confirmTop']),
      canYouGetStartedToday:
      serializer.fromJson<bool?>(json['canYouGetStartedToday']),
      circuitBreakerBrand:
      serializer.fromJson<String?>(json['circuitBreakerBrand']),
      month: serializer.fromJson<String?>(json['month']),
      year: serializer.fromJson<String?>(json['year']),
      serialNumberScanImage:
      serializer.fromJson<String?>(json['serialNumberScanImage']),
      sizeControlImage: serializer.fromJson<String?>(json['sizeControlImage']),
      testOfVat: serializer.fromJson<bool?>(json['testOfVat']),
      settingsAnomaly: serializer.fromJson<bool?>(json['settingsAnomaly']),
      circuitBreakerMalfuncttion:
      serializer.fromJson<bool?>(json['circuitBreakerMalfuncttion']),
      meterRate: serializer.fromJson<String?>(json['meterRate']),
      fullTimeRate: serializer.fromJson<String?>(json['fullTimeRate']),
      offPeakTime: serializer.fromJson<String?>(json['offPeakTime']),
      photoOfIndexImage:
      serializer.fromJson<String?>(json['photoOfIndexImage']),
      positionOfPhaseConductorImage:
      serializer.fromJson<String?>(json['positionOfPhaseConductorImage']),
      isTheDriverWellPositioned:
      serializer.fromJson<bool?>(json['isTheDriverWellPositioned']),
      reasonFOrDriverNotWellPositioned: serializer
          .fromJson<String?>(json['reasonFOrDriverNotWellPositioned']),
      beforeCcpiLoggingImage1:
      serializer.fromJson<String?>(json['beforeCcpiLoggingImage1']),
      beforeCcpiLoggingImage2:
      serializer.fromJson<String?>(json['beforeCcpiLoggingImage2']),
      afterCcpiLoggingImage1:
      serializer.fromJson<String?>(json['afterCcpiLoggingImage1']),
      afterCcpiLoggingImage2:
      serializer.fromJson<String?>(json['afterCcpiLoggingImage2']),
      identificationBetweenPhaseAndNeutral: serializer
          .fromJson<bool?>(json['identificationBetweenPhaseAndNeutral']),
      oldMeterImage: serializer.fromJson<String?>(json['oldMeterImage']),
      terminalBlockTightenedPowerImage: serializer
          .fromJson<String?>(json['terminalBlockTightenedPowerImage']),
      terminalCoverPutBackInPlaceImage: serializer
          .fromJson<String?>(json['terminalCoverPutBackInPlaceImage']),
      oldMeterDepositedImage:
      serializer.fromJson<String?>(json['oldMeterDepositedImage']),
      electricalEquipmentDepositedImage: serializer
          .fromJson<String?>(json['electricalEquipmentDepositedImage']),
      enterAdditionallyMaterial:
      serializer.fromJson<String?>(json['enterAdditionallyMaterial']),
      presenceOfPnt: serializer.fromJson<bool?>(json['presenceOfPnt']),
      inversionBetweenPhaseAndMaterial:
      serializer.fromJson<bool?>(json['inversionBetweenPhaseAndMaterial']),
      resumptionOfEnslavement:
      serializer.fromJson<bool?>(json['resumptionOfEnslavement']),
      ictCabling: serializer.fromJson<bool?>(json['ictCabling']),
      photoOfWiringImage:
      serializer.fromJson<String?>(json['photoOfWiringImage']),
      photosOfNewMeterInstalled:
      serializer.fromJson<String?>(json['photosOfNewMeterInstalled']),
      hasTheCircuitBreakerBeenReplaced:
      serializer.fromJson<bool?>(json['hasTheCircuitBreakerBeenReplaced']),
      resonForCircuitBreakerNonReplacement: serializer
          .fromJson<String?>(json['resonForCircuitBreakerNonReplacement']),
      circuitBreakerLead:
      serializer.fromJson<bool?>(json['circuitBreakerLead']),
      reasonForNoncircuitBreakerLead:
      serializer.fromJson<String?>(json['reasonForNoncircuitBreakerLead']),
      leadCCPI: serializer.fromJson<bool?>(json['leadCCPI']),
      indicateReasonForCircuitBreakerSettings: serializer
          .fromJson<String?>(json['indicateReasonForCircuitBreakerSettings']),
      circuitBreakerGuageImage:
      serializer.fromJson<String?>(json['circuitBreakerGuageImage']),
      modifiedCircuitBreakerCapacity:
      serializer.fromJson<bool?>(json['modifiedCircuitBreakerCapacity']),
      calibratedPower: serializer.fromJson<String?>(json['calibratedPower']),
      reasonForNonModifiedCircuitBreakerCapacity: serializer.fromJson<String?>(
          json['reasonForNonModifiedCircuitBreakerCapacity']),
      statusOfInstalledMeter:
      serializer.fromJson<bool?>(json['statusOfInstalledMeter']),
      enterTheAnomalyProgramming:
      serializer.fromJson<String?>(json['enterTheAnomalyProgramming']),
      serialNumber: serializer.fromJson<String?>(json['serialNumber']),
      meterAnomalyImage:
      serializer.fromJson<String?>(json['meterAnomalyImage']),
      additionalInformationProgramming: serializer
          .fromJson<String?>(json['additionalInformationProgramming']),
      circuitBreakerProperlyEngaged:
      serializer.fromJson<bool?>(json['circuitBreakerProperlyEngaged']),
      enterTheAnomalyCircuitBreakerInterlock: serializer
          .fromJson<String?>(json['enterTheAnomalyCircuitBreakerInterlock']),
      additionalInformationCircuitBreakerInterlock:
      serializer.fromJson<String?>(
          json['additionalInformationCircuitBreakerInterlock']),
      customerFeedbackComment:
      serializer.fromJson<String?>(json['customerFeedbackComment']),
      customerSignatureImage:
      serializer.fromJson<String?>(json['customerSignatureImage']),
      isGripCase: serializer.fromJson<bool?>(json['isGripCase']),
      gripCaseReason: serializer.fromJson<String?>(json['gripCaseReason']),
      noticeOfPassageImage1:
      serializer.fromJson<String?>(json['noticeOfPassageImage1']),
      noticeOfPassageImage2:
      serializer.fromJson<String?>(json['noticeOfPassageImage2']),
      displacementPhotoImage1:
      serializer.fromJson<String?>(json['displacementPhotoImage1']),
      displacementPhotoImage2:
      serializer.fromJson<String?>(json['displacementPhotoImage2']),
      gripCaseComment: serializer.fromJson<String?>(json['gripCaseComment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startTimeOfIntervention':
      serializer.toJson<String?>(startTimeOfIntervention),
      'endTimeOfIntervention':
      serializer.toJson<String?>(endTimeOfIntervention),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'localMeterImage': serializer.toJson<String?>(localMeterImage),
      'meterNumberImage': serializer.toJson<String?>(meterNumberImage),
      'countingPanelImage': serializer.toJson<String?>(countingPanelImage),
      'confirmPpePorts': serializer.toJson<bool?>(confirmPpePorts),
      'confirmMacronsInstallation':
      serializer.toJson<bool?>(confirmMacronsInstallation),
      'confirmTop': serializer.toJson<bool?>(confirmTop),
      'canYouGetStartedToday': serializer.toJson<bool?>(canYouGetStartedToday),
      'circuitBreakerBrand': serializer.toJson<String?>(circuitBreakerBrand),
      'month': serializer.toJson<String?>(month),
      'year': serializer.toJson<String?>(year),
      'serialNumberScanImage':
      serializer.toJson<String?>(serialNumberScanImage),
      'sizeControlImage': serializer.toJson<String?>(sizeControlImage),
      'testOfVat': serializer.toJson<bool?>(testOfVat),
      'settingsAnomaly': serializer.toJson<bool?>(settingsAnomaly),
      'circuitBreakerMalfuncttion':
      serializer.toJson<bool?>(circuitBreakerMalfuncttion),
      'meterRate': serializer.toJson<String?>(meterRate),
      'fullTimeRate': serializer.toJson<String?>(fullTimeRate),
      'offPeakTime': serializer.toJson<String?>(offPeakTime),
      'photoOfIndexImage': serializer.toJson<String?>(photoOfIndexImage),
      'positionOfPhaseConductorImage':
      serializer.toJson<String?>(positionOfPhaseConductorImage),
      'isTheDriverWellPositioned':
      serializer.toJson<bool?>(isTheDriverWellPositioned),
      'reasonFOrDriverNotWellPositioned':
      serializer.toJson<String?>(reasonFOrDriverNotWellPositioned),
      'beforeCcpiLoggingImage1':
      serializer.toJson<String?>(beforeCcpiLoggingImage1),
      'beforeCcpiLoggingImage2':
      serializer.toJson<String?>(beforeCcpiLoggingImage2),
      'afterCcpiLoggingImage1':
      serializer.toJson<String?>(afterCcpiLoggingImage1),
      'afterCcpiLoggingImage2':
      serializer.toJson<String?>(afterCcpiLoggingImage2),
      'identificationBetweenPhaseAndNeutral':
      serializer.toJson<bool?>(identificationBetweenPhaseAndNeutral),
      'oldMeterImage': serializer.toJson<String?>(oldMeterImage),
      'terminalBlockTightenedPowerImage':
      serializer.toJson<String?>(terminalBlockTightenedPowerImage),
      'terminalCoverPutBackInPlaceImage':
      serializer.toJson<String?>(terminalCoverPutBackInPlaceImage),
      'oldMeterDepositedImage':
      serializer.toJson<String?>(oldMeterDepositedImage),
      'electricalEquipmentDepositedImage':
      serializer.toJson<String?>(electricalEquipmentDepositedImage),
      'enterAdditionallyMaterial':
      serializer.toJson<String?>(enterAdditionallyMaterial),
      'presenceOfPnt': serializer.toJson<bool?>(presenceOfPnt),
      'inversionBetweenPhaseAndMaterial':
      serializer.toJson<bool?>(inversionBetweenPhaseAndMaterial),
      'resumptionOfEnslavement':
      serializer.toJson<bool?>(resumptionOfEnslavement),
      'ictCabling': serializer.toJson<bool?>(ictCabling),
      'photoOfWiringImage': serializer.toJson<String?>(photoOfWiringImage),
      'photosOfNewMeterInstalled':
      serializer.toJson<String?>(photosOfNewMeterInstalled),
      'hasTheCircuitBreakerBeenReplaced':
      serializer.toJson<bool?>(hasTheCircuitBreakerBeenReplaced),
      'resonForCircuitBreakerNonReplacement':
      serializer.toJson<String?>(resonForCircuitBreakerNonReplacement),
      'circuitBreakerLead': serializer.toJson<bool?>(circuitBreakerLead),
      'reasonForNoncircuitBreakerLead':
      serializer.toJson<String?>(reasonForNoncircuitBreakerLead),
      'leadCCPI': serializer.toJson<bool?>(leadCCPI),
      'indicateReasonForCircuitBreakerSettings':
      serializer.toJson<String?>(indicateReasonForCircuitBreakerSettings),
      'circuitBreakerGuageImage':
      serializer.toJson<String?>(circuitBreakerGuageImage),
      'modifiedCircuitBreakerCapacity':
      serializer.toJson<bool?>(modifiedCircuitBreakerCapacity),
      'calibratedPower': serializer.toJson<String?>(calibratedPower),
      'reasonForNonModifiedCircuitBreakerCapacity': serializer
          .toJson<String?>(reasonForNonModifiedCircuitBreakerCapacity),
      'statusOfInstalledMeter':
      serializer.toJson<bool?>(statusOfInstalledMeter),
      'enterTheAnomalyProgramming':
      serializer.toJson<String?>(enterTheAnomalyProgramming),
      'serialNumber': serializer.toJson<String?>(serialNumber),
      'meterAnomalyImage': serializer.toJson<String?>(meterAnomalyImage),
      'additionalInformationProgramming':
      serializer.toJson<String?>(additionalInformationProgramming),
      'circuitBreakerProperlyEngaged':
      serializer.toJson<bool?>(circuitBreakerProperlyEngaged),
      'enterTheAnomalyCircuitBreakerInterlock':
      serializer.toJson<String?>(enterTheAnomalyCircuitBreakerInterlock),
      'additionalInformationCircuitBreakerInterlock': serializer
          .toJson<String?>(additionalInformationCircuitBreakerInterlock),
      'customerFeedbackComment':
      serializer.toJson<String?>(customerFeedbackComment),
      'customerSignatureImage':
      serializer.toJson<String?>(customerSignatureImage),
      'isGripCase': serializer.toJson<bool?>(isGripCase),
      'gripCaseReason': serializer.toJson<String?>(gripCaseReason),
      'noticeOfPassageImage1':
      serializer.toJson<String?>(noticeOfPassageImage1),
      'noticeOfPassageImage2':
      serializer.toJson<String?>(noticeOfPassageImage2),
      'displacementPhotoImage1':
      serializer.toJson<String?>(displacementPhotoImage1),
      'displacementPhotoImage2':
      serializer.toJson<String?>(displacementPhotoImage2),
      'gripCaseComment': serializer.toJson<String?>(gripCaseComment),
    };
  }

  InterventionDetailsTableData copyWith(
      {int? id,
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
        String? photoOfIndexImage,
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
        String? enterAdditionallyMaterial,
        bool? presenceOfPnt,
        bool? inversionBetweenPhaseAndMaterial,
        bool? resumptionOfEnslavement,
        bool? ictCabling,
        String? photoOfWiringImage,
        String? photosOfNewMeterInstalled,
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
        bool? isGripCase,
        String? gripCaseReason,
        String? noticeOfPassageImage1,
        String? noticeOfPassageImage2,
        String? displacementPhotoImage1,
        String? displacementPhotoImage2,
        String? gripCaseComment}) =>
      InterventionDetailsTableData(
        id: id ?? this.id,
        startTimeOfIntervention:
        startTimeOfIntervention ?? this.startTimeOfIntervention,
        endTimeOfIntervention:
        endTimeOfIntervention ?? this.endTimeOfIntervention,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        localMeterImage: localMeterImage ?? this.localMeterImage,
        meterNumberImage: meterNumberImage ?? this.meterNumberImage,
        countingPanelImage: countingPanelImage ?? this.countingPanelImage,
        confirmPpePorts: confirmPpePorts ?? this.confirmPpePorts,
        confirmMacronsInstallation:
        confirmMacronsInstallation ?? this.confirmMacronsInstallation,
        confirmTop: confirmTop ?? this.confirmTop,
        canYouGetStartedToday:
        canYouGetStartedToday ?? this.canYouGetStartedToday,
        circuitBreakerBrand: circuitBreakerBrand ?? this.circuitBreakerBrand,
        month: month ?? this.month,
        year: year ?? this.year,
        serialNumberScanImage:
        serialNumberScanImage ?? this.serialNumberScanImage,
        sizeControlImage: sizeControlImage ?? this.sizeControlImage,
        testOfVat: testOfVat ?? this.testOfVat,
        settingsAnomaly: settingsAnomaly ?? this.settingsAnomaly,
        circuitBreakerMalfuncttion:
        circuitBreakerMalfuncttion ?? this.circuitBreakerMalfuncttion,
        meterRate: meterRate ?? this.meterRate,
        fullTimeRate: fullTimeRate ?? this.fullTimeRate,
        offPeakTime: offPeakTime ?? this.offPeakTime,
        photoOfIndexImage: photoOfIndexImage ?? this.photoOfIndexImage,
        positionOfPhaseConductorImage:
        positionOfPhaseConductorImage ?? this.positionOfPhaseConductorImage,
        isTheDriverWellPositioned:
        isTheDriverWellPositioned ?? this.isTheDriverWellPositioned,
        reasonFOrDriverNotWellPositioned: reasonFOrDriverNotWellPositioned ??
            this.reasonFOrDriverNotWellPositioned,
        beforeCcpiLoggingImage1:
        beforeCcpiLoggingImage1 ?? this.beforeCcpiLoggingImage1,
        beforeCcpiLoggingImage2:
        beforeCcpiLoggingImage2 ?? this.beforeCcpiLoggingImage2,
        afterCcpiLoggingImage1:
        afterCcpiLoggingImage1 ?? this.afterCcpiLoggingImage1,
        afterCcpiLoggingImage2:
        afterCcpiLoggingImage2 ?? this.afterCcpiLoggingImage2,
        identificationBetweenPhaseAndNeutral:
        identificationBetweenPhaseAndNeutral ??
            this.identificationBetweenPhaseAndNeutral,
        oldMeterImage: oldMeterImage ?? this.oldMeterImage,
        terminalBlockTightenedPowerImage: terminalBlockTightenedPowerImage ??
            this.terminalBlockTightenedPowerImage,
        terminalCoverPutBackInPlaceImage: terminalCoverPutBackInPlaceImage ??
            this.terminalCoverPutBackInPlaceImage,
        oldMeterDepositedImage:
        oldMeterDepositedImage ?? this.oldMeterDepositedImage,
        electricalEquipmentDepositedImage: electricalEquipmentDepositedImage ??
            this.electricalEquipmentDepositedImage,
        enterAdditionallyMaterial:
        enterAdditionallyMaterial ?? this.enterAdditionallyMaterial,
        presenceOfPnt: presenceOfPnt ?? this.presenceOfPnt,
        inversionBetweenPhaseAndMaterial: inversionBetweenPhaseAndMaterial ??
            this.inversionBetweenPhaseAndMaterial,
        resumptionOfEnslavement:
        resumptionOfEnslavement ?? this.resumptionOfEnslavement,
        ictCabling: ictCabling ?? this.ictCabling,
        photoOfWiringImage: photoOfWiringImage ?? this.photoOfWiringImage,
        photosOfNewMeterInstalled:
        photosOfNewMeterInstalled ?? this.photosOfNewMeterInstalled,
        hasTheCircuitBreakerBeenReplaced: hasTheCircuitBreakerBeenReplaced ??
            this.hasTheCircuitBreakerBeenReplaced,
        resonForCircuitBreakerNonReplacement:
        resonForCircuitBreakerNonReplacement ??
            this.resonForCircuitBreakerNonReplacement,
        circuitBreakerLead: circuitBreakerLead ?? this.circuitBreakerLead,
        reasonForNoncircuitBreakerLead: reasonForNoncircuitBreakerLead ??
            this.reasonForNoncircuitBreakerLead,
        leadCCPI: leadCCPI ?? this.leadCCPI,
        indicateReasonForCircuitBreakerSettings:
        indicateReasonForCircuitBreakerSettings ??
            this.indicateReasonForCircuitBreakerSettings,
        circuitBreakerGuageImage:
        circuitBreakerGuageImage ?? this.circuitBreakerGuageImage,
        modifiedCircuitBreakerCapacity: modifiedCircuitBreakerCapacity ??
            this.modifiedCircuitBreakerCapacity,
        calibratedPower: calibratedPower ?? this.calibratedPower,
        reasonForNonModifiedCircuitBreakerCapacity:
        reasonForNonModifiedCircuitBreakerCapacity ??
            this.reasonForNonModifiedCircuitBreakerCapacity,
        statusOfInstalledMeter:
        statusOfInstalledMeter ?? this.statusOfInstalledMeter,
        enterTheAnomalyProgramming:
        enterTheAnomalyProgramming ?? this.enterTheAnomalyProgramming,
        serialNumber: serialNumber ?? this.serialNumber,
        meterAnomalyImage: meterAnomalyImage ?? this.meterAnomalyImage,
        additionalInformationProgramming: additionalInformationProgramming ??
            this.additionalInformationProgramming,
        circuitBreakerProperlyEngaged:
        circuitBreakerProperlyEngaged ?? this.circuitBreakerProperlyEngaged,
        enterTheAnomalyCircuitBreakerInterlock:
        enterTheAnomalyCircuitBreakerInterlock ??
            this.enterTheAnomalyCircuitBreakerInterlock,
        additionalInformationCircuitBreakerInterlock:
        additionalInformationCircuitBreakerInterlock ??
            this.additionalInformationCircuitBreakerInterlock,
        customerFeedbackComment:
        customerFeedbackComment ?? this.customerFeedbackComment,
        customerSignatureImage:
        customerSignatureImage ?? this.customerSignatureImage,
        isGripCase: isGripCase ?? this.isGripCase,
        gripCaseReason: gripCaseReason ?? this.gripCaseReason,
        noticeOfPassageImage1:
        noticeOfPassageImage1 ?? this.noticeOfPassageImage1,
        noticeOfPassageImage2:
        noticeOfPassageImage2 ?? this.noticeOfPassageImage2,
        displacementPhotoImage1:
        displacementPhotoImage1 ?? this.displacementPhotoImage1,
        displacementPhotoImage2:
        displacementPhotoImage2 ?? this.displacementPhotoImage2,
        gripCaseComment: gripCaseComment ?? this.gripCaseComment,
      );
  @override
  String toString() {
    return (StringBuffer('InterventionDetailsTableData(')
      ..write('id: $id, ')
      ..write('startTimeOfIntervention: $startTimeOfIntervention, ')
      ..write('endTimeOfIntervention: $endTimeOfIntervention, ')
      ..write('latitude: $latitude, ')
      ..write('longitude: $longitude, ')
      ..write('localMeterImage: $localMeterImage, ')
      ..write('meterNumberImage: $meterNumberImage, ')
      ..write('countingPanelImage: $countingPanelImage, ')
      ..write('confirmPpePorts: $confirmPpePorts, ')
      ..write('confirmMacronsInstallation: $confirmMacronsInstallation, ')
      ..write('confirmTop: $confirmTop, ')
      ..write('canYouGetStartedToday: $canYouGetStartedToday, ')
      ..write('circuitBreakerBrand: $circuitBreakerBrand, ')
      ..write('month: $month, ')
      ..write('year: $year, ')
      ..write('serialNumberScanImage: $serialNumberScanImage, ')
      ..write('sizeControlImage: $sizeControlImage, ')
      ..write('testOfVat: $testOfVat, ')
      ..write('settingsAnomaly: $settingsAnomaly, ')
      ..write('circuitBreakerMalfuncttion: $circuitBreakerMalfuncttion, ')
      ..write('meterRate: $meterRate, ')
      ..write('fullTimeRate: $fullTimeRate, ')
      ..write('offPeakTime: $offPeakTime, ')
      ..write('photoOfIndexImage: $photoOfIndexImage, ')
      ..write(
          'positionOfPhaseConductorImage: $positionOfPhaseConductorImage, ')
      ..write('isTheDriverWellPositioned: $isTheDriverWellPositioned, ')
      ..write(
          'reasonFOrDriverNotWellPositioned: $reasonFOrDriverNotWellPositioned, ')
      ..write('beforeCcpiLoggingImage1: $beforeCcpiLoggingImage1, ')
      ..write('beforeCcpiLoggingImage2: $beforeCcpiLoggingImage2, ')
      ..write('afterCcpiLoggingImage1: $afterCcpiLoggingImage1, ')
      ..write('afterCcpiLoggingImage2: $afterCcpiLoggingImage2, ')
      ..write(
          'identificationBetweenPhaseAndNeutral: $identificationBetweenPhaseAndNeutral, ')
      ..write('oldMeterImage: $oldMeterImage, ')
      ..write(
          'terminalBlockTightenedPowerImage: $terminalBlockTightenedPowerImage, ')
      ..write(
          'terminalCoverPutBackInPlaceImage: $terminalCoverPutBackInPlaceImage, ')
      ..write('oldMeterDepositedImage: $oldMeterDepositedImage, ')
      ..write(
          'electricalEquipmentDepositedImage: $electricalEquipmentDepositedImage, ')
      ..write('enterAdditionallyMaterial: $enterAdditionallyMaterial, ')
      ..write('presenceOfPnt: $presenceOfPnt, ')
      ..write(
          'inversionBetweenPhaseAndMaterial: $inversionBetweenPhaseAndMaterial, ')
      ..write('resumptionOfEnslavement: $resumptionOfEnslavement, ')
      ..write('ictCabling: $ictCabling, ')
      ..write('photoOfWiringImage: $photoOfWiringImage, ')
      ..write('photosOfNewMeterInstalled: $photosOfNewMeterInstalled, ')
      ..write(
          'hasTheCircuitBreakerBeenReplaced: $hasTheCircuitBreakerBeenReplaced, ')
      ..write(
          'resonForCircuitBreakerNonReplacement: $resonForCircuitBreakerNonReplacement, ')
      ..write('circuitBreakerLead: $circuitBreakerLead, ')
      ..write(
          'reasonForNoncircuitBreakerLead: $reasonForNoncircuitBreakerLead, ')
      ..write('leadCCPI: $leadCCPI, ')
      ..write(
          'indicateReasonForCircuitBreakerSettings: $indicateReasonForCircuitBreakerSettings, ')
      ..write('circuitBreakerGuageImage: $circuitBreakerGuageImage, ')
      ..write(
          'modifiedCircuitBreakerCapacity: $modifiedCircuitBreakerCapacity, ')
      ..write('calibratedPower: $calibratedPower, ')
      ..write(
          'reasonForNonModifiedCircuitBreakerCapacity: $reasonForNonModifiedCircuitBreakerCapacity, ')
      ..write('statusOfInstalledMeter: $statusOfInstalledMeter, ')
      ..write('enterTheAnomalyProgramming: $enterTheAnomalyProgramming, ')
      ..write('serialNumber: $serialNumber, ')
      ..write('meterAnomalyImage: $meterAnomalyImage, ')
      ..write(
          'additionalInformationProgramming: $additionalInformationProgramming, ')
      ..write(
          'circuitBreakerProperlyEngaged: $circuitBreakerProperlyEngaged, ')
      ..write(
          'enterTheAnomalyCircuitBreakerInterlock: $enterTheAnomalyCircuitBreakerInterlock, ')
      ..write(
          'additionalInformationCircuitBreakerInterlock: $additionalInformationCircuitBreakerInterlock, ')
      ..write('customerFeedbackComment: $customerFeedbackComment, ')
      ..write('customerSignatureImage: $customerSignatureImage, ')
      ..write('isGripCase: $isGripCase, ')
      ..write('gripCaseReason: $gripCaseReason, ')
      ..write('noticeOfPassageImage1: $noticeOfPassageImage1, ')
      ..write('noticeOfPassageImage2: $noticeOfPassageImage2, ')
      ..write('displacementPhotoImage1: $displacementPhotoImage1, ')
      ..write('displacementPhotoImage2: $displacementPhotoImage2, ')
      ..write('gripCaseComment: $gripCaseComment')
      ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    startTimeOfIntervention,
    endTimeOfIntervention,
    latitude,
    longitude,
    localMeterImage,
    meterNumberImage,
    countingPanelImage,
    confirmPpePorts,
    confirmMacronsInstallation,
    confirmTop,
    canYouGetStartedToday,
    circuitBreakerBrand,
    month,
    year,
    serialNumberScanImage,
    sizeControlImage,
    testOfVat,
    settingsAnomaly,
    circuitBreakerMalfuncttion,
    meterRate,
    fullTimeRate,
    offPeakTime,
    photoOfIndexImage,
    positionOfPhaseConductorImage,
    isTheDriverWellPositioned,
    reasonFOrDriverNotWellPositioned,
    beforeCcpiLoggingImage1,
    beforeCcpiLoggingImage2,
    afterCcpiLoggingImage1,
    afterCcpiLoggingImage2,
    identificationBetweenPhaseAndNeutral,
    oldMeterImage,
    terminalBlockTightenedPowerImage,
    terminalCoverPutBackInPlaceImage,
    oldMeterDepositedImage,
    electricalEquipmentDepositedImage,
    enterAdditionallyMaterial,
    presenceOfPnt,
    inversionBetweenPhaseAndMaterial,
    resumptionOfEnslavement,
    ictCabling,
    photoOfWiringImage,
    photosOfNewMeterInstalled,
    hasTheCircuitBreakerBeenReplaced,
    resonForCircuitBreakerNonReplacement,
    circuitBreakerLead,
    reasonForNoncircuitBreakerLead,
    leadCCPI,
    indicateReasonForCircuitBreakerSettings,
    circuitBreakerGuageImage,
    modifiedCircuitBreakerCapacity,
    calibratedPower,
    reasonForNonModifiedCircuitBreakerCapacity,
    statusOfInstalledMeter,
    enterTheAnomalyProgramming,
    serialNumber,
    meterAnomalyImage,
    additionalInformationProgramming,
    circuitBreakerProperlyEngaged,
    enterTheAnomalyCircuitBreakerInterlock,
    additionalInformationCircuitBreakerInterlock,
    customerFeedbackComment,
    customerSignatureImage,
    isGripCase,
    gripCaseReason,
    noticeOfPassageImage1,
    noticeOfPassageImage2,
    displacementPhotoImage1,
    displacementPhotoImage2,
    gripCaseComment
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is InterventionDetailsTableData &&
              other.id == this.id &&
              other.startTimeOfIntervention == this.startTimeOfIntervention &&
              other.endTimeOfIntervention == this.endTimeOfIntervention &&
              other.latitude == this.latitude &&
              other.longitude == this.longitude &&
              other.localMeterImage == this.localMeterImage &&
              other.meterNumberImage == this.meterNumberImage &&
              other.countingPanelImage == this.countingPanelImage &&
              other.confirmPpePorts == this.confirmPpePorts &&
              other.confirmMacronsInstallation == this.confirmMacronsInstallation &&
              other.confirmTop == this.confirmTop &&
              other.canYouGetStartedToday == this.canYouGetStartedToday &&
              other.circuitBreakerBrand == this.circuitBreakerBrand &&
              other.month == this.month &&
              other.year == this.year &&
              other.serialNumberScanImage == this.serialNumberScanImage &&
              other.sizeControlImage == this.sizeControlImage &&
              other.testOfVat == this.testOfVat &&
              other.settingsAnomaly == this.settingsAnomaly &&
              other.circuitBreakerMalfuncttion == this.circuitBreakerMalfuncttion &&
              other.meterRate == this.meterRate &&
              other.fullTimeRate == this.fullTimeRate &&
              other.offPeakTime == this.offPeakTime &&
              other.photoOfIndexImage == this.photoOfIndexImage &&
              other.positionOfPhaseConductorImage ==
                  this.positionOfPhaseConductorImage &&
              other.isTheDriverWellPositioned == this.isTheDriverWellPositioned &&
              other.reasonFOrDriverNotWellPositioned ==
                  this.reasonFOrDriverNotWellPositioned &&
              other.beforeCcpiLoggingImage1 == this.beforeCcpiLoggingImage1 &&
              other.beforeCcpiLoggingImage2 == this.beforeCcpiLoggingImage2 &&
              other.afterCcpiLoggingImage1 == this.afterCcpiLoggingImage1 &&
              other.afterCcpiLoggingImage2 == this.afterCcpiLoggingImage2 &&
              other.identificationBetweenPhaseAndNeutral ==
                  this.identificationBetweenPhaseAndNeutral &&
              other.oldMeterImage == this.oldMeterImage &&
              other.terminalBlockTightenedPowerImage ==
                  this.terminalBlockTightenedPowerImage &&
              other.terminalCoverPutBackInPlaceImage ==
                  this.terminalCoverPutBackInPlaceImage &&
              other.oldMeterDepositedImage == this.oldMeterDepositedImage &&
              other.electricalEquipmentDepositedImage ==
                  this.electricalEquipmentDepositedImage &&
              other.enterAdditionallyMaterial == this.enterAdditionallyMaterial &&
              other.presenceOfPnt == this.presenceOfPnt &&
              other.inversionBetweenPhaseAndMaterial ==
                  this.inversionBetweenPhaseAndMaterial &&
              other.resumptionOfEnslavement == this.resumptionOfEnslavement &&
              other.ictCabling == this.ictCabling &&
              other.photoOfWiringImage == this.photoOfWiringImage &&
              other.photosOfNewMeterInstalled == this.photosOfNewMeterInstalled &&
              other.hasTheCircuitBreakerBeenReplaced ==
                  this.hasTheCircuitBreakerBeenReplaced &&
              other.resonForCircuitBreakerNonReplacement ==
                  this.resonForCircuitBreakerNonReplacement &&
              other.circuitBreakerLead == this.circuitBreakerLead &&
              other.reasonForNoncircuitBreakerLead ==
                  this.reasonForNoncircuitBreakerLead &&
              other.leadCCPI == this.leadCCPI &&
              other.indicateReasonForCircuitBreakerSettings ==
                  this.indicateReasonForCircuitBreakerSettings &&
              other.circuitBreakerGuageImage == this.circuitBreakerGuageImage &&
              other.modifiedCircuitBreakerCapacity ==
                  this.modifiedCircuitBreakerCapacity &&
              other.calibratedPower == this.calibratedPower &&
              other.reasonForNonModifiedCircuitBreakerCapacity ==
                  this.reasonForNonModifiedCircuitBreakerCapacity &&
              other.statusOfInstalledMeter == this.statusOfInstalledMeter &&
              other.enterTheAnomalyProgramming == this.enterTheAnomalyProgramming &&
              other.serialNumber == this.serialNumber &&
              other.meterAnomalyImage == this.meterAnomalyImage &&
              other.additionalInformationProgramming ==
                  this.additionalInformationProgramming &&
              other.circuitBreakerProperlyEngaged ==
                  this.circuitBreakerProperlyEngaged &&
              other.enterTheAnomalyCircuitBreakerInterlock ==
                  this.enterTheAnomalyCircuitBreakerInterlock &&
              other.additionalInformationCircuitBreakerInterlock ==
                  this.additionalInformationCircuitBreakerInterlock &&
              other.customerFeedbackComment == this.customerFeedbackComment &&
              other.customerSignatureImage == this.customerSignatureImage &&
              other.isGripCase == this.isGripCase &&
              other.gripCaseReason == this.gripCaseReason &&
              other.noticeOfPassageImage1 == this.noticeOfPassageImage1 &&
              other.noticeOfPassageImage2 == this.noticeOfPassageImage2 &&
              other.displacementPhotoImage1 == this.displacementPhotoImage1 &&
              other.displacementPhotoImage2 == this.displacementPhotoImage2 &&
              other.gripCaseComment == this.gripCaseComment);
}

class InterventionDetailsTableCompanion
    extends UpdateCompanion<InterventionDetailsTableData> {
  final Value<int> id;
  final Value<String?> startTimeOfIntervention;
  final Value<String?> endTimeOfIntervention;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> localMeterImage;
  final Value<String?> meterNumberImage;
  final Value<String?> countingPanelImage;
  final Value<bool?> confirmPpePorts;
  final Value<bool?> confirmMacronsInstallation;
  final Value<bool?> confirmTop;
  final Value<bool?> canYouGetStartedToday;
  final Value<String?> circuitBreakerBrand;
  final Value<String?> month;
  final Value<String?> year;
  final Value<String?> serialNumberScanImage;
  final Value<String?> sizeControlImage;
  final Value<bool?> testOfVat;
  final Value<bool?> settingsAnomaly;
  final Value<bool?> circuitBreakerMalfuncttion;
  final Value<String?> meterRate;
  final Value<String?> fullTimeRate;
  final Value<String?> offPeakTime;
  final Value<String?> photoOfIndexImage;
  final Value<String?> positionOfPhaseConductorImage;
  final Value<bool?> isTheDriverWellPositioned;
  final Value<String?> reasonFOrDriverNotWellPositioned;
  final Value<String?> beforeCcpiLoggingImage1;
  final Value<String?> beforeCcpiLoggingImage2;
  final Value<String?> afterCcpiLoggingImage1;
  final Value<String?> afterCcpiLoggingImage2;
  final Value<bool?> identificationBetweenPhaseAndNeutral;
  final Value<String?> oldMeterImage;
  final Value<String?> terminalBlockTightenedPowerImage;
  final Value<String?> terminalCoverPutBackInPlaceImage;
  final Value<String?> oldMeterDepositedImage;
  final Value<String?> electricalEquipmentDepositedImage;
  final Value<String?> enterAdditionallyMaterial;
  final Value<bool?> presenceOfPnt;
  final Value<bool?> inversionBetweenPhaseAndMaterial;
  final Value<bool?> resumptionOfEnslavement;
  final Value<bool?> ictCabling;
  final Value<String?> photoOfWiringImage;
  final Value<String?> photosOfNewMeterInstalled;
  final Value<bool?> hasTheCircuitBreakerBeenReplaced;
  final Value<String?> resonForCircuitBreakerNonReplacement;
  final Value<bool?> circuitBreakerLead;
  final Value<String?> reasonForNoncircuitBreakerLead;
  final Value<bool?> leadCCPI;
  final Value<String?> indicateReasonForCircuitBreakerSettings;
  final Value<String?> circuitBreakerGuageImage;
  final Value<bool?> modifiedCircuitBreakerCapacity;
  final Value<String?> calibratedPower;
  final Value<String?> reasonForNonModifiedCircuitBreakerCapacity;
  final Value<bool?> statusOfInstalledMeter;
  final Value<String?> enterTheAnomalyProgramming;
  final Value<String?> serialNumber;
  final Value<String?> meterAnomalyImage;
  final Value<String?> additionalInformationProgramming;
  final Value<bool?> circuitBreakerProperlyEngaged;
  final Value<String?> enterTheAnomalyCircuitBreakerInterlock;
  final Value<String?> additionalInformationCircuitBreakerInterlock;
  final Value<String?> customerFeedbackComment;
  final Value<String?> customerSignatureImage;
  final Value<bool?> isGripCase;
  final Value<String?> gripCaseReason;
  final Value<String?> noticeOfPassageImage1;
  final Value<String?> noticeOfPassageImage2;
  final Value<String?> displacementPhotoImage1;
  final Value<String?> displacementPhotoImage2;
  final Value<String?> gripCaseComment;
  const InterventionDetailsTableCompanion({
    this.id = const Value.absent(),
    this.startTimeOfIntervention = const Value.absent(),
    this.endTimeOfIntervention = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.localMeterImage = const Value.absent(),
    this.meterNumberImage = const Value.absent(),
    this.countingPanelImage = const Value.absent(),
    this.confirmPpePorts = const Value.absent(),
    this.confirmMacronsInstallation = const Value.absent(),
    this.confirmTop = const Value.absent(),
    this.canYouGetStartedToday = const Value.absent(),
    this.circuitBreakerBrand = const Value.absent(),
    this.month = const Value.absent(),
    this.year = const Value.absent(),
    this.serialNumberScanImage = const Value.absent(),
    this.sizeControlImage = const Value.absent(),
    this.testOfVat = const Value.absent(),
    this.settingsAnomaly = const Value.absent(),
    this.circuitBreakerMalfuncttion = const Value.absent(),
    this.meterRate = const Value.absent(),
    this.fullTimeRate = const Value.absent(),
    this.offPeakTime = const Value.absent(),
    this.photoOfIndexImage = const Value.absent(),
    this.positionOfPhaseConductorImage = const Value.absent(),
    this.isTheDriverWellPositioned = const Value.absent(),
    this.reasonFOrDriverNotWellPositioned = const Value.absent(),
    this.beforeCcpiLoggingImage1 = const Value.absent(),
    this.beforeCcpiLoggingImage2 = const Value.absent(),
    this.afterCcpiLoggingImage1 = const Value.absent(),
    this.afterCcpiLoggingImage2 = const Value.absent(),
    this.identificationBetweenPhaseAndNeutral = const Value.absent(),
    this.oldMeterImage = const Value.absent(),
    this.terminalBlockTightenedPowerImage = const Value.absent(),
    this.terminalCoverPutBackInPlaceImage = const Value.absent(),
    this.oldMeterDepositedImage = const Value.absent(),
    this.electricalEquipmentDepositedImage = const Value.absent(),
    this.enterAdditionallyMaterial = const Value.absent(),
    this.presenceOfPnt = const Value.absent(),
    this.inversionBetweenPhaseAndMaterial = const Value.absent(),
    this.resumptionOfEnslavement = const Value.absent(),
    this.ictCabling = const Value.absent(),
    this.photoOfWiringImage = const Value.absent(),
    this.photosOfNewMeterInstalled = const Value.absent(),
    this.hasTheCircuitBreakerBeenReplaced = const Value.absent(),
    this.resonForCircuitBreakerNonReplacement = const Value.absent(),
    this.circuitBreakerLead = const Value.absent(),
    this.reasonForNoncircuitBreakerLead = const Value.absent(),
    this.leadCCPI = const Value.absent(),
    this.indicateReasonForCircuitBreakerSettings = const Value.absent(),
    this.circuitBreakerGuageImage = const Value.absent(),
    this.modifiedCircuitBreakerCapacity = const Value.absent(),
    this.calibratedPower = const Value.absent(),
    this.reasonForNonModifiedCircuitBreakerCapacity = const Value.absent(),
    this.statusOfInstalledMeter = const Value.absent(),
    this.enterTheAnomalyProgramming = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.meterAnomalyImage = const Value.absent(),
    this.additionalInformationProgramming = const Value.absent(),
    this.circuitBreakerProperlyEngaged = const Value.absent(),
    this.enterTheAnomalyCircuitBreakerInterlock = const Value.absent(),
    this.additionalInformationCircuitBreakerInterlock = const Value.absent(),
    this.customerFeedbackComment = const Value.absent(),
    this.customerSignatureImage = const Value.absent(),
    this.isGripCase = const Value.absent(),
    this.gripCaseReason = const Value.absent(),
    this.noticeOfPassageImage1 = const Value.absent(),
    this.noticeOfPassageImage2 = const Value.absent(),
    this.displacementPhotoImage1 = const Value.absent(),
    this.displacementPhotoImage2 = const Value.absent(),
    this.gripCaseComment = const Value.absent(),
  });
  InterventionDetailsTableCompanion.insert({
    this.id = const Value.absent(),
    this.startTimeOfIntervention = const Value.absent(),
    this.endTimeOfIntervention = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.localMeterImage = const Value.absent(),
    this.meterNumberImage = const Value.absent(),
    this.countingPanelImage = const Value.absent(),
    this.confirmPpePorts = const Value.absent(),
    this.confirmMacronsInstallation = const Value.absent(),
    this.confirmTop = const Value.absent(),
    this.canYouGetStartedToday = const Value.absent(),
    this.circuitBreakerBrand = const Value.absent(),
    this.month = const Value.absent(),
    this.year = const Value.absent(),
    this.serialNumberScanImage = const Value.absent(),
    this.sizeControlImage = const Value.absent(),
    this.testOfVat = const Value.absent(),
    this.settingsAnomaly = const Value.absent(),
    this.circuitBreakerMalfuncttion = const Value.absent(),
    this.meterRate = const Value.absent(),
    this.fullTimeRate = const Value.absent(),
    this.offPeakTime = const Value.absent(),
    this.photoOfIndexImage = const Value.absent(),
    this.positionOfPhaseConductorImage = const Value.absent(),
    this.isTheDriverWellPositioned = const Value.absent(),
    this.reasonFOrDriverNotWellPositioned = const Value.absent(),
    this.beforeCcpiLoggingImage1 = const Value.absent(),
    this.beforeCcpiLoggingImage2 = const Value.absent(),
    this.afterCcpiLoggingImage1 = const Value.absent(),
    this.afterCcpiLoggingImage2 = const Value.absent(),
    this.identificationBetweenPhaseAndNeutral = const Value.absent(),
    this.oldMeterImage = const Value.absent(),
    this.terminalBlockTightenedPowerImage = const Value.absent(),
    this.terminalCoverPutBackInPlaceImage = const Value.absent(),
    this.oldMeterDepositedImage = const Value.absent(),
    this.electricalEquipmentDepositedImage = const Value.absent(),
    this.enterAdditionallyMaterial = const Value.absent(),
    this.presenceOfPnt = const Value.absent(),
    this.inversionBetweenPhaseAndMaterial = const Value.absent(),
    this.resumptionOfEnslavement = const Value.absent(),
    this.ictCabling = const Value.absent(),
    this.photoOfWiringImage = const Value.absent(),
    this.photosOfNewMeterInstalled = const Value.absent(),
    this.hasTheCircuitBreakerBeenReplaced = const Value.absent(),
    this.resonForCircuitBreakerNonReplacement = const Value.absent(),
    this.circuitBreakerLead = const Value.absent(),
    this.reasonForNoncircuitBreakerLead = const Value.absent(),
    this.leadCCPI = const Value.absent(),
    this.indicateReasonForCircuitBreakerSettings = const Value.absent(),
    this.circuitBreakerGuageImage = const Value.absent(),
    this.modifiedCircuitBreakerCapacity = const Value.absent(),
    this.calibratedPower = const Value.absent(),
    this.reasonForNonModifiedCircuitBreakerCapacity = const Value.absent(),
    this.statusOfInstalledMeter = const Value.absent(),
    this.enterTheAnomalyProgramming = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.meterAnomalyImage = const Value.absent(),
    this.additionalInformationProgramming = const Value.absent(),
    this.circuitBreakerProperlyEngaged = const Value.absent(),
    this.enterTheAnomalyCircuitBreakerInterlock = const Value.absent(),
    this.additionalInformationCircuitBreakerInterlock = const Value.absent(),
    this.customerFeedbackComment = const Value.absent(),
    this.customerSignatureImage = const Value.absent(),
    this.isGripCase = const Value.absent(),
    this.gripCaseReason = const Value.absent(),
    this.noticeOfPassageImage1 = const Value.absent(),
    this.noticeOfPassageImage2 = const Value.absent(),
    this.displacementPhotoImage1 = const Value.absent(),
    this.displacementPhotoImage2 = const Value.absent(),
    this.gripCaseComment = const Value.absent(),
  });
  static Insertable<InterventionDetailsTableData> custom({
    Expression<int>? id,
    Expression<String?>? startTimeOfIntervention,
    Expression<String?>? endTimeOfIntervention,
    Expression<double?>? latitude,
    Expression<double?>? longitude,
    Expression<String?>? localMeterImage,
    Expression<String?>? meterNumberImage,
    Expression<String?>? countingPanelImage,
    Expression<bool?>? confirmPpePorts,
    Expression<bool?>? confirmMacronsInstallation,
    Expression<bool?>? confirmTop,
    Expression<bool?>? canYouGetStartedToday,
    Expression<String?>? circuitBreakerBrand,
    Expression<String?>? month,
    Expression<String?>? year,
    Expression<String?>? serialNumberScanImage,
    Expression<String?>? sizeControlImage,
    Expression<bool?>? testOfVat,
    Expression<bool?>? settingsAnomaly,
    Expression<bool?>? circuitBreakerMalfuncttion,
    Expression<String?>? meterRate,
    Expression<String?>? fullTimeRate,
    Expression<String?>? offPeakTime,
    Expression<String?>? photoOfIndexImage,
    Expression<String?>? positionOfPhaseConductorImage,
    Expression<bool?>? isTheDriverWellPositioned,
    Expression<String?>? reasonFOrDriverNotWellPositioned,
    Expression<String?>? beforeCcpiLoggingImage1,
    Expression<String?>? beforeCcpiLoggingImage2,
    Expression<String?>? afterCcpiLoggingImage1,
    Expression<String?>? afterCcpiLoggingImage2,
    Expression<bool?>? identificationBetweenPhaseAndNeutral,
    Expression<String?>? oldMeterImage,
    Expression<String?>? terminalBlockTightenedPowerImage,
    Expression<String?>? terminalCoverPutBackInPlaceImage,
    Expression<String?>? oldMeterDepositedImage,
    Expression<String?>? electricalEquipmentDepositedImage,
    Expression<String?>? enterAdditionallyMaterial,
    Expression<bool?>? presenceOfPnt,
    Expression<bool?>? inversionBetweenPhaseAndMaterial,
    Expression<bool?>? resumptionOfEnslavement,
    Expression<bool?>? ictCabling,
    Expression<String?>? photoOfWiringImage,
    Expression<String?>? photosOfNewMeterInstalled,
    Expression<bool?>? hasTheCircuitBreakerBeenReplaced,
    Expression<String?>? resonForCircuitBreakerNonReplacement,
    Expression<bool?>? circuitBreakerLead,
    Expression<String?>? reasonForNoncircuitBreakerLead,
    Expression<bool?>? leadCCPI,
    Expression<String?>? indicateReasonForCircuitBreakerSettings,
    Expression<String?>? circuitBreakerGuageImage,
    Expression<bool?>? modifiedCircuitBreakerCapacity,
    Expression<String?>? calibratedPower,
    Expression<String?>? reasonForNonModifiedCircuitBreakerCapacity,
    Expression<bool?>? statusOfInstalledMeter,
    Expression<String?>? enterTheAnomalyProgramming,
    Expression<String?>? serialNumber,
    Expression<String?>? meterAnomalyImage,
    Expression<String?>? additionalInformationProgramming,
    Expression<bool?>? circuitBreakerProperlyEngaged,
    Expression<String?>? enterTheAnomalyCircuitBreakerInterlock,
    Expression<String?>? additionalInformationCircuitBreakerInterlock,
    Expression<String?>? customerFeedbackComment,
    Expression<String?>? customerSignatureImage,
    Expression<bool?>? isGripCase,
    Expression<String?>? gripCaseReason,
    Expression<String?>? noticeOfPassageImage1,
    Expression<String?>? noticeOfPassageImage2,
    Expression<String?>? displacementPhotoImage1,
    Expression<String?>? displacementPhotoImage2,
    Expression<String?>? gripCaseComment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTimeOfIntervention != null)
        'start_time_of_intervention': startTimeOfIntervention,
      if (endTimeOfIntervention != null)
        'end_time_of_intervention': endTimeOfIntervention,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (localMeterImage != null) 'local_meter_image': localMeterImage,
      if (meterNumberImage != null) 'meter_number_image': meterNumberImage,
      if (countingPanelImage != null)
        'counting_panel_image': countingPanelImage,
      if (confirmPpePorts != null) 'confirm_ppe_ports': confirmPpePorts,
      if (confirmMacronsInstallation != null)
        'confirm_macrons_installation': confirmMacronsInstallation,
      if (confirmTop != null) 'confirm_top': confirmTop,
      if (canYouGetStartedToday != null)
        'can_you_get_started_today': canYouGetStartedToday,
      if (circuitBreakerBrand != null)
        'circuit_breaker_brand': circuitBreakerBrand,
      if (month != null) 'month': month,
      if (year != null) 'year': year,
      if (serialNumberScanImage != null)
        'serial_number_scan_image': serialNumberScanImage,
      if (sizeControlImage != null) 'size_control_image': sizeControlImage,
      if (testOfVat != null) 'test_of_vat': testOfVat,
      if (settingsAnomaly != null) 'settings_anomaly': settingsAnomaly,
      if (circuitBreakerMalfuncttion != null)
        'circuit_breaker_malfuncttion': circuitBreakerMalfuncttion,
      if (meterRate != null) 'meter_rate': meterRate,
      if (fullTimeRate != null) 'full_time_rate': fullTimeRate,
      if (offPeakTime != null) 'off_peak_time': offPeakTime,
      if (photoOfIndexImage != null) 'photo_of_index_image': photoOfIndexImage,
      if (positionOfPhaseConductorImage != null)
        'position_of_phase_conductor_image': positionOfPhaseConductorImage,
      if (isTheDriverWellPositioned != null)
        'is_the_driver_well_positioned': isTheDriverWellPositioned,
      if (reasonFOrDriverNotWellPositioned != null)
        'reason_f_or_driver_not_well_positioned':
        reasonFOrDriverNotWellPositioned,
      if (beforeCcpiLoggingImage1 != null)
        'before_ccpi_logging_image1': beforeCcpiLoggingImage1,
      if (beforeCcpiLoggingImage2 != null)
        'before_ccpi_logging_image2': beforeCcpiLoggingImage2,
      if (afterCcpiLoggingImage1 != null)
        'after_ccpi_logging_image1': afterCcpiLoggingImage1,
      if (afterCcpiLoggingImage2 != null)
        'after_ccpi_logging_image2': afterCcpiLoggingImage2,
      if (identificationBetweenPhaseAndNeutral != null)
        'identification_between_phase_and_neutral':
        identificationBetweenPhaseAndNeutral,
      if (oldMeterImage != null) 'old_meter_image': oldMeterImage,
      if (terminalBlockTightenedPowerImage != null)
        'terminal_block_tightened_power_image':
        terminalBlockTightenedPowerImage,
      if (terminalCoverPutBackInPlaceImage != null)
        'terminal_cover_put_back_in_place_image':
        terminalCoverPutBackInPlaceImage,
      if (oldMeterDepositedImage != null)
        'old_meter_deposited_image': oldMeterDepositedImage,
      if (electricalEquipmentDepositedImage != null)
        'electrical_equipment_deposited_image':
        electricalEquipmentDepositedImage,
      if (enterAdditionallyMaterial != null)
        'enter_additionally_material': enterAdditionallyMaterial,
      if (presenceOfPnt != null) 'presence_of_pnt': presenceOfPnt,
      if (inversionBetweenPhaseAndMaterial != null)
        'inversion_between_phase_and_material':
        inversionBetweenPhaseAndMaterial,
      if (resumptionOfEnslavement != null)
        'resumption_of_enslavement': resumptionOfEnslavement,
      if (ictCabling != null) 'ict_cabling': ictCabling,
      if (photoOfWiringImage != null)
        'photo_of_wiring_image': photoOfWiringImage,
      if (photosOfNewMeterInstalled != null)
        'photos_of_new_meter_installed': photosOfNewMeterInstalled,
      if (hasTheCircuitBreakerBeenReplaced != null)
        'has_the_circuit_breaker_been_replaced':
        hasTheCircuitBreakerBeenReplaced,
      if (resonForCircuitBreakerNonReplacement != null)
        'reson_for_circuit_breaker_non_replacement':
        resonForCircuitBreakerNonReplacement,
      if (circuitBreakerLead != null)
        'circuit_breaker_lead': circuitBreakerLead,
      if (reasonForNoncircuitBreakerLead != null)
        'reason_for_noncircuit_breaker_lead': reasonForNoncircuitBreakerLead,
      if (leadCCPI != null) 'lead_c_c_p_i': leadCCPI,
      if (indicateReasonForCircuitBreakerSettings != null)
        'indicate_reason_for_circuit_breaker_settings':
        indicateReasonForCircuitBreakerSettings,
      if (circuitBreakerGuageImage != null)
        'circuit_breaker_guage_image': circuitBreakerGuageImage,
      if (modifiedCircuitBreakerCapacity != null)
        'modified_circuit_breaker_capacity': modifiedCircuitBreakerCapacity,
      if (calibratedPower != null) 'calibrated_power': calibratedPower,
      if (reasonForNonModifiedCircuitBreakerCapacity != null)
        'reason_for_non_modified_circuit_breaker_capacity':
        reasonForNonModifiedCircuitBreakerCapacity,
      if (statusOfInstalledMeter != null)
        'status_of_installed_meter': statusOfInstalledMeter,
      if (enterTheAnomalyProgramming != null)
        'enter_the_anomaly_programming': enterTheAnomalyProgramming,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (meterAnomalyImage != null) 'meter_anomaly_image': meterAnomalyImage,
      if (additionalInformationProgramming != null)
        'additional_information_programming': additionalInformationProgramming,
      if (circuitBreakerProperlyEngaged != null)
        'circuit_breaker_properly_engaged': circuitBreakerProperlyEngaged,
      if (enterTheAnomalyCircuitBreakerInterlock != null)
        'enter_the_anomaly_circuit_breaker_interlock':
        enterTheAnomalyCircuitBreakerInterlock,
      if (additionalInformationCircuitBreakerInterlock != null)
        'additional_information_circuit_breaker_interlock':
        additionalInformationCircuitBreakerInterlock,
      if (customerFeedbackComment != null)
        'customer_feedback_comment': customerFeedbackComment,
      if (customerSignatureImage != null)
        'customer_signature_image': customerSignatureImage,
      if (isGripCase != null) 'is_grip_case': isGripCase,
      if (gripCaseReason != null) 'grip_case_reason': gripCaseReason,
      if (noticeOfPassageImage1 != null)
        'notice_of_passage_image1': noticeOfPassageImage1,
      if (noticeOfPassageImage2 != null)
        'notice_of_passage_image2': noticeOfPassageImage2,
      if (displacementPhotoImage1 != null)
        'displacement_photo_image1': displacementPhotoImage1,
      if (displacementPhotoImage2 != null)
        'displacement_photo_image2': displacementPhotoImage2,
      if (gripCaseComment != null) 'grip_case_comment': gripCaseComment,
    });
  }

  InterventionDetailsTableCompanion copyWith(
      {Value<int>? id,
        Value<String?>? startTimeOfIntervention,
        Value<String?>? endTimeOfIntervention,
        Value<double?>? latitude,
        Value<double?>? longitude,
        Value<String?>? localMeterImage,
        Value<String?>? meterNumberImage,
        Value<String?>? countingPanelImage,
        Value<bool?>? confirmPpePorts,
        Value<bool?>? confirmMacronsInstallation,
        Value<bool?>? confirmTop,
        Value<bool?>? canYouGetStartedToday,
        Value<String?>? circuitBreakerBrand,
        Value<String?>? month,
        Value<String?>? year,
        Value<String?>? serialNumberScanImage,
        Value<String?>? sizeControlImage,
        Value<bool?>? testOfVat,
        Value<bool?>? settingsAnomaly,
        Value<bool?>? circuitBreakerMalfuncttion,
        Value<String?>? meterRate,
        Value<String?>? fullTimeRate,
        Value<String?>? offPeakTime,
        Value<String?>? photoOfIndexImage,
        Value<String?>? positionOfPhaseConductorImage,
        Value<bool?>? isTheDriverWellPositioned,
        Value<String?>? reasonFOrDriverNotWellPositioned,
        Value<String?>? beforeCcpiLoggingImage1,
        Value<String?>? beforeCcpiLoggingImage2,
        Value<String?>? afterCcpiLoggingImage1,
        Value<String?>? afterCcpiLoggingImage2,
        Value<bool?>? identificationBetweenPhaseAndNeutral,
        Value<String?>? oldMeterImage,
        Value<String?>? terminalBlockTightenedPowerImage,
        Value<String?>? terminalCoverPutBackInPlaceImage,
        Value<String?>? oldMeterDepositedImage,
        Value<String?>? electricalEquipmentDepositedImage,
        Value<String?>? enterAdditionallyMaterial,
        Value<bool?>? presenceOfPnt,
        Value<bool?>? inversionBetweenPhaseAndMaterial,
        Value<bool?>? resumptionOfEnslavement,
        Value<bool?>? ictCabling,
        Value<String?>? photoOfWiringImage,
        Value<String?>? photosOfNewMeterInstalled,
        Value<bool?>? hasTheCircuitBreakerBeenReplaced,
        Value<String?>? resonForCircuitBreakerNonReplacement,
        Value<bool?>? circuitBreakerLead,
        Value<String?>? reasonForNoncircuitBreakerLead,
        Value<bool?>? leadCCPI,
        Value<String?>? indicateReasonForCircuitBreakerSettings,
        Value<String?>? circuitBreakerGuageImage,
        Value<bool?>? modifiedCircuitBreakerCapacity,
        Value<String?>? calibratedPower,
        Value<String?>? reasonForNonModifiedCircuitBreakerCapacity,
        Value<bool?>? statusOfInstalledMeter,
        Value<String?>? enterTheAnomalyProgramming,
        Value<String?>? serialNumber,
        Value<String?>? meterAnomalyImage,
        Value<String?>? additionalInformationProgramming,
        Value<bool?>? circuitBreakerProperlyEngaged,
        Value<String?>? enterTheAnomalyCircuitBreakerInterlock,
        Value<String?>? additionalInformationCircuitBreakerInterlock,
        Value<String?>? customerFeedbackComment,
        Value<String?>? customerSignatureImage,
        Value<bool?>? isGripCase,
        Value<String?>? gripCaseReason,
        Value<String?>? noticeOfPassageImage1,
        Value<String?>? noticeOfPassageImage2,
        Value<String?>? displacementPhotoImage1,
        Value<String?>? displacementPhotoImage2,
        Value<String?>? gripCaseComment}) {
    return InterventionDetailsTableCompanion(
      id: id ?? this.id,
      startTimeOfIntervention:
      startTimeOfIntervention ?? this.startTimeOfIntervention,
      endTimeOfIntervention:
      endTimeOfIntervention ?? this.endTimeOfIntervention,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      localMeterImage: localMeterImage ?? this.localMeterImage,
      meterNumberImage: meterNumberImage ?? this.meterNumberImage,
      countingPanelImage: countingPanelImage ?? this.countingPanelImage,
      confirmPpePorts: confirmPpePorts ?? this.confirmPpePorts,
      confirmMacronsInstallation:
      confirmMacronsInstallation ?? this.confirmMacronsInstallation,
      confirmTop: confirmTop ?? this.confirmTop,
      canYouGetStartedToday:
      canYouGetStartedToday ?? this.canYouGetStartedToday,
      circuitBreakerBrand: circuitBreakerBrand ?? this.circuitBreakerBrand,
      month: month ?? this.month,
      year: year ?? this.year,
      serialNumberScanImage:
      serialNumberScanImage ?? this.serialNumberScanImage,
      sizeControlImage: sizeControlImage ?? this.sizeControlImage,
      testOfVat: testOfVat ?? this.testOfVat,
      settingsAnomaly: settingsAnomaly ?? this.settingsAnomaly,
      circuitBreakerMalfuncttion:
      circuitBreakerMalfuncttion ?? this.circuitBreakerMalfuncttion,
      meterRate: meterRate ?? this.meterRate,
      fullTimeRate: fullTimeRate ?? this.fullTimeRate,
      offPeakTime: offPeakTime ?? this.offPeakTime,
      photoOfIndexImage: photoOfIndexImage ?? this.photoOfIndexImage,
      positionOfPhaseConductorImage:
      positionOfPhaseConductorImage ?? this.positionOfPhaseConductorImage,
      isTheDriverWellPositioned:
      isTheDriverWellPositioned ?? this.isTheDriverWellPositioned,
      reasonFOrDriverNotWellPositioned: reasonFOrDriverNotWellPositioned ??
          this.reasonFOrDriverNotWellPositioned,
      beforeCcpiLoggingImage1:
      beforeCcpiLoggingImage1 ?? this.beforeCcpiLoggingImage1,
      beforeCcpiLoggingImage2:
      beforeCcpiLoggingImage2 ?? this.beforeCcpiLoggingImage2,
      afterCcpiLoggingImage1:
      afterCcpiLoggingImage1 ?? this.afterCcpiLoggingImage1,
      afterCcpiLoggingImage2:
      afterCcpiLoggingImage2 ?? this.afterCcpiLoggingImage2,
      identificationBetweenPhaseAndNeutral:
      identificationBetweenPhaseAndNeutral ??
          this.identificationBetweenPhaseAndNeutral,
      oldMeterImage: oldMeterImage ?? this.oldMeterImage,
      terminalBlockTightenedPowerImage: terminalBlockTightenedPowerImage ??
          this.terminalBlockTightenedPowerImage,
      terminalCoverPutBackInPlaceImage: terminalCoverPutBackInPlaceImage ??
          this.terminalCoverPutBackInPlaceImage,
      oldMeterDepositedImage:
      oldMeterDepositedImage ?? this.oldMeterDepositedImage,
      electricalEquipmentDepositedImage: electricalEquipmentDepositedImage ??
          this.electricalEquipmentDepositedImage,
      enterAdditionallyMaterial:
      enterAdditionallyMaterial ?? this.enterAdditionallyMaterial,
      presenceOfPnt: presenceOfPnt ?? this.presenceOfPnt,
      inversionBetweenPhaseAndMaterial: inversionBetweenPhaseAndMaterial ??
          this.inversionBetweenPhaseAndMaterial,
      resumptionOfEnslavement:
      resumptionOfEnslavement ?? this.resumptionOfEnslavement,
      ictCabling: ictCabling ?? this.ictCabling,
      photoOfWiringImage: photoOfWiringImage ?? this.photoOfWiringImage,
      photosOfNewMeterInstalled:
      photosOfNewMeterInstalled ?? this.photosOfNewMeterInstalled,
      hasTheCircuitBreakerBeenReplaced: hasTheCircuitBreakerBeenReplaced ??
          this.hasTheCircuitBreakerBeenReplaced,
      resonForCircuitBreakerNonReplacement:
      resonForCircuitBreakerNonReplacement ??
          this.resonForCircuitBreakerNonReplacement,
      circuitBreakerLead: circuitBreakerLead ?? this.circuitBreakerLead,
      reasonForNoncircuitBreakerLead:
      reasonForNoncircuitBreakerLead ?? this.reasonForNoncircuitBreakerLead,
      leadCCPI: leadCCPI ?? this.leadCCPI,
      indicateReasonForCircuitBreakerSettings:
      indicateReasonForCircuitBreakerSettings ??
          this.indicateReasonForCircuitBreakerSettings,
      circuitBreakerGuageImage:
      circuitBreakerGuageImage ?? this.circuitBreakerGuageImage,
      modifiedCircuitBreakerCapacity:
      modifiedCircuitBreakerCapacity ?? this.modifiedCircuitBreakerCapacity,
      calibratedPower: calibratedPower ?? this.calibratedPower,
      reasonForNonModifiedCircuitBreakerCapacity:
      reasonForNonModifiedCircuitBreakerCapacity ??
          this.reasonForNonModifiedCircuitBreakerCapacity,
      statusOfInstalledMeter:
      statusOfInstalledMeter ?? this.statusOfInstalledMeter,
      enterTheAnomalyProgramming:
      enterTheAnomalyProgramming ?? this.enterTheAnomalyProgramming,
      serialNumber: serialNumber ?? this.serialNumber,
      meterAnomalyImage: meterAnomalyImage ?? this.meterAnomalyImage,
      additionalInformationProgramming: additionalInformationProgramming ??
          this.additionalInformationProgramming,
      circuitBreakerProperlyEngaged:
      circuitBreakerProperlyEngaged ?? this.circuitBreakerProperlyEngaged,
      enterTheAnomalyCircuitBreakerInterlock:
      enterTheAnomalyCircuitBreakerInterlock ??
          this.enterTheAnomalyCircuitBreakerInterlock,
      additionalInformationCircuitBreakerInterlock:
      additionalInformationCircuitBreakerInterlock ??
          this.additionalInformationCircuitBreakerInterlock,
      customerFeedbackComment:
      customerFeedbackComment ?? this.customerFeedbackComment,
      customerSignatureImage:
      customerSignatureImage ?? this.customerSignatureImage,
      isGripCase: isGripCase ?? this.isGripCase,
      gripCaseReason: gripCaseReason ?? this.gripCaseReason,
      noticeOfPassageImage1:
      noticeOfPassageImage1 ?? this.noticeOfPassageImage1,
      noticeOfPassageImage2:
      noticeOfPassageImage2 ?? this.noticeOfPassageImage2,
      displacementPhotoImage1:
      displacementPhotoImage1 ?? this.displacementPhotoImage1,
      displacementPhotoImage2:
      displacementPhotoImage2 ?? this.displacementPhotoImage2,
      gripCaseComment: gripCaseComment ?? this.gripCaseComment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startTimeOfIntervention.present) {
      map['start_time_of_intervention'] =
          Variable<String?>(startTimeOfIntervention.value);
    }
    if (endTimeOfIntervention.present) {
      map['end_time_of_intervention'] =
          Variable<String?>(endTimeOfIntervention.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double?>(longitude.value);
    }
    if (localMeterImage.present) {
      map['local_meter_image'] = Variable<String?>(localMeterImage.value);
    }
    if (meterNumberImage.present) {
      map['meter_number_image'] = Variable<String?>(meterNumberImage.value);
    }
    if (countingPanelImage.present) {
      map['counting_panel_image'] = Variable<String?>(countingPanelImage.value);
    }
    if (confirmPpePorts.present) {
      map['confirm_ppe_ports'] = Variable<bool?>(confirmPpePorts.value);
    }
    if (confirmMacronsInstallation.present) {
      map['confirm_macrons_installation'] =
          Variable<bool?>(confirmMacronsInstallation.value);
    }
    if (confirmTop.present) {
      map['confirm_top'] = Variable<bool?>(confirmTop.value);
    }
    if (canYouGetStartedToday.present) {
      map['can_you_get_started_today'] =
          Variable<bool?>(canYouGetStartedToday.value);
    }
    if (circuitBreakerBrand.present) {
      map['circuit_breaker_brand'] =
          Variable<String?>(circuitBreakerBrand.value);
    }
    if (month.present) {
      map['month'] = Variable<String?>(month.value);
    }
    if (year.present) {
      map['year'] = Variable<String?>(year.value);
    }
    if (serialNumberScanImage.present) {
      map['serial_number_scan_image'] =
          Variable<String?>(serialNumberScanImage.value);
    }
    if (sizeControlImage.present) {
      map['size_control_image'] = Variable<String?>(sizeControlImage.value);
    }
    if (testOfVat.present) {
      map['test_of_vat'] = Variable<bool?>(testOfVat.value);
    }
    if (settingsAnomaly.present) {
      map['settings_anomaly'] = Variable<bool?>(settingsAnomaly.value);
    }
    if (circuitBreakerMalfuncttion.present) {
      map['circuit_breaker_malfuncttion'] =
          Variable<bool?>(circuitBreakerMalfuncttion.value);
    }
    if (meterRate.present) {
      map['meter_rate'] = Variable<String?>(meterRate.value);
    }
    if (fullTimeRate.present) {
      map['full_time_rate'] = Variable<String?>(fullTimeRate.value);
    }
    if (offPeakTime.present) {
      map['off_peak_time'] = Variable<String?>(offPeakTime.value);
    }
    if (photoOfIndexImage.present) {
      map['photo_of_index_image'] = Variable<String?>(photoOfIndexImage.value);
    }
    if (positionOfPhaseConductorImage.present) {
      map['position_of_phase_conductor_image'] =
          Variable<String?>(positionOfPhaseConductorImage.value);
    }
    if (isTheDriverWellPositioned.present) {
      map['is_the_driver_well_positioned'] =
          Variable<bool?>(isTheDriverWellPositioned.value);
    }
    if (reasonFOrDriverNotWellPositioned.present) {
      map['reason_f_or_driver_not_well_positioned'] =
          Variable<String?>(reasonFOrDriverNotWellPositioned.value);
    }
    if (beforeCcpiLoggingImage1.present) {
      map['before_ccpi_logging_image1'] =
          Variable<String?>(beforeCcpiLoggingImage1.value);
    }
    if (beforeCcpiLoggingImage2.present) {
      map['before_ccpi_logging_image2'] =
          Variable<String?>(beforeCcpiLoggingImage2.value);
    }
    if (afterCcpiLoggingImage1.present) {
      map['after_ccpi_logging_image1'] =
          Variable<String?>(afterCcpiLoggingImage1.value);
    }
    if (afterCcpiLoggingImage2.present) {
      map['after_ccpi_logging_image2'] =
          Variable<String?>(afterCcpiLoggingImage2.value);
    }
    if (identificationBetweenPhaseAndNeutral.present) {
      map['identification_between_phase_and_neutral'] =
          Variable<bool?>(identificationBetweenPhaseAndNeutral.value);
    }
    if (oldMeterImage.present) {
      map['old_meter_image'] = Variable<String?>(oldMeterImage.value);
    }
    if (terminalBlockTightenedPowerImage.present) {
      map['terminal_block_tightened_power_image'] =
          Variable<String?>(terminalBlockTightenedPowerImage.value);
    }
    if (terminalCoverPutBackInPlaceImage.present) {
      map['terminal_cover_put_back_in_place_image'] =
          Variable<String?>(terminalCoverPutBackInPlaceImage.value);
    }
    if (oldMeterDepositedImage.present) {
      map['old_meter_deposited_image'] =
          Variable<String?>(oldMeterDepositedImage.value);
    }
    if (electricalEquipmentDepositedImage.present) {
      map['electrical_equipment_deposited_image'] =
          Variable<String?>(electricalEquipmentDepositedImage.value);
    }
    if (enterAdditionallyMaterial.present) {
      map['enter_additionally_material'] =
          Variable<String?>(enterAdditionallyMaterial.value);
    }
    if (presenceOfPnt.present) {
      map['presence_of_pnt'] = Variable<bool?>(presenceOfPnt.value);
    }
    if (inversionBetweenPhaseAndMaterial.present) {
      map['inversion_between_phase_and_material'] =
          Variable<bool?>(inversionBetweenPhaseAndMaterial.value);
    }
    if (resumptionOfEnslavement.present) {
      map['resumption_of_enslavement'] =
          Variable<bool?>(resumptionOfEnslavement.value);
    }
    if (ictCabling.present) {
      map['ict_cabling'] = Variable<bool?>(ictCabling.value);
    }
    if (photoOfWiringImage.present) {
      map['photo_of_wiring_image'] =
          Variable<String?>(photoOfWiringImage.value);
    }
    if (photosOfNewMeterInstalled.present) {
      map['photos_of_new_meter_installed'] =
          Variable<String?>(photosOfNewMeterInstalled.value);
    }
    if (hasTheCircuitBreakerBeenReplaced.present) {
      map['has_the_circuit_breaker_been_replaced'] =
          Variable<bool?>(hasTheCircuitBreakerBeenReplaced.value);
    }
    if (resonForCircuitBreakerNonReplacement.present) {
      map['reson_for_circuit_breaker_non_replacement'] =
          Variable<String?>(resonForCircuitBreakerNonReplacement.value);
    }
    if (circuitBreakerLead.present) {
      map['circuit_breaker_lead'] = Variable<bool?>(circuitBreakerLead.value);
    }
    if (reasonForNoncircuitBreakerLead.present) {
      map['reason_for_noncircuit_breaker_lead'] =
          Variable<String?>(reasonForNoncircuitBreakerLead.value);
    }
    if (leadCCPI.present) {
      map['lead_c_c_p_i'] = Variable<bool?>(leadCCPI.value);
    }
    if (indicateReasonForCircuitBreakerSettings.present) {
      map['indicate_reason_for_circuit_breaker_settings'] =
          Variable<String?>(indicateReasonForCircuitBreakerSettings.value);
    }
    if (circuitBreakerGuageImage.present) {
      map['circuit_breaker_guage_image'] =
          Variable<String?>(circuitBreakerGuageImage.value);
    }
    if (modifiedCircuitBreakerCapacity.present) {
      map['modified_circuit_breaker_capacity'] =
          Variable<bool?>(modifiedCircuitBreakerCapacity.value);
    }
    if (calibratedPower.present) {
      map['calibrated_power'] = Variable<String?>(calibratedPower.value);
    }
    if (reasonForNonModifiedCircuitBreakerCapacity.present) {
      map['reason_for_non_modified_circuit_breaker_capacity'] =
          Variable<String?>(reasonForNonModifiedCircuitBreakerCapacity.value);
    }
    if (statusOfInstalledMeter.present) {
      map['status_of_installed_meter'] =
          Variable<bool?>(statusOfInstalledMeter.value);
    }
    if (enterTheAnomalyProgramming.present) {
      map['enter_the_anomaly_programming'] =
          Variable<String?>(enterTheAnomalyProgramming.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<String?>(serialNumber.value);
    }
    if (meterAnomalyImage.present) {
      map['meter_anomaly_image'] = Variable<String?>(meterAnomalyImage.value);
    }
    if (additionalInformationProgramming.present) {
      map['additional_information_programming'] =
          Variable<String?>(additionalInformationProgramming.value);
    }
    if (circuitBreakerProperlyEngaged.present) {
      map['circuit_breaker_properly_engaged'] =
          Variable<bool?>(circuitBreakerProperlyEngaged.value);
    }
    if (enterTheAnomalyCircuitBreakerInterlock.present) {
      map['enter_the_anomaly_circuit_breaker_interlock'] =
          Variable<String?>(enterTheAnomalyCircuitBreakerInterlock.value);
    }
    if (additionalInformationCircuitBreakerInterlock.present) {
      map['additional_information_circuit_breaker_interlock'] =
          Variable<String?>(additionalInformationCircuitBreakerInterlock.value);
    }
    if (customerFeedbackComment.present) {
      map['customer_feedback_comment'] =
          Variable<String?>(customerFeedbackComment.value);
    }
    if (customerSignatureImage.present) {
      map['customer_signature_image'] =
          Variable<String?>(customerSignatureImage.value);
    }
    if (isGripCase.present) {
      map['is_grip_case'] = Variable<bool?>(isGripCase.value);
    }
    if (gripCaseReason.present) {
      map['grip_case_reason'] = Variable<String?>(gripCaseReason.value);
    }
    if (noticeOfPassageImage1.present) {
      map['notice_of_passage_image1'] =
          Variable<String?>(noticeOfPassageImage1.value);
    }
    if (noticeOfPassageImage2.present) {
      map['notice_of_passage_image2'] =
          Variable<String?>(noticeOfPassageImage2.value);
    }
    if (displacementPhotoImage1.present) {
      map['displacement_photo_image1'] =
          Variable<String?>(displacementPhotoImage1.value);
    }
    if (displacementPhotoImage2.present) {
      map['displacement_photo_image2'] =
          Variable<String?>(displacementPhotoImage2.value);
    }
    if (gripCaseComment.present) {
      map['grip_case_comment'] = Variable<String?>(gripCaseComment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterventionDetailsTableCompanion(')
      ..write('id: $id, ')
      ..write('startTimeOfIntervention: $startTimeOfIntervention, ')
      ..write('endTimeOfIntervention: $endTimeOfIntervention, ')
      ..write('latitude: $latitude, ')
      ..write('longitude: $longitude, ')
      ..write('localMeterImage: $localMeterImage, ')
      ..write('meterNumberImage: $meterNumberImage, ')
      ..write('countingPanelImage: $countingPanelImage, ')
      ..write('confirmPpePorts: $confirmPpePorts, ')
      ..write('confirmMacronsInstallation: $confirmMacronsInstallation, ')
      ..write('confirmTop: $confirmTop, ')
      ..write('canYouGetStartedToday: $canYouGetStartedToday, ')
      ..write('circuitBreakerBrand: $circuitBreakerBrand, ')
      ..write('month: $month, ')
      ..write('year: $year, ')
      ..write('serialNumberScanImage: $serialNumberScanImage, ')
      ..write('sizeControlImage: $sizeControlImage, ')
      ..write('testOfVat: $testOfVat, ')
      ..write('settingsAnomaly: $settingsAnomaly, ')
      ..write('circuitBreakerMalfuncttion: $circuitBreakerMalfuncttion, ')
      ..write('meterRate: $meterRate, ')
      ..write('fullTimeRate: $fullTimeRate, ')
      ..write('offPeakTime: $offPeakTime, ')
      ..write('photoOfIndexImage: $photoOfIndexImage, ')
      ..write(
          'positionOfPhaseConductorImage: $positionOfPhaseConductorImage, ')
      ..write('isTheDriverWellPositioned: $isTheDriverWellPositioned, ')
      ..write(
          'reasonFOrDriverNotWellPositioned: $reasonFOrDriverNotWellPositioned, ')
      ..write('beforeCcpiLoggingImage1: $beforeCcpiLoggingImage1, ')
      ..write('beforeCcpiLoggingImage2: $beforeCcpiLoggingImage2, ')
      ..write('afterCcpiLoggingImage1: $afterCcpiLoggingImage1, ')
      ..write('afterCcpiLoggingImage2: $afterCcpiLoggingImage2, ')
      ..write(
          'identificationBetweenPhaseAndNeutral: $identificationBetweenPhaseAndNeutral, ')
      ..write('oldMeterImage: $oldMeterImage, ')
      ..write(
          'terminalBlockTightenedPowerImage: $terminalBlockTightenedPowerImage, ')
      ..write(
          'terminalCoverPutBackInPlaceImage: $terminalCoverPutBackInPlaceImage, ')
      ..write('oldMeterDepositedImage: $oldMeterDepositedImage, ')
      ..write(
          'electricalEquipmentDepositedImage: $electricalEquipmentDepositedImage, ')
      ..write('enterAdditionallyMaterial: $enterAdditionallyMaterial, ')
      ..write('presenceOfPnt: $presenceOfPnt, ')
      ..write(
          'inversionBetweenPhaseAndMaterial: $inversionBetweenPhaseAndMaterial, ')
      ..write('resumptionOfEnslavement: $resumptionOfEnslavement, ')
      ..write('ictCabling: $ictCabling, ')
      ..write('photoOfWiringImage: $photoOfWiringImage, ')
      ..write('photosOfNewMeterInstalled: $photosOfNewMeterInstalled, ')
      ..write(
          'hasTheCircuitBreakerBeenReplaced: $hasTheCircuitBreakerBeenReplaced, ')
      ..write(
          'resonForCircuitBreakerNonReplacement: $resonForCircuitBreakerNonReplacement, ')
      ..write('circuitBreakerLead: $circuitBreakerLead, ')
      ..write(
          'reasonForNoncircuitBreakerLead: $reasonForNoncircuitBreakerLead, ')
      ..write('leadCCPI: $leadCCPI, ')
      ..write(
          'indicateReasonForCircuitBreakerSettings: $indicateReasonForCircuitBreakerSettings, ')
      ..write('circuitBreakerGuageImage: $circuitBreakerGuageImage, ')
      ..write(
          'modifiedCircuitBreakerCapacity: $modifiedCircuitBreakerCapacity, ')
      ..write('calibratedPower: $calibratedPower, ')
      ..write(
          'reasonForNonModifiedCircuitBreakerCapacity: $reasonForNonModifiedCircuitBreakerCapacity, ')
      ..write('statusOfInstalledMeter: $statusOfInstalledMeter, ')
      ..write('enterTheAnomalyProgramming: $enterTheAnomalyProgramming, ')
      ..write('serialNumber: $serialNumber, ')
      ..write('meterAnomalyImage: $meterAnomalyImage, ')
      ..write(
          'additionalInformationProgramming: $additionalInformationProgramming, ')
      ..write(
          'circuitBreakerProperlyEngaged: $circuitBreakerProperlyEngaged, ')
      ..write(
          'enterTheAnomalyCircuitBreakerInterlock: $enterTheAnomalyCircuitBreakerInterlock, ')
      ..write(
          'additionalInformationCircuitBreakerInterlock: $additionalInformationCircuitBreakerInterlock, ')
      ..write('customerFeedbackComment: $customerFeedbackComment, ')
      ..write('customerSignatureImage: $customerSignatureImage, ')
      ..write('isGripCase: $isGripCase, ')
      ..write('gripCaseReason: $gripCaseReason, ')
      ..write('noticeOfPassageImage1: $noticeOfPassageImage1, ')
      ..write('noticeOfPassageImage2: $noticeOfPassageImage2, ')
      ..write('displacementPhotoImage1: $displacementPhotoImage1, ')
      ..write('displacementPhotoImage2: $displacementPhotoImage2, ')
      ..write('gripCaseComment: $gripCaseComment')
      ..write(')'))
        .toString();
  }
}

class $InterventionDetailsTableTable extends InterventionDetailsTable
    with
        TableInfo<$InterventionDetailsTableTable,
            InterventionDetailsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterventionDetailsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _startTimeOfInterventionMeta =
  const VerificationMeta('startTimeOfIntervention');
  @override
  late final GeneratedColumn<String?> startTimeOfIntervention =
  GeneratedColumn<String?>('start_time_of_intervention', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _endTimeOfInterventionMeta =
  const VerificationMeta('endTimeOfIntervention');
  @override
  late final GeneratedColumn<String?> endTimeOfIntervention =
  GeneratedColumn<String?>('end_time_of_intervention', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _localMeterImageMeta =
  const VerificationMeta('localMeterImage');
  @override
  late final GeneratedColumn<String?> localMeterImage =
  GeneratedColumn<String?>('local_meter_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _meterNumberImageMeta =
  const VerificationMeta('meterNumberImage');
  @override
  late final GeneratedColumn<String?> meterNumberImage =
  GeneratedColumn<String?>('meter_number_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _countingPanelImageMeta =
  const VerificationMeta('countingPanelImage');
  @override
  late final GeneratedColumn<String?> countingPanelImage =
  GeneratedColumn<String?>('counting_panel_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _confirmPpePortsMeta =
  const VerificationMeta('confirmPpePorts');
  @override
  late final GeneratedColumn<bool?> confirmPpePorts = GeneratedColumn<bool?>(
      'confirm_ppe_ports', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (confirm_ppe_ports IN (0, 1))');
  final VerificationMeta _confirmMacronsInstallationMeta =
  const VerificationMeta('confirmMacronsInstallation');
  @override
  late final GeneratedColumn<bool?> confirmMacronsInstallation =
  GeneratedColumn<bool?>('confirm_macrons_installation', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (confirm_macrons_installation IN (0, 1))');
  final VerificationMeta _confirmTopMeta = const VerificationMeta('confirmTop');
  @override
  late final GeneratedColumn<bool?> confirmTop = GeneratedColumn<bool?>(
      'confirm_top', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (confirm_top IN (0, 1))');
  final VerificationMeta _canYouGetStartedTodayMeta =
  const VerificationMeta('canYouGetStartedToday');
  @override
  late final GeneratedColumn<bool?> canYouGetStartedToday =
  GeneratedColumn<bool?>('can_you_get_started_today', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (can_you_get_started_today IN (0, 1))');
  final VerificationMeta _circuitBreakerBrandMeta =
  const VerificationMeta('circuitBreakerBrand');
  @override
  late final GeneratedColumn<String?> circuitBreakerBrand =
  GeneratedColumn<String?>('circuit_breaker_brand', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<String?> month = GeneratedColumn<String?>(
      'month', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String?> year = GeneratedColumn<String?>(
      'year', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _serialNumberScanImageMeta =
  const VerificationMeta('serialNumberScanImage');
  @override
  late final GeneratedColumn<String?> serialNumberScanImage =
  GeneratedColumn<String?>('serial_number_scan_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _sizeControlImageMeta =
  const VerificationMeta('sizeControlImage');
  @override
  late final GeneratedColumn<String?> sizeControlImage =
  GeneratedColumn<String?>('size_control_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _testOfVatMeta = const VerificationMeta('testOfVat');
  @override
  late final GeneratedColumn<bool?> testOfVat = GeneratedColumn<bool?>(
      'test_of_vat', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (test_of_vat IN (0, 1))');
  final VerificationMeta _settingsAnomalyMeta =
  const VerificationMeta('settingsAnomaly');
  @override
  late final GeneratedColumn<bool?> settingsAnomaly = GeneratedColumn<bool?>(
      'settings_anomaly', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (settings_anomaly IN (0, 1))');
  final VerificationMeta _circuitBreakerMalfuncttionMeta =
  const VerificationMeta('circuitBreakerMalfuncttion');
  @override
  late final GeneratedColumn<bool?> circuitBreakerMalfuncttion =
  GeneratedColumn<bool?>('circuit_breaker_malfuncttion', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (circuit_breaker_malfuncttion IN (0, 1))');
  final VerificationMeta _meterRateMeta = const VerificationMeta('meterRate');
  @override
  late final GeneratedColumn<String?> meterRate = GeneratedColumn<String?>(
      'meter_rate', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _fullTimeRateMeta =
  const VerificationMeta('fullTimeRate');
  @override
  late final GeneratedColumn<String?> fullTimeRate = GeneratedColumn<String?>(
      'full_time_rate', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _offPeakTimeMeta =
  const VerificationMeta('offPeakTime');
  @override
  late final GeneratedColumn<String?> offPeakTime = GeneratedColumn<String?>(
      'off_peak_time', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _photoOfIndexImageMeta =
  const VerificationMeta('photoOfIndexImage');
  @override
  late final GeneratedColumn<String?> photoOfIndexImage =
  GeneratedColumn<String?>('photo_of_index_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _positionOfPhaseConductorImageMeta =
  const VerificationMeta('positionOfPhaseConductorImage');
  @override
  late final GeneratedColumn<String?> positionOfPhaseConductorImage =
  GeneratedColumn<String?>(
      'position_of_phase_conductor_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isTheDriverWellPositionedMeta =
  const VerificationMeta('isTheDriverWellPositioned');
  @override
  late final GeneratedColumn<bool?> isTheDriverWellPositioned =
  GeneratedColumn<bool?>('is_the_driver_well_positioned', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints:
      'CHECK (is_the_driver_well_positioned IN (0, 1))');
  final VerificationMeta _reasonFOrDriverNotWellPositionedMeta =
  const VerificationMeta('reasonFOrDriverNotWellPositioned');
  @override
  late final GeneratedColumn<String?> reasonFOrDriverNotWellPositioned =
  GeneratedColumn<String?>(
      'reason_f_or_driver_not_well_positioned', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _beforeCcpiLoggingImage1Meta =
  const VerificationMeta('beforeCcpiLoggingImage1');
  @override
  late final GeneratedColumn<String?> beforeCcpiLoggingImage1 =
  GeneratedColumn<String?>('before_ccpi_logging_image1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _beforeCcpiLoggingImage2Meta =
  const VerificationMeta('beforeCcpiLoggingImage2');
  @override
  late final GeneratedColumn<String?> beforeCcpiLoggingImage2 =
  GeneratedColumn<String?>('before_ccpi_logging_image2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _afterCcpiLoggingImage1Meta =
  const VerificationMeta('afterCcpiLoggingImage1');
  @override
  late final GeneratedColumn<String?> afterCcpiLoggingImage1 =
  GeneratedColumn<String?>('after_ccpi_logging_image1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _afterCcpiLoggingImage2Meta =
  const VerificationMeta('afterCcpiLoggingImage2');
  @override
  late final GeneratedColumn<String?> afterCcpiLoggingImage2 =
  GeneratedColumn<String?>('after_ccpi_logging_image2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _identificationBetweenPhaseAndNeutralMeta =
  const VerificationMeta('identificationBetweenPhaseAndNeutral');
  @override
  late final GeneratedColumn<bool?> identificationBetweenPhaseAndNeutral =
  GeneratedColumn<bool?>(
      'identification_between_phase_and_neutral', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints:
      'CHECK (identification_between_phase_and_neutral IN (0, 1))');
  final VerificationMeta _oldMeterImageMeta =
  const VerificationMeta('oldMeterImage');
  @override
  late final GeneratedColumn<String?> oldMeterImage = GeneratedColumn<String?>(
      'old_meter_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _terminalBlockTightenedPowerImageMeta =
  const VerificationMeta('terminalBlockTightenedPowerImage');
  @override
  late final GeneratedColumn<String?> terminalBlockTightenedPowerImage =
  GeneratedColumn<String?>(
      'terminal_block_tightened_power_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _terminalCoverPutBackInPlaceImageMeta =
  const VerificationMeta('terminalCoverPutBackInPlaceImage');
  @override
  late final GeneratedColumn<String?> terminalCoverPutBackInPlaceImage =
  GeneratedColumn<String?>(
      'terminal_cover_put_back_in_place_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _oldMeterDepositedImageMeta =
  const VerificationMeta('oldMeterDepositedImage');
  @override
  late final GeneratedColumn<String?> oldMeterDepositedImage =
  GeneratedColumn<String?>('old_meter_deposited_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _electricalEquipmentDepositedImageMeta =
  const VerificationMeta('electricalEquipmentDepositedImage');
  @override
  late final GeneratedColumn<String?> electricalEquipmentDepositedImage =
  GeneratedColumn<String?>(
      'electrical_equipment_deposited_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _enterAdditionallyMaterialMeta =
  const VerificationMeta('enterAdditionallyMaterial');
  @override
  late final GeneratedColumn<String?> enterAdditionallyMaterial =
  GeneratedColumn<String?>('enter_additionally_material', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _presenceOfPntMeta =
  const VerificationMeta('presenceOfPnt');
  @override
  late final GeneratedColumn<bool?> presenceOfPnt = GeneratedColumn<bool?>(
      'presence_of_pnt', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (presence_of_pnt IN (0, 1))');
  final VerificationMeta _inversionBetweenPhaseAndMaterialMeta =
  const VerificationMeta('inversionBetweenPhaseAndMaterial');
  @override
  late final GeneratedColumn<bool?> inversionBetweenPhaseAndMaterial =
  GeneratedColumn<bool?>(
      'inversion_between_phase_and_material', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints:
      'CHECK (inversion_between_phase_and_material IN (0, 1))');
  final VerificationMeta _resumptionOfEnslavementMeta =
  const VerificationMeta('resumptionOfEnslavement');
  @override
  late final GeneratedColumn<bool?> resumptionOfEnslavement =
  GeneratedColumn<bool?>('resumption_of_enslavement', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (resumption_of_enslavement IN (0, 1))');
  final VerificationMeta _ictCablingMeta = const VerificationMeta('ictCabling');
  @override
  late final GeneratedColumn<bool?> ictCabling = GeneratedColumn<bool?>(
      'ict_cabling', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (ict_cabling IN (0, 1))');
  final VerificationMeta _photoOfWiringImageMeta =
  const VerificationMeta('photoOfWiringImage');
  @override
  late final GeneratedColumn<String?> photoOfWiringImage =
  GeneratedColumn<String?>('photo_of_wiring_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _photosOfNewMeterInstalledMeta =
  const VerificationMeta('photosOfNewMeterInstalled');
  @override
  late final GeneratedColumn<String?> photosOfNewMeterInstalled =
  GeneratedColumn<String?>(
      'photos_of_new_meter_installed', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _hasTheCircuitBreakerBeenReplacedMeta =
  const VerificationMeta('hasTheCircuitBreakerBeenReplaced');
  @override
  late final GeneratedColumn<bool?> hasTheCircuitBreakerBeenReplaced =
  GeneratedColumn<bool?>(
      'has_the_circuit_breaker_been_replaced', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints:
      'CHECK (has_the_circuit_breaker_been_replaced IN (0, 1))');
  final VerificationMeta _resonForCircuitBreakerNonReplacementMeta =
  const VerificationMeta('resonForCircuitBreakerNonReplacement');
  @override
  late final GeneratedColumn<String?> resonForCircuitBreakerNonReplacement =
  GeneratedColumn<String?>(
      'reson_for_circuit_breaker_non_replacement', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _circuitBreakerLeadMeta =
  const VerificationMeta('circuitBreakerLead');
  @override
  late final GeneratedColumn<bool?> circuitBreakerLead = GeneratedColumn<bool?>(
      'circuit_breaker_lead', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (circuit_breaker_lead IN (0, 1))');
  final VerificationMeta _reasonForNoncircuitBreakerLeadMeta =
  const VerificationMeta('reasonForNoncircuitBreakerLead');
  @override
  late final GeneratedColumn<String?> reasonForNoncircuitBreakerLead =
  GeneratedColumn<String?>(
      'reason_for_noncircuit_breaker_lead', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _leadCCPIMeta = const VerificationMeta('leadCCPI');
  @override
  late final GeneratedColumn<bool?> leadCCPI = GeneratedColumn<bool?>(
      'lead_c_c_p_i', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (lead_c_c_p_i IN (0, 1))');
  final VerificationMeta _indicateReasonForCircuitBreakerSettingsMeta =
  const VerificationMeta('indicateReasonForCircuitBreakerSettings');
  @override
  late final GeneratedColumn<String?> indicateReasonForCircuitBreakerSettings =
  GeneratedColumn<String?>(
      'indicate_reason_for_circuit_breaker_settings', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _circuitBreakerGuageImageMeta =
  const VerificationMeta('circuitBreakerGuageImage');
  @override
  late final GeneratedColumn<String?> circuitBreakerGuageImage =
  GeneratedColumn<String?>('circuit_breaker_guage_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _modifiedCircuitBreakerCapacityMeta =
  const VerificationMeta('modifiedCircuitBreakerCapacity');
  @override
  late final GeneratedColumn<bool?> modifiedCircuitBreakerCapacity =
  GeneratedColumn<bool?>(
      'modified_circuit_breaker_capacity', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints:
      'CHECK (modified_circuit_breaker_capacity IN (0, 1))');
  final VerificationMeta _calibratedPowerMeta =
  const VerificationMeta('calibratedPower');
  @override
  late final GeneratedColumn<String?> calibratedPower =
  GeneratedColumn<String?>('calibrated_power', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _reasonForNonModifiedCircuitBreakerCapacityMeta =
  const VerificationMeta('reasonForNonModifiedCircuitBreakerCapacity');
  @override
  late final GeneratedColumn<String?>
  reasonForNonModifiedCircuitBreakerCapacity = GeneratedColumn<String?>(
      'reason_for_non_modified_circuit_breaker_capacity', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _statusOfInstalledMeterMeta =
  const VerificationMeta('statusOfInstalledMeter');
  @override
  late final GeneratedColumn<bool?> statusOfInstalledMeter =
  GeneratedColumn<bool?>('status_of_installed_meter', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (status_of_installed_meter IN (0, 1))');
  final VerificationMeta _enterTheAnomalyProgrammingMeta =
  const VerificationMeta('enterTheAnomalyProgramming');
  @override
  late final GeneratedColumn<String?> enterTheAnomalyProgramming =
  GeneratedColumn<String?>(
      'enter_the_anomaly_programming', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _serialNumberMeta =
  const VerificationMeta('serialNumber');
  @override
  late final GeneratedColumn<String?> serialNumber = GeneratedColumn<String?>(
      'serial_number', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _meterAnomalyImageMeta =
  const VerificationMeta('meterAnomalyImage');
  @override
  late final GeneratedColumn<String?> meterAnomalyImage =
  GeneratedColumn<String?>('meter_anomaly_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _additionalInformationProgrammingMeta =
  const VerificationMeta('additionalInformationProgramming');
  @override
  late final GeneratedColumn<String?> additionalInformationProgramming =
  GeneratedColumn<String?>(
      'additional_information_programming', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _circuitBreakerProperlyEngagedMeta =
  const VerificationMeta('circuitBreakerProperlyEngaged');
  @override
  late final GeneratedColumn<bool?> circuitBreakerProperlyEngaged =
  GeneratedColumn<bool?>(
      'circuit_breaker_properly_engaged', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints:
      'CHECK (circuit_breaker_properly_engaged IN (0, 1))');
  final VerificationMeta _enterTheAnomalyCircuitBreakerInterlockMeta =
  const VerificationMeta('enterTheAnomalyCircuitBreakerInterlock');
  @override
  late final GeneratedColumn<String?> enterTheAnomalyCircuitBreakerInterlock =
  GeneratedColumn<String?>(
      'enter_the_anomaly_circuit_breaker_interlock', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _additionalInformationCircuitBreakerInterlockMeta =
  const VerificationMeta('additionalInformationCircuitBreakerInterlock');
  @override
  late final GeneratedColumn<String?>
  additionalInformationCircuitBreakerInterlock = GeneratedColumn<String?>(
      'additional_information_circuit_breaker_interlock', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _customerFeedbackCommentMeta =
  const VerificationMeta('customerFeedbackComment');
  @override
  late final GeneratedColumn<String?> customerFeedbackComment =
  GeneratedColumn<String?>('customer_feedback_comment', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _customerSignatureImageMeta =
  const VerificationMeta('customerSignatureImage');
  @override
  late final GeneratedColumn<String?> customerSignatureImage =
  GeneratedColumn<String?>('customer_signature_image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isGripCaseMeta = const VerificationMeta('isGripCase');
  @override
  late final GeneratedColumn<bool?> isGripCase = GeneratedColumn<bool?>(
      'is_grip_case', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_grip_case IN (0, 1))');
  final VerificationMeta _gripCaseReasonMeta =
  const VerificationMeta('gripCaseReason');
  @override
  late final GeneratedColumn<String?> gripCaseReason = GeneratedColumn<String?>(
      'grip_case_reason', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _noticeOfPassageImage1Meta =
  const VerificationMeta('noticeOfPassageImage1');
  @override
  late final GeneratedColumn<String?> noticeOfPassageImage1 =
  GeneratedColumn<String?>('notice_of_passage_image1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _noticeOfPassageImage2Meta =
  const VerificationMeta('noticeOfPassageImage2');
  @override
  late final GeneratedColumn<String?> noticeOfPassageImage2 =
  GeneratedColumn<String?>('notice_of_passage_image2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _displacementPhotoImage1Meta =
  const VerificationMeta('displacementPhotoImage1');
  @override
  late final GeneratedColumn<String?> displacementPhotoImage1 =
  GeneratedColumn<String?>('displacement_photo_image1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _displacementPhotoImage2Meta =
  const VerificationMeta('displacementPhotoImage2');
  @override
  late final GeneratedColumn<String?> displacementPhotoImage2 =
  GeneratedColumn<String?>('displacement_photo_image2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _gripCaseCommentMeta =
  const VerificationMeta('gripCaseComment');
  @override
  late final GeneratedColumn<String?> gripCaseComment =
  GeneratedColumn<String?>('grip_case_comment', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startTimeOfIntervention,
    endTimeOfIntervention,
    latitude,
    longitude,
    localMeterImage,
    meterNumberImage,
    countingPanelImage,
    confirmPpePorts,
    confirmMacronsInstallation,
    confirmTop,
    canYouGetStartedToday,
    circuitBreakerBrand,
    month,
    year,
    serialNumberScanImage,
    sizeControlImage,
    testOfVat,
    settingsAnomaly,
    circuitBreakerMalfuncttion,
    meterRate,
    fullTimeRate,
    offPeakTime,
    photoOfIndexImage,
    positionOfPhaseConductorImage,
    isTheDriverWellPositioned,
    reasonFOrDriverNotWellPositioned,
    beforeCcpiLoggingImage1,
    beforeCcpiLoggingImage2,
    afterCcpiLoggingImage1,
    afterCcpiLoggingImage2,
    identificationBetweenPhaseAndNeutral,
    oldMeterImage,
    terminalBlockTightenedPowerImage,
    terminalCoverPutBackInPlaceImage,
    oldMeterDepositedImage,
    electricalEquipmentDepositedImage,
    enterAdditionallyMaterial,
    presenceOfPnt,
    inversionBetweenPhaseAndMaterial,
    resumptionOfEnslavement,
    ictCabling,
    photoOfWiringImage,
    photosOfNewMeterInstalled,
    hasTheCircuitBreakerBeenReplaced,
    resonForCircuitBreakerNonReplacement,
    circuitBreakerLead,
    reasonForNoncircuitBreakerLead,
    leadCCPI,
    indicateReasonForCircuitBreakerSettings,
    circuitBreakerGuageImage,
    modifiedCircuitBreakerCapacity,
    calibratedPower,
    reasonForNonModifiedCircuitBreakerCapacity,
    statusOfInstalledMeter,
    enterTheAnomalyProgramming,
    serialNumber,
    meterAnomalyImage,
    additionalInformationProgramming,
    circuitBreakerProperlyEngaged,
    enterTheAnomalyCircuitBreakerInterlock,
    additionalInformationCircuitBreakerInterlock,
    customerFeedbackComment,
    customerSignatureImage,
    isGripCase,
    gripCaseReason,
    noticeOfPassageImage1,
    noticeOfPassageImage2,
    displacementPhotoImage1,
    displacementPhotoImage2,
    gripCaseComment
  ];
  @override
  String get aliasedName => _alias ?? 'intervention_details_table';
  @override
  String get actualTableName => 'intervention_details_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<InterventionDetailsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time_of_intervention')) {
      context.handle(
          _startTimeOfInterventionMeta,
          startTimeOfIntervention.isAcceptableOrUnknown(
              data['start_time_of_intervention']!,
              _startTimeOfInterventionMeta));
    }
    if (data.containsKey('end_time_of_intervention')) {
      context.handle(
          _endTimeOfInterventionMeta,
          endTimeOfIntervention.isAcceptableOrUnknown(
              data['end_time_of_intervention']!, _endTimeOfInterventionMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('local_meter_image')) {
      context.handle(
          _localMeterImageMeta,
          localMeterImage.isAcceptableOrUnknown(
              data['local_meter_image']!, _localMeterImageMeta));
    }
    if (data.containsKey('meter_number_image')) {
      context.handle(
          _meterNumberImageMeta,
          meterNumberImage.isAcceptableOrUnknown(
              data['meter_number_image']!, _meterNumberImageMeta));
    }
    if (data.containsKey('counting_panel_image')) {
      context.handle(
          _countingPanelImageMeta,
          countingPanelImage.isAcceptableOrUnknown(
              data['counting_panel_image']!, _countingPanelImageMeta));
    }
    if (data.containsKey('confirm_ppe_ports')) {
      context.handle(
          _confirmPpePortsMeta,
          confirmPpePorts.isAcceptableOrUnknown(
              data['confirm_ppe_ports']!, _confirmPpePortsMeta));
    }
    if (data.containsKey('confirm_macrons_installation')) {
      context.handle(
          _confirmMacronsInstallationMeta,
          confirmMacronsInstallation.isAcceptableOrUnknown(
              data['confirm_macrons_installation']!,
              _confirmMacronsInstallationMeta));
    }
    if (data.containsKey('confirm_top')) {
      context.handle(
          _confirmTopMeta,
          confirmTop.isAcceptableOrUnknown(
              data['confirm_top']!, _confirmTopMeta));
    }
    if (data.containsKey('can_you_get_started_today')) {
      context.handle(
          _canYouGetStartedTodayMeta,
          canYouGetStartedToday.isAcceptableOrUnknown(
              data['can_you_get_started_today']!, _canYouGetStartedTodayMeta));
    }
    if (data.containsKey('circuit_breaker_brand')) {
      context.handle(
          _circuitBreakerBrandMeta,
          circuitBreakerBrand.isAcceptableOrUnknown(
              data['circuit_breaker_brand']!, _circuitBreakerBrandMeta));
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    }
    if (data.containsKey('serial_number_scan_image')) {
      context.handle(
          _serialNumberScanImageMeta,
          serialNumberScanImage.isAcceptableOrUnknown(
              data['serial_number_scan_image']!, _serialNumberScanImageMeta));
    }
    if (data.containsKey('size_control_image')) {
      context.handle(
          _sizeControlImageMeta,
          sizeControlImage.isAcceptableOrUnknown(
              data['size_control_image']!, _sizeControlImageMeta));
    }
    if (data.containsKey('test_of_vat')) {
      context.handle(
          _testOfVatMeta,
          testOfVat.isAcceptableOrUnknown(
              data['test_of_vat']!, _testOfVatMeta));
    }
    if (data.containsKey('settings_anomaly')) {
      context.handle(
          _settingsAnomalyMeta,
          settingsAnomaly.isAcceptableOrUnknown(
              data['settings_anomaly']!, _settingsAnomalyMeta));
    }
    if (data.containsKey('circuit_breaker_malfuncttion')) {
      context.handle(
          _circuitBreakerMalfuncttionMeta,
          circuitBreakerMalfuncttion.isAcceptableOrUnknown(
              data['circuit_breaker_malfuncttion']!,
              _circuitBreakerMalfuncttionMeta));
    }
    if (data.containsKey('meter_rate')) {
      context.handle(_meterRateMeta,
          meterRate.isAcceptableOrUnknown(data['meter_rate']!, _meterRateMeta));
    }
    if (data.containsKey('full_time_rate')) {
      context.handle(
          _fullTimeRateMeta,
          fullTimeRate.isAcceptableOrUnknown(
              data['full_time_rate']!, _fullTimeRateMeta));
    }
    if (data.containsKey('off_peak_time')) {
      context.handle(
          _offPeakTimeMeta,
          offPeakTime.isAcceptableOrUnknown(
              data['off_peak_time']!, _offPeakTimeMeta));
    }
    if (data.containsKey('photo_of_index_image')) {
      context.handle(
          _photoOfIndexImageMeta,
          photoOfIndexImage.isAcceptableOrUnknown(
              data['photo_of_index_image']!, _photoOfIndexImageMeta));
    }
    if (data.containsKey('position_of_phase_conductor_image')) {
      context.handle(
          _positionOfPhaseConductorImageMeta,
          positionOfPhaseConductorImage.isAcceptableOrUnknown(
              data['position_of_phase_conductor_image']!,
              _positionOfPhaseConductorImageMeta));
    }
    if (data.containsKey('is_the_driver_well_positioned')) {
      context.handle(
          _isTheDriverWellPositionedMeta,
          isTheDriverWellPositioned.isAcceptableOrUnknown(
              data['is_the_driver_well_positioned']!,
              _isTheDriverWellPositionedMeta));
    }
    if (data.containsKey('reason_f_or_driver_not_well_positioned')) {
      context.handle(
          _reasonFOrDriverNotWellPositionedMeta,
          reasonFOrDriverNotWellPositioned.isAcceptableOrUnknown(
              data['reason_f_or_driver_not_well_positioned']!,
              _reasonFOrDriverNotWellPositionedMeta));
    }
    if (data.containsKey('before_ccpi_logging_image1')) {
      context.handle(
          _beforeCcpiLoggingImage1Meta,
          beforeCcpiLoggingImage1.isAcceptableOrUnknown(
              data['before_ccpi_logging_image1']!,
              _beforeCcpiLoggingImage1Meta));
    }
    if (data.containsKey('before_ccpi_logging_image2')) {
      context.handle(
          _beforeCcpiLoggingImage2Meta,
          beforeCcpiLoggingImage2.isAcceptableOrUnknown(
              data['before_ccpi_logging_image2']!,
              _beforeCcpiLoggingImage2Meta));
    }
    if (data.containsKey('after_ccpi_logging_image1')) {
      context.handle(
          _afterCcpiLoggingImage1Meta,
          afterCcpiLoggingImage1.isAcceptableOrUnknown(
              data['after_ccpi_logging_image1']!, _afterCcpiLoggingImage1Meta));
    }
    if (data.containsKey('after_ccpi_logging_image2')) {
      context.handle(
          _afterCcpiLoggingImage2Meta,
          afterCcpiLoggingImage2.isAcceptableOrUnknown(
              data['after_ccpi_logging_image2']!, _afterCcpiLoggingImage2Meta));
    }
    if (data.containsKey('identification_between_phase_and_neutral')) {
      context.handle(
          _identificationBetweenPhaseAndNeutralMeta,
          identificationBetweenPhaseAndNeutral.isAcceptableOrUnknown(
              data['identification_between_phase_and_neutral']!,
              _identificationBetweenPhaseAndNeutralMeta));
    }
    if (data.containsKey('old_meter_image')) {
      context.handle(
          _oldMeterImageMeta,
          oldMeterImage.isAcceptableOrUnknown(
              data['old_meter_image']!, _oldMeterImageMeta));
    }
    if (data.containsKey('terminal_block_tightened_power_image')) {
      context.handle(
          _terminalBlockTightenedPowerImageMeta,
          terminalBlockTightenedPowerImage.isAcceptableOrUnknown(
              data['terminal_block_tightened_power_image']!,
              _terminalBlockTightenedPowerImageMeta));
    }
    if (data.containsKey('terminal_cover_put_back_in_place_image')) {
      context.handle(
          _terminalCoverPutBackInPlaceImageMeta,
          terminalCoverPutBackInPlaceImage.isAcceptableOrUnknown(
              data['terminal_cover_put_back_in_place_image']!,
              _terminalCoverPutBackInPlaceImageMeta));
    }
    if (data.containsKey('old_meter_deposited_image')) {
      context.handle(
          _oldMeterDepositedImageMeta,
          oldMeterDepositedImage.isAcceptableOrUnknown(
              data['old_meter_deposited_image']!, _oldMeterDepositedImageMeta));
    }
    if (data.containsKey('electrical_equipment_deposited_image')) {
      context.handle(
          _electricalEquipmentDepositedImageMeta,
          electricalEquipmentDepositedImage.isAcceptableOrUnknown(
              data['electrical_equipment_deposited_image']!,
              _electricalEquipmentDepositedImageMeta));
    }
    if (data.containsKey('enter_additionally_material')) {
      context.handle(
          _enterAdditionallyMaterialMeta,
          enterAdditionallyMaterial.isAcceptableOrUnknown(
              data['enter_additionally_material']!,
              _enterAdditionallyMaterialMeta));
    }
    if (data.containsKey('presence_of_pnt')) {
      context.handle(
          _presenceOfPntMeta,
          presenceOfPnt.isAcceptableOrUnknown(
              data['presence_of_pnt']!, _presenceOfPntMeta));
    }
    if (data.containsKey('inversion_between_phase_and_material')) {
      context.handle(
          _inversionBetweenPhaseAndMaterialMeta,
          inversionBetweenPhaseAndMaterial.isAcceptableOrUnknown(
              data['inversion_between_phase_and_material']!,
              _inversionBetweenPhaseAndMaterialMeta));
    }
    if (data.containsKey('resumption_of_enslavement')) {
      context.handle(
          _resumptionOfEnslavementMeta,
          resumptionOfEnslavement.isAcceptableOrUnknown(
              data['resumption_of_enslavement']!,
              _resumptionOfEnslavementMeta));
    }
    if (data.containsKey('ict_cabling')) {
      context.handle(
          _ictCablingMeta,
          ictCabling.isAcceptableOrUnknown(
              data['ict_cabling']!, _ictCablingMeta));
    }
    if (data.containsKey('photo_of_wiring_image')) {
      context.handle(
          _photoOfWiringImageMeta,
          photoOfWiringImage.isAcceptableOrUnknown(
              data['photo_of_wiring_image']!, _photoOfWiringImageMeta));
    }
    if (data.containsKey('photos_of_new_meter_installed')) {
      context.handle(
          _photosOfNewMeterInstalledMeta,
          photosOfNewMeterInstalled.isAcceptableOrUnknown(
              data['photos_of_new_meter_installed']!,
              _photosOfNewMeterInstalledMeta));
    }
    if (data.containsKey('has_the_circuit_breaker_been_replaced')) {
      context.handle(
          _hasTheCircuitBreakerBeenReplacedMeta,
          hasTheCircuitBreakerBeenReplaced.isAcceptableOrUnknown(
              data['has_the_circuit_breaker_been_replaced']!,
              _hasTheCircuitBreakerBeenReplacedMeta));
    }
    if (data.containsKey('reson_for_circuit_breaker_non_replacement')) {
      context.handle(
          _resonForCircuitBreakerNonReplacementMeta,
          resonForCircuitBreakerNonReplacement.isAcceptableOrUnknown(
              data['reson_for_circuit_breaker_non_replacement']!,
              _resonForCircuitBreakerNonReplacementMeta));
    }
    if (data.containsKey('circuit_breaker_lead')) {
      context.handle(
          _circuitBreakerLeadMeta,
          circuitBreakerLead.isAcceptableOrUnknown(
              data['circuit_breaker_lead']!, _circuitBreakerLeadMeta));
    }
    if (data.containsKey('reason_for_noncircuit_breaker_lead')) {
      context.handle(
          _reasonForNoncircuitBreakerLeadMeta,
          reasonForNoncircuitBreakerLead.isAcceptableOrUnknown(
              data['reason_for_noncircuit_breaker_lead']!,
              _reasonForNoncircuitBreakerLeadMeta));
    }
    if (data.containsKey('lead_c_c_p_i')) {
      context.handle(_leadCCPIMeta,
          leadCCPI.isAcceptableOrUnknown(data['lead_c_c_p_i']!, _leadCCPIMeta));
    }
    if (data.containsKey('indicate_reason_for_circuit_breaker_settings')) {
      context.handle(
          _indicateReasonForCircuitBreakerSettingsMeta,
          indicateReasonForCircuitBreakerSettings.isAcceptableOrUnknown(
              data['indicate_reason_for_circuit_breaker_settings']!,
              _indicateReasonForCircuitBreakerSettingsMeta));
    }
    if (data.containsKey('circuit_breaker_guage_image')) {
      context.handle(
          _circuitBreakerGuageImageMeta,
          circuitBreakerGuageImage.isAcceptableOrUnknown(
              data['circuit_breaker_guage_image']!,
              _circuitBreakerGuageImageMeta));
    }
    if (data.containsKey('modified_circuit_breaker_capacity')) {
      context.handle(
          _modifiedCircuitBreakerCapacityMeta,
          modifiedCircuitBreakerCapacity.isAcceptableOrUnknown(
              data['modified_circuit_breaker_capacity']!,
              _modifiedCircuitBreakerCapacityMeta));
    }
    if (data.containsKey('calibrated_power')) {
      context.handle(
          _calibratedPowerMeta,
          calibratedPower.isAcceptableOrUnknown(
              data['calibrated_power']!, _calibratedPowerMeta));
    }
    if (data.containsKey('reason_for_non_modified_circuit_breaker_capacity')) {
      context.handle(
          _reasonForNonModifiedCircuitBreakerCapacityMeta,
          reasonForNonModifiedCircuitBreakerCapacity.isAcceptableOrUnknown(
              data['reason_for_non_modified_circuit_breaker_capacity']!,
              _reasonForNonModifiedCircuitBreakerCapacityMeta));
    }
    if (data.containsKey('status_of_installed_meter')) {
      context.handle(
          _statusOfInstalledMeterMeta,
          statusOfInstalledMeter.isAcceptableOrUnknown(
              data['status_of_installed_meter']!, _statusOfInstalledMeterMeta));
    }
    if (data.containsKey('enter_the_anomaly_programming')) {
      context.handle(
          _enterTheAnomalyProgrammingMeta,
          enterTheAnomalyProgramming.isAcceptableOrUnknown(
              data['enter_the_anomaly_programming']!,
              _enterTheAnomalyProgrammingMeta));
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _serialNumberMeta));
    }
    if (data.containsKey('meter_anomaly_image')) {
      context.handle(
          _meterAnomalyImageMeta,
          meterAnomalyImage.isAcceptableOrUnknown(
              data['meter_anomaly_image']!, _meterAnomalyImageMeta));
    }
    if (data.containsKey('additional_information_programming')) {
      context.handle(
          _additionalInformationProgrammingMeta,
          additionalInformationProgramming.isAcceptableOrUnknown(
              data['additional_information_programming']!,
              _additionalInformationProgrammingMeta));
    }
    if (data.containsKey('circuit_breaker_properly_engaged')) {
      context.handle(
          _circuitBreakerProperlyEngagedMeta,
          circuitBreakerProperlyEngaged.isAcceptableOrUnknown(
              data['circuit_breaker_properly_engaged']!,
              _circuitBreakerProperlyEngagedMeta));
    }
    if (data.containsKey('enter_the_anomaly_circuit_breaker_interlock')) {
      context.handle(
          _enterTheAnomalyCircuitBreakerInterlockMeta,
          enterTheAnomalyCircuitBreakerInterlock.isAcceptableOrUnknown(
              data['enter_the_anomaly_circuit_breaker_interlock']!,
              _enterTheAnomalyCircuitBreakerInterlockMeta));
    }
    if (data.containsKey('additional_information_circuit_breaker_interlock')) {
      context.handle(
          _additionalInformationCircuitBreakerInterlockMeta,
          additionalInformationCircuitBreakerInterlock.isAcceptableOrUnknown(
              data['additional_information_circuit_breaker_interlock']!,
              _additionalInformationCircuitBreakerInterlockMeta));
    }
    if (data.containsKey('customer_feedback_comment')) {
      context.handle(
          _customerFeedbackCommentMeta,
          customerFeedbackComment.isAcceptableOrUnknown(
              data['customer_feedback_comment']!,
              _customerFeedbackCommentMeta));
    }
    if (data.containsKey('customer_signature_image')) {
      context.handle(
          _customerSignatureImageMeta,
          customerSignatureImage.isAcceptableOrUnknown(
              data['customer_signature_image']!, _customerSignatureImageMeta));
    }
    if (data.containsKey('is_grip_case')) {
      context.handle(
          _isGripCaseMeta,
          isGripCase.isAcceptableOrUnknown(
              data['is_grip_case']!, _isGripCaseMeta));
    }
    if (data.containsKey('grip_case_reason')) {
      context.handle(
          _gripCaseReasonMeta,
          gripCaseReason.isAcceptableOrUnknown(
              data['grip_case_reason']!, _gripCaseReasonMeta));
    }
    if (data.containsKey('notice_of_passage_image1')) {
      context.handle(
          _noticeOfPassageImage1Meta,
          noticeOfPassageImage1.isAcceptableOrUnknown(
              data['notice_of_passage_image1']!, _noticeOfPassageImage1Meta));
    }
    if (data.containsKey('notice_of_passage_image2')) {
      context.handle(
          _noticeOfPassageImage2Meta,
          noticeOfPassageImage2.isAcceptableOrUnknown(
              data['notice_of_passage_image2']!, _noticeOfPassageImage2Meta));
    }
    if (data.containsKey('displacement_photo_image1')) {
      context.handle(
          _displacementPhotoImage1Meta,
          displacementPhotoImage1.isAcceptableOrUnknown(
              data['displacement_photo_image1']!,
              _displacementPhotoImage1Meta));
    }
    if (data.containsKey('displacement_photo_image2')) {
      context.handle(
          _displacementPhotoImage2Meta,
          displacementPhotoImage2.isAcceptableOrUnknown(
              data['displacement_photo_image2']!,
              _displacementPhotoImage2Meta));
    }
    if (data.containsKey('grip_case_comment')) {
      context.handle(
          _gripCaseCommentMeta,
          gripCaseComment.isAcceptableOrUnknown(
              data['grip_case_comment']!, _gripCaseCommentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InterventionDetailsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return InterventionDetailsTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $InterventionDetailsTableTable createAlias(String alias) {
    return $InterventionDetailsTableTable(attachedDatabase, alias);
  }
}

class RCInterventionDetailsTableData extends DataClass
    implements Insertable<RCInterventionDetailsTableData> {
  final int id;
  final String? startTimeOfIntervention;
  final String? endTimeOfIntervention;
  final double? latitude;
  final double? longitude;
  final bool? confirmMeterReprogramming;
  final String? meterReprogrammingImage1;
  final String? meterReprogrammingImage2;
  final String? additionalInfoOfMeterReprogramming;
  final bool? confirmEnslavementTest;
  final String? meterEnslavementTestImage1;
  final String? meterEnslavementTestImage2;
  final String? additionalInfoOfEnslavementTest;
  final String? specifyYourAction;
  final String? photosOfAction;
  final String? additionalInfoOfActions;
  final String? photoOfWiring;
  final String? photoOfNewPoseMeter;
  final bool? isGripCase;
  final String? gripCaseReason;
  final String? noticeOfPassageImage1;
  final String? noticeOfPassageImage2;
  final String? displacementPhotoImage1;
  final String? displacementPhotoImage2;
  final String? gripCaseComment;
  RCInterventionDetailsTableData(
      {required this.id,
        this.startTimeOfIntervention,
        this.endTimeOfIntervention,
        this.latitude,
        this.longitude,
        this.confirmMeterReprogramming,
        this.meterReprogrammingImage1,
        this.meterReprogrammingImage2,
        this.additionalInfoOfMeterReprogramming,
        this.confirmEnslavementTest,
        this.meterEnslavementTestImage1,
        this.meterEnslavementTestImage2,
        this.additionalInfoOfEnslavementTest,
        this.specifyYourAction,
        this.photosOfAction,
        this.additionalInfoOfActions,
        this.photoOfWiring,
        this.photoOfNewPoseMeter,
        this.isGripCase,
        this.gripCaseReason,
        this.noticeOfPassageImage1,
        this.noticeOfPassageImage2,
        this.displacementPhotoImage1,
        this.displacementPhotoImage2,
        this.gripCaseComment});
  factory RCInterventionDetailsTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RCInterventionDetailsTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      startTimeOfIntervention: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}start_time_of_intervention']),
      endTimeOfIntervention: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}end_time_of_intervention']),
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      confirmMeterReprogramming: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}confirm_meter_reprogramming']),
      meterReprogrammingImage1: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}meter_reprogramming_image1']),
      meterReprogrammingImage2: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}meter_reprogramming_image2']),
      additionalInfoOfMeterReprogramming: const StringType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}additional_info_of_meter_reprogramming']),
      confirmEnslavementTest: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}confirm_enslavement_test']),
      meterEnslavementTestImage1: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}meter_enslavement_test_image1']),
      meterEnslavementTestImage2: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}meter_enslavement_test_image2']),
      additionalInfoOfEnslavementTest: const StringType()
          .mapFromDatabaseResponse(
          data['${effectivePrefix}additional_info_of_enslavement_test']),
      specifyYourAction: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}specify_your_action']),
      photosOfAction: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}photos_of_action']),
      additionalInfoOfActions: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}additional_info_of_actions']),
      photoOfWiring: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}photo_of_wiring']),
      photoOfNewPoseMeter: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}photo_of_new_pose_meter']),
      isGripCase: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_grip_case']),
      gripCaseReason: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}grip_case_reason']),
      noticeOfPassageImage1: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}notice_of_passage_image1']),
      noticeOfPassageImage2: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}notice_of_passage_image2']),
      displacementPhotoImage1: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}displacement_photo_image1']),
      displacementPhotoImage2: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}displacement_photo_image2']),
      gripCaseComment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}grip_case_comment']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || startTimeOfIntervention != null) {
      map['start_time_of_intervention'] =
          Variable<String?>(startTimeOfIntervention);
    }
    if (!nullToAbsent || endTimeOfIntervention != null) {
      map['end_time_of_intervention'] =
          Variable<String?>(endTimeOfIntervention);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double?>(longitude);
    }
    if (!nullToAbsent || confirmMeterReprogramming != null) {
      map['confirm_meter_reprogramming'] =
          Variable<bool?>(confirmMeterReprogramming);
    }
    if (!nullToAbsent || meterReprogrammingImage1 != null) {
      map['meter_reprogramming_image1'] =
          Variable<String?>(meterReprogrammingImage1);
    }
    if (!nullToAbsent || meterReprogrammingImage2 != null) {
      map['meter_reprogramming_image2'] =
          Variable<String?>(meterReprogrammingImage2);
    }
    if (!nullToAbsent || additionalInfoOfMeterReprogramming != null) {
      map['additional_info_of_meter_reprogramming'] =
          Variable<String?>(additionalInfoOfMeterReprogramming);
    }
    if (!nullToAbsent || confirmEnslavementTest != null) {
      map['confirm_enslavement_test'] = Variable<bool?>(confirmEnslavementTest);
    }
    if (!nullToAbsent || meterEnslavementTestImage1 != null) {
      map['meter_enslavement_test_image1'] =
          Variable<String?>(meterEnslavementTestImage1);
    }
    if (!nullToAbsent || meterEnslavementTestImage2 != null) {
      map['meter_enslavement_test_image2'] =
          Variable<String?>(meterEnslavementTestImage2);
    }
    if (!nullToAbsent || additionalInfoOfEnslavementTest != null) {
      map['additional_info_of_enslavement_test'] =
          Variable<String?>(additionalInfoOfEnslavementTest);
    }
    if (!nullToAbsent || specifyYourAction != null) {
      map['specify_your_action'] = Variable<String?>(specifyYourAction);
    }
    if (!nullToAbsent || photosOfAction != null) {
      map['photos_of_action'] = Variable<String?>(photosOfAction);
    }
    if (!nullToAbsent || additionalInfoOfActions != null) {
      map['additional_info_of_actions'] =
          Variable<String?>(additionalInfoOfActions);
    }
    if (!nullToAbsent || photoOfWiring != null) {
      map['photo_of_wiring'] = Variable<String?>(photoOfWiring);
    }
    if (!nullToAbsent || photoOfNewPoseMeter != null) {
      map['photo_of_new_pose_meter'] = Variable<String?>(photoOfNewPoseMeter);
    }
    if (!nullToAbsent || isGripCase != null) {
      map['is_grip_case'] = Variable<bool?>(isGripCase);
    }
    if (!nullToAbsent || gripCaseReason != null) {
      map['grip_case_reason'] = Variable<String?>(gripCaseReason);
    }
    if (!nullToAbsent || noticeOfPassageImage1 != null) {
      map['notice_of_passage_image1'] =
          Variable<String?>(noticeOfPassageImage1);
    }
    if (!nullToAbsent || noticeOfPassageImage2 != null) {
      map['notice_of_passage_image2'] =
          Variable<String?>(noticeOfPassageImage2);
    }
    if (!nullToAbsent || displacementPhotoImage1 != null) {
      map['displacement_photo_image1'] =
          Variable<String?>(displacementPhotoImage1);
    }
    if (!nullToAbsent || displacementPhotoImage2 != null) {
      map['displacement_photo_image2'] =
          Variable<String?>(displacementPhotoImage2);
    }
    if (!nullToAbsent || gripCaseComment != null) {
      map['grip_case_comment'] = Variable<String?>(gripCaseComment);
    }
    return map;
  }

  RCInterventionDetailsTableCompanion toCompanion(bool nullToAbsent) {
    return RCInterventionDetailsTableCompanion(
      id: Value(id),
      startTimeOfIntervention: startTimeOfIntervention == null && nullToAbsent
          ? const Value.absent()
          : Value(startTimeOfIntervention),
      endTimeOfIntervention: endTimeOfIntervention == null && nullToAbsent
          ? const Value.absent()
          : Value(endTimeOfIntervention),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      confirmMeterReprogramming:
      confirmMeterReprogramming == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmMeterReprogramming),
      meterReprogrammingImage1: meterReprogrammingImage1 == null && nullToAbsent
          ? const Value.absent()
          : Value(meterReprogrammingImage1),
      meterReprogrammingImage2: meterReprogrammingImage2 == null && nullToAbsent
          ? const Value.absent()
          : Value(meterReprogrammingImage2),
      additionalInfoOfMeterReprogramming:
      additionalInfoOfMeterReprogramming == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalInfoOfMeterReprogramming),
      confirmEnslavementTest: confirmEnslavementTest == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmEnslavementTest),
      meterEnslavementTestImage1:
      meterEnslavementTestImage1 == null && nullToAbsent
          ? const Value.absent()
          : Value(meterEnslavementTestImage1),
      meterEnslavementTestImage2:
      meterEnslavementTestImage2 == null && nullToAbsent
          ? const Value.absent()
          : Value(meterEnslavementTestImage2),
      additionalInfoOfEnslavementTest:
      additionalInfoOfEnslavementTest == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalInfoOfEnslavementTest),
      specifyYourAction: specifyYourAction == null && nullToAbsent
          ? const Value.absent()
          : Value(specifyYourAction),
      photosOfAction: photosOfAction == null && nullToAbsent
          ? const Value.absent()
          : Value(photosOfAction),
      additionalInfoOfActions: additionalInfoOfActions == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalInfoOfActions),
      photoOfWiring: photoOfWiring == null && nullToAbsent
          ? const Value.absent()
          : Value(photoOfWiring),
      photoOfNewPoseMeter: photoOfNewPoseMeter == null && nullToAbsent
          ? const Value.absent()
          : Value(photoOfNewPoseMeter),
      isGripCase: isGripCase == null && nullToAbsent
          ? const Value.absent()
          : Value(isGripCase),
      gripCaseReason: gripCaseReason == null && nullToAbsent
          ? const Value.absent()
          : Value(gripCaseReason),
      noticeOfPassageImage1: noticeOfPassageImage1 == null && nullToAbsent
          ? const Value.absent()
          : Value(noticeOfPassageImage1),
      noticeOfPassageImage2: noticeOfPassageImage2 == null && nullToAbsent
          ? const Value.absent()
          : Value(noticeOfPassageImage2),
      displacementPhotoImage1: displacementPhotoImage1 == null && nullToAbsent
          ? const Value.absent()
          : Value(displacementPhotoImage1),
      displacementPhotoImage2: displacementPhotoImage2 == null && nullToAbsent
          ? const Value.absent()
          : Value(displacementPhotoImage2),
      gripCaseComment: gripCaseComment == null && nullToAbsent
          ? const Value.absent()
          : Value(gripCaseComment),
    );
  }

  factory RCInterventionDetailsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RCInterventionDetailsTableData(
      id: serializer.fromJson<int>(json['id']),
      startTimeOfIntervention:
      serializer.fromJson<String?>(json['startTimeOfIntervention']),
      endTimeOfIntervention:
      serializer.fromJson<String?>(json['endTimeOfIntervention']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      confirmMeterReprogramming:
      serializer.fromJson<bool?>(json['confirmMeterReprogramming']),
      meterReprogrammingImage1:
      serializer.fromJson<String?>(json['meterReprogrammingImage1']),
      meterReprogrammingImage2:
      serializer.fromJson<String?>(json['meterReprogrammingImage2']),
      additionalInfoOfMeterReprogramming: serializer
          .fromJson<String?>(json['additionalInfoOfMeterReprogramming']),
      confirmEnslavementTest:
      serializer.fromJson<bool?>(json['confirmEnslavementTest']),
      meterEnslavementTestImage1:
      serializer.fromJson<String?>(json['meterEnslavementTestImage1']),
      meterEnslavementTestImage2:
      serializer.fromJson<String?>(json['meterEnslavementTestImage2']),
      additionalInfoOfEnslavementTest:
      serializer.fromJson<String?>(json['additionalInfoOfEnslavementTest']),
      specifyYourAction:
      serializer.fromJson<String?>(json['specifyYourAction']),
      photosOfAction: serializer.fromJson<String?>(json['photosOfAction']),
      additionalInfoOfActions:
      serializer.fromJson<String?>(json['additionalInfoOfActions']),
      photoOfWiring: serializer.fromJson<String?>(json['photoOfWiring']),
      photoOfNewPoseMeter:
      serializer.fromJson<String?>(json['photoOfNewPoseMeter']),
      isGripCase: serializer.fromJson<bool?>(json['isGripCase']),
      gripCaseReason: serializer.fromJson<String?>(json['gripCaseReason']),
      noticeOfPassageImage1:
      serializer.fromJson<String?>(json['noticeOfPassageImage1']),
      noticeOfPassageImage2:
      serializer.fromJson<String?>(json['noticeOfPassageImage2']),
      displacementPhotoImage1:
      serializer.fromJson<String?>(json['displacementPhotoImage1']),
      displacementPhotoImage2:
      serializer.fromJson<String?>(json['displacementPhotoImage2']),
      gripCaseComment: serializer.fromJson<String?>(json['gripCaseComment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startTimeOfIntervention':
      serializer.toJson<String?>(startTimeOfIntervention),
      'endTimeOfIntervention':
      serializer.toJson<String?>(endTimeOfIntervention),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'confirmMeterReprogramming':
      serializer.toJson<bool?>(confirmMeterReprogramming),
      'meterReprogrammingImage1':
      serializer.toJson<String?>(meterReprogrammingImage1),
      'meterReprogrammingImage2':
      serializer.toJson<String?>(meterReprogrammingImage2),
      'additionalInfoOfMeterReprogramming':
      serializer.toJson<String?>(additionalInfoOfMeterReprogramming),
      'confirmEnslavementTest':
      serializer.toJson<bool?>(confirmEnslavementTest),
      'meterEnslavementTestImage1':
      serializer.toJson<String?>(meterEnslavementTestImage1),
      'meterEnslavementTestImage2':
      serializer.toJson<String?>(meterEnslavementTestImage2),
      'additionalInfoOfEnslavementTest':
      serializer.toJson<String?>(additionalInfoOfEnslavementTest),
      'specifyYourAction': serializer.toJson<String?>(specifyYourAction),
      'photosOfAction': serializer.toJson<String?>(photosOfAction),
      'additionalInfoOfActions':
      serializer.toJson<String?>(additionalInfoOfActions),
      'photoOfWiring': serializer.toJson<String?>(photoOfWiring),
      'photoOfNewPoseMeter': serializer.toJson<String?>(photoOfNewPoseMeter),
      'isGripCase': serializer.toJson<bool?>(isGripCase),
      'gripCaseReason': serializer.toJson<String?>(gripCaseReason),
      'noticeOfPassageImage1':
      serializer.toJson<String?>(noticeOfPassageImage1),
      'noticeOfPassageImage2':
      serializer.toJson<String?>(noticeOfPassageImage2),
      'displacementPhotoImage1':
      serializer.toJson<String?>(displacementPhotoImage1),
      'displacementPhotoImage2':
      serializer.toJson<String?>(displacementPhotoImage2),
      'gripCaseComment': serializer.toJson<String?>(gripCaseComment),
    };
  }

  RCInterventionDetailsTableData copyWith(
      {int? id,
        String? startTimeOfIntervention,
        String? endTimeOfIntervention,
        double? latitude,
        double? longitude,
        bool? confirmMeterReprogramming,
        String? meterReprogrammingImage1,
        String? meterReprogrammingImage2,
        String? additionalInfoOfMeterReprogramming,
        bool? confirmEnslavementTest,
        String? meterEnslavementTestImage1,
        String? meterEnslavementTestImage2,
        String? additionalInfoOfEnslavementTest,
        String? specifyYourAction,
        String? photosOfAction,
        String? additionalInfoOfActions,
        String? photoOfWiring,
        String? photoOfNewPoseMeter,
        bool? isGripCase,
        String? gripCaseReason,
        String? noticeOfPassageImage1,
        String? noticeOfPassageImage2,
        String? displacementPhotoImage1,
        String? displacementPhotoImage2,
        String? gripCaseComment}) =>
      RCInterventionDetailsTableData(
        id: id ?? this.id,
        startTimeOfIntervention:
        startTimeOfIntervention ?? this.startTimeOfIntervention,
        endTimeOfIntervention:
        endTimeOfIntervention ?? this.endTimeOfIntervention,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        confirmMeterReprogramming:
        confirmMeterReprogramming ?? this.confirmMeterReprogramming,
        meterReprogrammingImage1:
        meterReprogrammingImage1 ?? this.meterReprogrammingImage1,
        meterReprogrammingImage2:
        meterReprogrammingImage2 ?? this.meterReprogrammingImage2,
        additionalInfoOfMeterReprogramming:
        additionalInfoOfMeterReprogramming ??
            this.additionalInfoOfMeterReprogramming,
        confirmEnslavementTest:
        confirmEnslavementTest ?? this.confirmEnslavementTest,
        meterEnslavementTestImage1:
        meterEnslavementTestImage1 ?? this.meterEnslavementTestImage1,
        meterEnslavementTestImage2:
        meterEnslavementTestImage2 ?? this.meterEnslavementTestImage2,
        additionalInfoOfEnslavementTest: additionalInfoOfEnslavementTest ??
            this.additionalInfoOfEnslavementTest,
        specifyYourAction: specifyYourAction ?? this.specifyYourAction,
        photosOfAction: photosOfAction ?? this.photosOfAction,
        additionalInfoOfActions:
        additionalInfoOfActions ?? this.additionalInfoOfActions,
        photoOfWiring: photoOfWiring ?? this.photoOfWiring,
        photoOfNewPoseMeter: photoOfNewPoseMeter ?? this.photoOfNewPoseMeter,
        isGripCase: isGripCase ?? this.isGripCase,
        gripCaseReason: gripCaseReason ?? this.gripCaseReason,
        noticeOfPassageImage1:
        noticeOfPassageImage1 ?? this.noticeOfPassageImage1,
        noticeOfPassageImage2:
        noticeOfPassageImage2 ?? this.noticeOfPassageImage2,
        displacementPhotoImage1:
        displacementPhotoImage1 ?? this.displacementPhotoImage1,
        displacementPhotoImage2:
        displacementPhotoImage2 ?? this.displacementPhotoImage2,
        gripCaseComment: gripCaseComment ?? this.gripCaseComment,
      );
  @override
  String toString() {
    return (StringBuffer('RCInterventionDetailsTableData(')
      ..write('id: $id, ')
      ..write('startTimeOfIntervention: $startTimeOfIntervention, ')
      ..write('endTimeOfIntervention: $endTimeOfIntervention, ')
      ..write('latitude: $latitude, ')
      ..write('longitude: $longitude, ')
      ..write('confirmMeterReprogramming: $confirmMeterReprogramming, ')
      ..write('meterReprogrammingImage1: $meterReprogrammingImage1, ')
      ..write('meterReprogrammingImage2: $meterReprogrammingImage2, ')
      ..write(
          'additionalInfoOfMeterReprogramming: $additionalInfoOfMeterReprogramming, ')
      ..write('confirmEnslavementTest: $confirmEnslavementTest, ')
      ..write('meterEnslavementTestImage1: $meterEnslavementTestImage1, ')
      ..write('meterEnslavementTestImage2: $meterEnslavementTestImage2, ')
      ..write(
          'additionalInfoOfEnslavementTest: $additionalInfoOfEnslavementTest, ')
      ..write('specifyYourAction: $specifyYourAction, ')
      ..write('photosOfAction: $photosOfAction, ')
      ..write('additionalInfoOfActions: $additionalInfoOfActions, ')
      ..write('photoOfWiring: $photoOfWiring, ')
      ..write('photoOfNewPoseMeter: $photoOfNewPoseMeter, ')
      ..write('isGripCase: $isGripCase, ')
      ..write('gripCaseReason: $gripCaseReason, ')
      ..write('noticeOfPassageImage1: $noticeOfPassageImage1, ')
      ..write('noticeOfPassageImage2: $noticeOfPassageImage2, ')
      ..write('displacementPhotoImage1: $displacementPhotoImage1, ')
      ..write('displacementPhotoImage2: $displacementPhotoImage2, ')
      ..write('gripCaseComment: $gripCaseComment')
      ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    startTimeOfIntervention,
    endTimeOfIntervention,
    latitude,
    longitude,
    confirmMeterReprogramming,
    meterReprogrammingImage1,
    meterReprogrammingImage2,
    additionalInfoOfMeterReprogramming,
    confirmEnslavementTest,
    meterEnslavementTestImage1,
    meterEnslavementTestImage2,
    additionalInfoOfEnslavementTest,
    specifyYourAction,
    photosOfAction,
    additionalInfoOfActions,
    photoOfWiring,
    photoOfNewPoseMeter,
    isGripCase,
    gripCaseReason,
    noticeOfPassageImage1,
    noticeOfPassageImage2,
    displacementPhotoImage1,
    displacementPhotoImage2,
    gripCaseComment
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is RCInterventionDetailsTableData &&
              other.id == this.id &&
              other.startTimeOfIntervention == this.startTimeOfIntervention &&
              other.endTimeOfIntervention == this.endTimeOfIntervention &&
              other.latitude == this.latitude &&
              other.longitude == this.longitude &&
              other.confirmMeterReprogramming == this.confirmMeterReprogramming &&
              other.meterReprogrammingImage1 == this.meterReprogrammingImage1 &&
              other.meterReprogrammingImage2 == this.meterReprogrammingImage2 &&
              other.additionalInfoOfMeterReprogramming ==
                  this.additionalInfoOfMeterReprogramming &&
              other.confirmEnslavementTest == this.confirmEnslavementTest &&
              other.meterEnslavementTestImage1 == this.meterEnslavementTestImage1 &&
              other.meterEnslavementTestImage2 == this.meterEnslavementTestImage2 &&
              other.additionalInfoOfEnslavementTest ==
                  this.additionalInfoOfEnslavementTest &&
              other.specifyYourAction == this.specifyYourAction &&
              other.photosOfAction == this.photosOfAction &&
              other.additionalInfoOfActions == this.additionalInfoOfActions &&
              other.photoOfWiring == this.photoOfWiring &&
              other.photoOfNewPoseMeter == this.photoOfNewPoseMeter &&
              other.isGripCase == this.isGripCase &&
              other.gripCaseReason == this.gripCaseReason &&
              other.noticeOfPassageImage1 == this.noticeOfPassageImage1 &&
              other.noticeOfPassageImage2 == this.noticeOfPassageImage2 &&
              other.displacementPhotoImage1 == this.displacementPhotoImage1 &&
              other.displacementPhotoImage2 == this.displacementPhotoImage2 &&
              other.gripCaseComment == this.gripCaseComment);
}

class RCInterventionDetailsTableCompanion
    extends UpdateCompanion<RCInterventionDetailsTableData> {
  final Value<int> id;
  final Value<String?> startTimeOfIntervention;
  final Value<String?> endTimeOfIntervention;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<bool?> confirmMeterReprogramming;
  final Value<String?> meterReprogrammingImage1;
  final Value<String?> meterReprogrammingImage2;
  final Value<String?> additionalInfoOfMeterReprogramming;
  final Value<bool?> confirmEnslavementTest;
  final Value<String?> meterEnslavementTestImage1;
  final Value<String?> meterEnslavementTestImage2;
  final Value<String?> additionalInfoOfEnslavementTest;
  final Value<String?> specifyYourAction;
  final Value<String?> photosOfAction;
  final Value<String?> additionalInfoOfActions;
  final Value<String?> photoOfWiring;
  final Value<String?> photoOfNewPoseMeter;
  final Value<bool?> isGripCase;
  final Value<String?> gripCaseReason;
  final Value<String?> noticeOfPassageImage1;
  final Value<String?> noticeOfPassageImage2;
  final Value<String?> displacementPhotoImage1;
  final Value<String?> displacementPhotoImage2;
  final Value<String?> gripCaseComment;
  const RCInterventionDetailsTableCompanion({
    this.id = const Value.absent(),
    this.startTimeOfIntervention = const Value.absent(),
    this.endTimeOfIntervention = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.confirmMeterReprogramming = const Value.absent(),
    this.meterReprogrammingImage1 = const Value.absent(),
    this.meterReprogrammingImage2 = const Value.absent(),
    this.additionalInfoOfMeterReprogramming = const Value.absent(),
    this.confirmEnslavementTest = const Value.absent(),
    this.meterEnslavementTestImage1 = const Value.absent(),
    this.meterEnslavementTestImage2 = const Value.absent(),
    this.additionalInfoOfEnslavementTest = const Value.absent(),
    this.specifyYourAction = const Value.absent(),
    this.photosOfAction = const Value.absent(),
    this.additionalInfoOfActions = const Value.absent(),
    this.photoOfWiring = const Value.absent(),
    this.photoOfNewPoseMeter = const Value.absent(),
    this.isGripCase = const Value.absent(),
    this.gripCaseReason = const Value.absent(),
    this.noticeOfPassageImage1 = const Value.absent(),
    this.noticeOfPassageImage2 = const Value.absent(),
    this.displacementPhotoImage1 = const Value.absent(),
    this.displacementPhotoImage2 = const Value.absent(),
    this.gripCaseComment = const Value.absent(),
  });
  RCInterventionDetailsTableCompanion.insert({
    this.id = const Value.absent(),
    this.startTimeOfIntervention = const Value.absent(),
    this.endTimeOfIntervention = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.confirmMeterReprogramming = const Value.absent(),
    this.meterReprogrammingImage1 = const Value.absent(),
    this.meterReprogrammingImage2 = const Value.absent(),
    this.additionalInfoOfMeterReprogramming = const Value.absent(),
    this.confirmEnslavementTest = const Value.absent(),
    this.meterEnslavementTestImage1 = const Value.absent(),
    this.meterEnslavementTestImage2 = const Value.absent(),
    this.additionalInfoOfEnslavementTest = const Value.absent(),
    this.specifyYourAction = const Value.absent(),
    this.photosOfAction = const Value.absent(),
    this.additionalInfoOfActions = const Value.absent(),
    this.photoOfWiring = const Value.absent(),
    this.photoOfNewPoseMeter = const Value.absent(),
    this.isGripCase = const Value.absent(),
    this.gripCaseReason = const Value.absent(),
    this.noticeOfPassageImage1 = const Value.absent(),
    this.noticeOfPassageImage2 = const Value.absent(),
    this.displacementPhotoImage1 = const Value.absent(),
    this.displacementPhotoImage2 = const Value.absent(),
    this.gripCaseComment = const Value.absent(),
  });
  static Insertable<RCInterventionDetailsTableData> custom({
    Expression<int>? id,
    Expression<String?>? startTimeOfIntervention,
    Expression<String?>? endTimeOfIntervention,
    Expression<double?>? latitude,
    Expression<double?>? longitude,
    Expression<bool?>? confirmMeterReprogramming,
    Expression<String?>? meterReprogrammingImage1,
    Expression<String?>? meterReprogrammingImage2,
    Expression<String?>? additionalInfoOfMeterReprogramming,
    Expression<bool?>? confirmEnslavementTest,
    Expression<String?>? meterEnslavementTestImage1,
    Expression<String?>? meterEnslavementTestImage2,
    Expression<String?>? additionalInfoOfEnslavementTest,
    Expression<String?>? specifyYourAction,
    Expression<String?>? photosOfAction,
    Expression<String?>? additionalInfoOfActions,
    Expression<String?>? photoOfWiring,
    Expression<String?>? photoOfNewPoseMeter,
    Expression<bool?>? isGripCase,
    Expression<String?>? gripCaseReason,
    Expression<String?>? noticeOfPassageImage1,
    Expression<String?>? noticeOfPassageImage2,
    Expression<String?>? displacementPhotoImage1,
    Expression<String?>? displacementPhotoImage2,
    Expression<String?>? gripCaseComment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTimeOfIntervention != null)
        'start_time_of_intervention': startTimeOfIntervention,
      if (endTimeOfIntervention != null)
        'end_time_of_intervention': endTimeOfIntervention,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (confirmMeterReprogramming != null)
        'confirm_meter_reprogramming': confirmMeterReprogramming,
      if (meterReprogrammingImage1 != null)
        'meter_reprogramming_image1': meterReprogrammingImage1,
      if (meterReprogrammingImage2 != null)
        'meter_reprogramming_image2': meterReprogrammingImage2,
      if (additionalInfoOfMeterReprogramming != null)
        'additional_info_of_meter_reprogramming':
        additionalInfoOfMeterReprogramming,
      if (confirmEnslavementTest != null)
        'confirm_enslavement_test': confirmEnslavementTest,
      if (meterEnslavementTestImage1 != null)
        'meter_enslavement_test_image1': meterEnslavementTestImage1,
      if (meterEnslavementTestImage2 != null)
        'meter_enslavement_test_image2': meterEnslavementTestImage2,
      if (additionalInfoOfEnslavementTest != null)
        'additional_info_of_enslavement_test': additionalInfoOfEnslavementTest,
      if (specifyYourAction != null) 'specify_your_action': specifyYourAction,
      if (photosOfAction != null) 'photos_of_action': photosOfAction,
      if (additionalInfoOfActions != null)
        'additional_info_of_actions': additionalInfoOfActions,
      if (photoOfWiring != null) 'photo_of_wiring': photoOfWiring,
      if (photoOfNewPoseMeter != null)
        'photo_of_new_pose_meter': photoOfNewPoseMeter,
      if (isGripCase != null) 'is_grip_case': isGripCase,
      if (gripCaseReason != null) 'grip_case_reason': gripCaseReason,
      if (noticeOfPassageImage1 != null)
        'notice_of_passage_image1': noticeOfPassageImage1,
      if (noticeOfPassageImage2 != null)
        'notice_of_passage_image2': noticeOfPassageImage2,
      if (displacementPhotoImage1 != null)
        'displacement_photo_image1': displacementPhotoImage1,
      if (displacementPhotoImage2 != null)
        'displacement_photo_image2': displacementPhotoImage2,
      if (gripCaseComment != null) 'grip_case_comment': gripCaseComment,
    });
  }

  RCInterventionDetailsTableCompanion copyWith(
      {Value<int>? id,
        Value<String?>? startTimeOfIntervention,
        Value<String?>? endTimeOfIntervention,
        Value<double?>? latitude,
        Value<double?>? longitude,
        Value<bool?>? confirmMeterReprogramming,
        Value<String?>? meterReprogrammingImage1,
        Value<String?>? meterReprogrammingImage2,
        Value<String?>? additionalInfoOfMeterReprogramming,
        Value<bool?>? confirmEnslavementTest,
        Value<String?>? meterEnslavementTestImage1,
        Value<String?>? meterEnslavementTestImage2,
        Value<String?>? additionalInfoOfEnslavementTest,
        Value<String?>? specifyYourAction,
        Value<String?>? photosOfAction,
        Value<String?>? additionalInfoOfActions,
        Value<String?>? photoOfWiring,
        Value<String?>? photoOfNewPoseMeter,
        Value<bool?>? isGripCase,
        Value<String?>? gripCaseReason,
        Value<String?>? noticeOfPassageImage1,
        Value<String?>? noticeOfPassageImage2,
        Value<String?>? displacementPhotoImage1,
        Value<String?>? displacementPhotoImage2,
        Value<String?>? gripCaseComment}) {
    return RCInterventionDetailsTableCompanion(
      id: id ?? this.id,
      startTimeOfIntervention:
      startTimeOfIntervention ?? this.startTimeOfIntervention,
      endTimeOfIntervention:
      endTimeOfIntervention ?? this.endTimeOfIntervention,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      confirmMeterReprogramming:
      confirmMeterReprogramming ?? this.confirmMeterReprogramming,
      meterReprogrammingImage1:
      meterReprogrammingImage1 ?? this.meterReprogrammingImage1,
      meterReprogrammingImage2:
      meterReprogrammingImage2 ?? this.meterReprogrammingImage2,
      additionalInfoOfMeterReprogramming: additionalInfoOfMeterReprogramming ??
          this.additionalInfoOfMeterReprogramming,
      confirmEnslavementTest:
      confirmEnslavementTest ?? this.confirmEnslavementTest,
      meterEnslavementTestImage1:
      meterEnslavementTestImage1 ?? this.meterEnslavementTestImage1,
      meterEnslavementTestImage2:
      meterEnslavementTestImage2 ?? this.meterEnslavementTestImage2,
      additionalInfoOfEnslavementTest: additionalInfoOfEnslavementTest ??
          this.additionalInfoOfEnslavementTest,
      specifyYourAction: specifyYourAction ?? this.specifyYourAction,
      photosOfAction: photosOfAction ?? this.photosOfAction,
      additionalInfoOfActions:
      additionalInfoOfActions ?? this.additionalInfoOfActions,
      photoOfWiring: photoOfWiring ?? this.photoOfWiring,
      photoOfNewPoseMeter: photoOfNewPoseMeter ?? this.photoOfNewPoseMeter,
      isGripCase: isGripCase ?? this.isGripCase,
      gripCaseReason: gripCaseReason ?? this.gripCaseReason,
      noticeOfPassageImage1:
      noticeOfPassageImage1 ?? this.noticeOfPassageImage1,
      noticeOfPassageImage2:
      noticeOfPassageImage2 ?? this.noticeOfPassageImage2,
      displacementPhotoImage1:
      displacementPhotoImage1 ?? this.displacementPhotoImage1,
      displacementPhotoImage2:
      displacementPhotoImage2 ?? this.displacementPhotoImage2,
      gripCaseComment: gripCaseComment ?? this.gripCaseComment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startTimeOfIntervention.present) {
      map['start_time_of_intervention'] =
          Variable<String?>(startTimeOfIntervention.value);
    }
    if (endTimeOfIntervention.present) {
      map['end_time_of_intervention'] =
          Variable<String?>(endTimeOfIntervention.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double?>(longitude.value);
    }
    if (confirmMeterReprogramming.present) {
      map['confirm_meter_reprogramming'] =
          Variable<bool?>(confirmMeterReprogramming.value);
    }
    if (meterReprogrammingImage1.present) {
      map['meter_reprogramming_image1'] =
          Variable<String?>(meterReprogrammingImage1.value);
    }
    if (meterReprogrammingImage2.present) {
      map['meter_reprogramming_image2'] =
          Variable<String?>(meterReprogrammingImage2.value);
    }
    if (additionalInfoOfMeterReprogramming.present) {
      map['additional_info_of_meter_reprogramming'] =
          Variable<String?>(additionalInfoOfMeterReprogramming.value);
    }
    if (confirmEnslavementTest.present) {
      map['confirm_enslavement_test'] =
          Variable<bool?>(confirmEnslavementTest.value);
    }
    if (meterEnslavementTestImage1.present) {
      map['meter_enslavement_test_image1'] =
          Variable<String?>(meterEnslavementTestImage1.value);
    }
    if (meterEnslavementTestImage2.present) {
      map['meter_enslavement_test_image2'] =
          Variable<String?>(meterEnslavementTestImage2.value);
    }
    if (additionalInfoOfEnslavementTest.present) {
      map['additional_info_of_enslavement_test'] =
          Variable<String?>(additionalInfoOfEnslavementTest.value);
    }
    if (specifyYourAction.present) {
      map['specify_your_action'] = Variable<String?>(specifyYourAction.value);
    }
    if (photosOfAction.present) {
      map['photos_of_action'] = Variable<String?>(photosOfAction.value);
    }
    if (additionalInfoOfActions.present) {
      map['additional_info_of_actions'] =
          Variable<String?>(additionalInfoOfActions.value);
    }
    if (photoOfWiring.present) {
      map['photo_of_wiring'] = Variable<String?>(photoOfWiring.value);
    }
    if (photoOfNewPoseMeter.present) {
      map['photo_of_new_pose_meter'] =
          Variable<String?>(photoOfNewPoseMeter.value);
    }
    if (isGripCase.present) {
      map['is_grip_case'] = Variable<bool?>(isGripCase.value);
    }
    if (gripCaseReason.present) {
      map['grip_case_reason'] = Variable<String?>(gripCaseReason.value);
    }
    if (noticeOfPassageImage1.present) {
      map['notice_of_passage_image1'] =
          Variable<String?>(noticeOfPassageImage1.value);
    }
    if (noticeOfPassageImage2.present) {
      map['notice_of_passage_image2'] =
          Variable<String?>(noticeOfPassageImage2.value);
    }
    if (displacementPhotoImage1.present) {
      map['displacement_photo_image1'] =
          Variable<String?>(displacementPhotoImage1.value);
    }
    if (displacementPhotoImage2.present) {
      map['displacement_photo_image2'] =
          Variable<String?>(displacementPhotoImage2.value);
    }
    if (gripCaseComment.present) {
      map['grip_case_comment'] = Variable<String?>(gripCaseComment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RCInterventionDetailsTableCompanion(')
      ..write('id: $id, ')
      ..write('startTimeOfIntervention: $startTimeOfIntervention, ')
      ..write('endTimeOfIntervention: $endTimeOfIntervention, ')
      ..write('latitude: $latitude, ')
      ..write('longitude: $longitude, ')
      ..write('confirmMeterReprogramming: $confirmMeterReprogramming, ')
      ..write('meterReprogrammingImage1: $meterReprogrammingImage1, ')
      ..write('meterReprogrammingImage2: $meterReprogrammingImage2, ')
      ..write(
          'additionalInfoOfMeterReprogramming: $additionalInfoOfMeterReprogramming, ')
      ..write('confirmEnslavementTest: $confirmEnslavementTest, ')
      ..write('meterEnslavementTestImage1: $meterEnslavementTestImage1, ')
      ..write('meterEnslavementTestImage2: $meterEnslavementTestImage2, ')
      ..write(
          'additionalInfoOfEnslavementTest: $additionalInfoOfEnslavementTest, ')
      ..write('specifyYourAction: $specifyYourAction, ')
      ..write('photosOfAction: $photosOfAction, ')
      ..write('additionalInfoOfActions: $additionalInfoOfActions, ')
      ..write('photoOfWiring: $photoOfWiring, ')
      ..write('photoOfNewPoseMeter: $photoOfNewPoseMeter, ')
      ..write('isGripCase: $isGripCase, ')
      ..write('gripCaseReason: $gripCaseReason, ')
      ..write('noticeOfPassageImage1: $noticeOfPassageImage1, ')
      ..write('noticeOfPassageImage2: $noticeOfPassageImage2, ')
      ..write('displacementPhotoImage1: $displacementPhotoImage1, ')
      ..write('displacementPhotoImage2: $displacementPhotoImage2, ')
      ..write('gripCaseComment: $gripCaseComment')
      ..write(')'))
        .toString();
  }
}

class $RCInterventionDetailsTableTable extends RCInterventionDetailsTable
    with
        TableInfo<$RCInterventionDetailsTableTable,
            RCInterventionDetailsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RCInterventionDetailsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _startTimeOfInterventionMeta =
  const VerificationMeta('startTimeOfIntervention');
  @override
  late final GeneratedColumn<String?> startTimeOfIntervention =
  GeneratedColumn<String?>('start_time_of_intervention', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _endTimeOfInterventionMeta =
  const VerificationMeta('endTimeOfIntervention');
  @override
  late final GeneratedColumn<String?> endTimeOfIntervention =
  GeneratedColumn<String?>('end_time_of_intervention', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _confirmMeterReprogrammingMeta =
  const VerificationMeta('confirmMeterReprogramming');
  @override
  late final GeneratedColumn<bool?> confirmMeterReprogramming =
  GeneratedColumn<bool?>('confirm_meter_reprogramming', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (confirm_meter_reprogramming IN (0, 1))');
  final VerificationMeta _meterReprogrammingImage1Meta =
  const VerificationMeta('meterReprogrammingImage1');
  @override
  late final GeneratedColumn<String?> meterReprogrammingImage1 =
  GeneratedColumn<String?>('meter_reprogramming_image1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _meterReprogrammingImage2Meta =
  const VerificationMeta('meterReprogrammingImage2');
  @override
  late final GeneratedColumn<String?> meterReprogrammingImage2 =
  GeneratedColumn<String?>('meter_reprogramming_image2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _additionalInfoOfMeterReprogrammingMeta =
  const VerificationMeta('additionalInfoOfMeterReprogramming');
  @override
  late final GeneratedColumn<String?> additionalInfoOfMeterReprogramming =
  GeneratedColumn<String?>(
      'additional_info_of_meter_reprogramming', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _confirmEnslavementTestMeta =
  const VerificationMeta('confirmEnslavementTest');
  @override
  late final GeneratedColumn<bool?> confirmEnslavementTest =
  GeneratedColumn<bool?>('confirm_enslavement_test', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (confirm_enslavement_test IN (0, 1))');
  final VerificationMeta _meterEnslavementTestImage1Meta =
  const VerificationMeta('meterEnslavementTestImage1');
  @override
  late final GeneratedColumn<String?> meterEnslavementTestImage1 =
  GeneratedColumn<String?>(
      'meter_enslavement_test_image1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _meterEnslavementTestImage2Meta =
  const VerificationMeta('meterEnslavementTestImage2');
  @override
  late final GeneratedColumn<String?> meterEnslavementTestImage2 =
  GeneratedColumn<String?>(
      'meter_enslavement_test_image2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _additionalInfoOfEnslavementTestMeta =
  const VerificationMeta('additionalInfoOfEnslavementTest');
  @override
  late final GeneratedColumn<String?> additionalInfoOfEnslavementTest =
  GeneratedColumn<String?>(
      'additional_info_of_enslavement_test', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _specifyYourActionMeta =
  const VerificationMeta('specifyYourAction');
  @override
  late final GeneratedColumn<String?> specifyYourAction =
  GeneratedColumn<String?>('specify_your_action', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _photosOfActionMeta =
  const VerificationMeta('photosOfAction');
  @override
  late final GeneratedColumn<String?> photosOfAction = GeneratedColumn<String?>(
      'photos_of_action', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _additionalInfoOfActionsMeta =
  const VerificationMeta('additionalInfoOfActions');
  @override
  late final GeneratedColumn<String?> additionalInfoOfActions =
  GeneratedColumn<String?>('additional_info_of_actions', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _photoOfWiringMeta =
  const VerificationMeta('photoOfWiring');
  @override
  late final GeneratedColumn<String?> photoOfWiring = GeneratedColumn<String?>(
      'photo_of_wiring', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _photoOfNewPoseMeterMeta =
  const VerificationMeta('photoOfNewPoseMeter');
  @override
  late final GeneratedColumn<String?> photoOfNewPoseMeter =
  GeneratedColumn<String?>('photo_of_new_pose_meter', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isGripCaseMeta = const VerificationMeta('isGripCase');
  @override
  late final GeneratedColumn<bool?> isGripCase = GeneratedColumn<bool?>(
      'is_grip_case', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_grip_case IN (0, 1))');
  final VerificationMeta _gripCaseReasonMeta =
  const VerificationMeta('gripCaseReason');
  @override
  late final GeneratedColumn<String?> gripCaseReason = GeneratedColumn<String?>(
      'grip_case_reason', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _noticeOfPassageImage1Meta =
  const VerificationMeta('noticeOfPassageImage1');
  @override
  late final GeneratedColumn<String?> noticeOfPassageImage1 =
  GeneratedColumn<String?>('notice_of_passage_image1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _noticeOfPassageImage2Meta =
  const VerificationMeta('noticeOfPassageImage2');
  @override
  late final GeneratedColumn<String?> noticeOfPassageImage2 =
  GeneratedColumn<String?>('notice_of_passage_image2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _displacementPhotoImage1Meta =
  const VerificationMeta('displacementPhotoImage1');
  @override
  late final GeneratedColumn<String?> displacementPhotoImage1 =
  GeneratedColumn<String?>('displacement_photo_image1', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _displacementPhotoImage2Meta =
  const VerificationMeta('displacementPhotoImage2');
  @override
  late final GeneratedColumn<String?> displacementPhotoImage2 =
  GeneratedColumn<String?>('displacement_photo_image2', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _gripCaseCommentMeta =
  const VerificationMeta('gripCaseComment');
  @override
  late final GeneratedColumn<String?> gripCaseComment =
  GeneratedColumn<String?>('grip_case_comment', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startTimeOfIntervention,
    endTimeOfIntervention,
    latitude,
    longitude,
    confirmMeterReprogramming,
    meterReprogrammingImage1,
    meterReprogrammingImage2,
    additionalInfoOfMeterReprogramming,
    confirmEnslavementTest,
    meterEnslavementTestImage1,
    meterEnslavementTestImage2,
    additionalInfoOfEnslavementTest,
    specifyYourAction,
    photosOfAction,
    additionalInfoOfActions,
    photoOfWiring,
    photoOfNewPoseMeter,
    isGripCase,
    gripCaseReason,
    noticeOfPassageImage1,
    noticeOfPassageImage2,
    displacementPhotoImage1,
    displacementPhotoImage2,
    gripCaseComment
  ];
  @override
  String get aliasedName => _alias ?? 'r_c_intervention_details_table';
  @override
  String get actualTableName => 'r_c_intervention_details_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RCInterventionDetailsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time_of_intervention')) {
      context.handle(
          _startTimeOfInterventionMeta,
          startTimeOfIntervention.isAcceptableOrUnknown(
              data['start_time_of_intervention']!,
              _startTimeOfInterventionMeta));
    }
    if (data.containsKey('end_time_of_intervention')) {
      context.handle(
          _endTimeOfInterventionMeta,
          endTimeOfIntervention.isAcceptableOrUnknown(
              data['end_time_of_intervention']!, _endTimeOfInterventionMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('confirm_meter_reprogramming')) {
      context.handle(
          _confirmMeterReprogrammingMeta,
          confirmMeterReprogramming.isAcceptableOrUnknown(
              data['confirm_meter_reprogramming']!,
              _confirmMeterReprogrammingMeta));
    }
    if (data.containsKey('meter_reprogramming_image1')) {
      context.handle(
          _meterReprogrammingImage1Meta,
          meterReprogrammingImage1.isAcceptableOrUnknown(
              data['meter_reprogramming_image1']!,
              _meterReprogrammingImage1Meta));
    }
    if (data.containsKey('meter_reprogramming_image2')) {
      context.handle(
          _meterReprogrammingImage2Meta,
          meterReprogrammingImage2.isAcceptableOrUnknown(
              data['meter_reprogramming_image2']!,
              _meterReprogrammingImage2Meta));
    }
    if (data.containsKey('additional_info_of_meter_reprogramming')) {
      context.handle(
          _additionalInfoOfMeterReprogrammingMeta,
          additionalInfoOfMeterReprogramming.isAcceptableOrUnknown(
              data['additional_info_of_meter_reprogramming']!,
              _additionalInfoOfMeterReprogrammingMeta));
    }
    if (data.containsKey('confirm_enslavement_test')) {
      context.handle(
          _confirmEnslavementTestMeta,
          confirmEnslavementTest.isAcceptableOrUnknown(
              data['confirm_enslavement_test']!, _confirmEnslavementTestMeta));
    }
    if (data.containsKey('meter_enslavement_test_image1')) {
      context.handle(
          _meterEnslavementTestImage1Meta,
          meterEnslavementTestImage1.isAcceptableOrUnknown(
              data['meter_enslavement_test_image1']!,
              _meterEnslavementTestImage1Meta));
    }
    if (data.containsKey('meter_enslavement_test_image2')) {
      context.handle(
          _meterEnslavementTestImage2Meta,
          meterEnslavementTestImage2.isAcceptableOrUnknown(
              data['meter_enslavement_test_image2']!,
              _meterEnslavementTestImage2Meta));
    }
    if (data.containsKey('additional_info_of_enslavement_test')) {
      context.handle(
          _additionalInfoOfEnslavementTestMeta,
          additionalInfoOfEnslavementTest.isAcceptableOrUnknown(
              data['additional_info_of_enslavement_test']!,
              _additionalInfoOfEnslavementTestMeta));
    }
    if (data.containsKey('specify_your_action')) {
      context.handle(
          _specifyYourActionMeta,
          specifyYourAction.isAcceptableOrUnknown(
              data['specify_your_action']!, _specifyYourActionMeta));
    }
    if (data.containsKey('photos_of_action')) {
      context.handle(
          _photosOfActionMeta,
          photosOfAction.isAcceptableOrUnknown(
              data['photos_of_action']!, _photosOfActionMeta));
    }
    if (data.containsKey('additional_info_of_actions')) {
      context.handle(
          _additionalInfoOfActionsMeta,
          additionalInfoOfActions.isAcceptableOrUnknown(
              data['additional_info_of_actions']!,
              _additionalInfoOfActionsMeta));
    }
    if (data.containsKey('photo_of_wiring')) {
      context.handle(
          _photoOfWiringMeta,
          photoOfWiring.isAcceptableOrUnknown(
              data['photo_of_wiring']!, _photoOfWiringMeta));
    }
    if (data.containsKey('photo_of_new_pose_meter')) {
      context.handle(
          _photoOfNewPoseMeterMeta,
          photoOfNewPoseMeter.isAcceptableOrUnknown(
              data['photo_of_new_pose_meter']!, _photoOfNewPoseMeterMeta));
    }
    if (data.containsKey('is_grip_case')) {
      context.handle(
          _isGripCaseMeta,
          isGripCase.isAcceptableOrUnknown(
              data['is_grip_case']!, _isGripCaseMeta));
    }
    if (data.containsKey('grip_case_reason')) {
      context.handle(
          _gripCaseReasonMeta,
          gripCaseReason.isAcceptableOrUnknown(
              data['grip_case_reason']!, _gripCaseReasonMeta));
    }
    if (data.containsKey('notice_of_passage_image1')) {
      context.handle(
          _noticeOfPassageImage1Meta,
          noticeOfPassageImage1.isAcceptableOrUnknown(
              data['notice_of_passage_image1']!, _noticeOfPassageImage1Meta));
    }
    if (data.containsKey('notice_of_passage_image2')) {
      context.handle(
          _noticeOfPassageImage2Meta,
          noticeOfPassageImage2.isAcceptableOrUnknown(
              data['notice_of_passage_image2']!, _noticeOfPassageImage2Meta));
    }
    if (data.containsKey('displacement_photo_image1')) {
      context.handle(
          _displacementPhotoImage1Meta,
          displacementPhotoImage1.isAcceptableOrUnknown(
              data['displacement_photo_image1']!,
              _displacementPhotoImage1Meta));
    }
    if (data.containsKey('displacement_photo_image2')) {
      context.handle(
          _displacementPhotoImage2Meta,
          displacementPhotoImage2.isAcceptableOrUnknown(
              data['displacement_photo_image2']!,
              _displacementPhotoImage2Meta));
    }
    if (data.containsKey('grip_case_comment')) {
      context.handle(
          _gripCaseCommentMeta,
          gripCaseComment.isAcceptableOrUnknown(
              data['grip_case_comment']!, _gripCaseCommentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RCInterventionDetailsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return RCInterventionDetailsTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RCInterventionDetailsTableTable createAlias(String alias) {
    return $RCInterventionDetailsTableTable(attachedDatabase, alias);
  }
}

class AnalyticsTimeTableData extends DataClass
    implements Insertable<AnalyticsTimeTableData> {
  final int id;
  final int userRoleIdLocalDB;
  final String? month;
  final String? year;
  final int? hoursForStatus2;
  final int? hoursForStatus3;
  final int? hoursForStatus4;
  AnalyticsTimeTableData(
      {required this.id,
        required this.userRoleIdLocalDB,
        this.month,
        this.year,
        this.hoursForStatus2,
        this.hoursForStatus3,
        this.hoursForStatus4});
  factory AnalyticsTimeTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AnalyticsTimeTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userRoleIdLocalDB: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}user_role_id_local_d_b'])!,
      month: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}month']),
      year: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}year']),
      hoursForStatus2: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hours_for_status2']),
      hoursForStatus3: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hours_for_status3']),
      hoursForStatus4: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hours_for_status4']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_role_id_local_d_b'] = Variable<int>(userRoleIdLocalDB);
    if (!nullToAbsent || month != null) {
      map['month'] = Variable<String?>(month);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<String?>(year);
    }
    if (!nullToAbsent || hoursForStatus2 != null) {
      map['hours_for_status2'] = Variable<int?>(hoursForStatus2);
    }
    if (!nullToAbsent || hoursForStatus3 != null) {
      map['hours_for_status3'] = Variable<int?>(hoursForStatus3);
    }
    if (!nullToAbsent || hoursForStatus4 != null) {
      map['hours_for_status4'] = Variable<int?>(hoursForStatus4);
    }
    return map;
  }

  AnalyticsTimeTableCompanion toCompanion(bool nullToAbsent) {
    return AnalyticsTimeTableCompanion(
      id: Value(id),
      userRoleIdLocalDB: Value(userRoleIdLocalDB),
      month:
      month == null && nullToAbsent ? const Value.absent() : Value(month),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      hoursForStatus2: hoursForStatus2 == null && nullToAbsent
          ? const Value.absent()
          : Value(hoursForStatus2),
      hoursForStatus3: hoursForStatus3 == null && nullToAbsent
          ? const Value.absent()
          : Value(hoursForStatus3),
      hoursForStatus4: hoursForStatus4 == null && nullToAbsent
          ? const Value.absent()
          : Value(hoursForStatus4),
    );
  }

  factory AnalyticsTimeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnalyticsTimeTableData(
      id: serializer.fromJson<int>(json['id']),
      userRoleIdLocalDB: serializer.fromJson<int>(json['userRoleIdLocalDB']),
      month: serializer.fromJson<String?>(json['month']),
      year: serializer.fromJson<String?>(json['year']),
      hoursForStatus2: serializer.fromJson<int?>(json['hoursForStatus2']),
      hoursForStatus3: serializer.fromJson<int?>(json['hoursForStatus3']),
      hoursForStatus4: serializer.fromJson<int?>(json['hoursForStatus4']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userRoleIdLocalDB': serializer.toJson<int>(userRoleIdLocalDB),
      'month': serializer.toJson<String?>(month),
      'year': serializer.toJson<String?>(year),
      'hoursForStatus2': serializer.toJson<int?>(hoursForStatus2),
      'hoursForStatus3': serializer.toJson<int?>(hoursForStatus3),
      'hoursForStatus4': serializer.toJson<int?>(hoursForStatus4),
    };
  }

  AnalyticsTimeTableData copyWith(
      {int? id,
        int? userRoleIdLocalDB,
        String? month,
        String? year,
        int? hoursForStatus2,
        int? hoursForStatus3,
        int? hoursForStatus4}) =>
      AnalyticsTimeTableData(
        id: id ?? this.id,
        userRoleIdLocalDB: userRoleIdLocalDB ?? this.userRoleIdLocalDB,
        month: month ?? this.month,
        year: year ?? this.year,
        hoursForStatus2: hoursForStatus2 ?? this.hoursForStatus2,
        hoursForStatus3: hoursForStatus3 ?? this.hoursForStatus3,
        hoursForStatus4: hoursForStatus4 ?? this.hoursForStatus4,
      );
  @override
  String toString() {
    return (StringBuffer('AnalyticsTimeTableData(')
      ..write('id: $id, ')
      ..write('userRoleIdLocalDB: $userRoleIdLocalDB, ')
      ..write('month: $month, ')
      ..write('year: $year, ')
      ..write('hoursForStatus2: $hoursForStatus2, ')
      ..write('hoursForStatus3: $hoursForStatus3, ')
      ..write('hoursForStatus4: $hoursForStatus4')
      ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userRoleIdLocalDB, month, year,
      hoursForStatus2, hoursForStatus3, hoursForStatus4);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AnalyticsTimeTableData &&
              other.id == this.id &&
              other.userRoleIdLocalDB == this.userRoleIdLocalDB &&
              other.month == this.month &&
              other.year == this.year &&
              other.hoursForStatus2 == this.hoursForStatus2 &&
              other.hoursForStatus3 == this.hoursForStatus3 &&
              other.hoursForStatus4 == this.hoursForStatus4);
}

class AnalyticsTimeTableCompanion
    extends UpdateCompanion<AnalyticsTimeTableData> {
  final Value<int> id;
  final Value<int> userRoleIdLocalDB;
  final Value<String?> month;
  final Value<String?> year;
  final Value<int?> hoursForStatus2;
  final Value<int?> hoursForStatus3;
  final Value<int?> hoursForStatus4;
  const AnalyticsTimeTableCompanion({
    this.id = const Value.absent(),
    this.userRoleIdLocalDB = const Value.absent(),
    this.month = const Value.absent(),
    this.year = const Value.absent(),
    this.hoursForStatus2 = const Value.absent(),
    this.hoursForStatus3 = const Value.absent(),
    this.hoursForStatus4 = const Value.absent(),
  });
  AnalyticsTimeTableCompanion.insert({
    this.id = const Value.absent(),
    required int userRoleIdLocalDB,
    this.month = const Value.absent(),
    this.year = const Value.absent(),
    this.hoursForStatus2 = const Value.absent(),
    this.hoursForStatus3 = const Value.absent(),
    this.hoursForStatus4 = const Value.absent(),
  }) : userRoleIdLocalDB = Value(userRoleIdLocalDB);
  static Insertable<AnalyticsTimeTableData> custom({
    Expression<int>? id,
    Expression<int>? userRoleIdLocalDB,
    Expression<String?>? month,
    Expression<String?>? year,
    Expression<int?>? hoursForStatus2,
    Expression<int?>? hoursForStatus3,
    Expression<int?>? hoursForStatus4,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userRoleIdLocalDB != null)
        'user_role_id_local_d_b': userRoleIdLocalDB,
      if (month != null) 'month': month,
      if (year != null) 'year': year,
      if (hoursForStatus2 != null) 'hours_for_status2': hoursForStatus2,
      if (hoursForStatus3 != null) 'hours_for_status3': hoursForStatus3,
      if (hoursForStatus4 != null) 'hours_for_status4': hoursForStatus4,
    });
  }

  AnalyticsTimeTableCompanion copyWith(
      {Value<int>? id,
        Value<int>? userRoleIdLocalDB,
        Value<String?>? month,
        Value<String?>? year,
        Value<int?>? hoursForStatus2,
        Value<int?>? hoursForStatus3,
        Value<int?>? hoursForStatus4}) {
    return AnalyticsTimeTableCompanion(
      id: id ?? this.id,
      userRoleIdLocalDB: userRoleIdLocalDB ?? this.userRoleIdLocalDB,
      month: month ?? this.month,
      year: year ?? this.year,
      hoursForStatus2: hoursForStatus2 ?? this.hoursForStatus2,
      hoursForStatus3: hoursForStatus3 ?? this.hoursForStatus3,
      hoursForStatus4: hoursForStatus4 ?? this.hoursForStatus4,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userRoleIdLocalDB.present) {
      map['user_role_id_local_d_b'] = Variable<int>(userRoleIdLocalDB.value);
    }
    if (month.present) {
      map['month'] = Variable<String?>(month.value);
    }
    if (year.present) {
      map['year'] = Variable<String?>(year.value);
    }
    if (hoursForStatus2.present) {
      map['hours_for_status2'] = Variable<int?>(hoursForStatus2.value);
    }
    if (hoursForStatus3.present) {
      map['hours_for_status3'] = Variable<int?>(hoursForStatus3.value);
    }
    if (hoursForStatus4.present) {
      map['hours_for_status4'] = Variable<int?>(hoursForStatus4.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnalyticsTimeTableCompanion(')
      ..write('id: $id, ')
      ..write('userRoleIdLocalDB: $userRoleIdLocalDB, ')
      ..write('month: $month, ')
      ..write('year: $year, ')
      ..write('hoursForStatus2: $hoursForStatus2, ')
      ..write('hoursForStatus3: $hoursForStatus3, ')
      ..write('hoursForStatus4: $hoursForStatus4')
      ..write(')'))
        .toString();
  }
}

class $AnalyticsTimeTableTable extends AnalyticsTimeTable
    with TableInfo<$AnalyticsTimeTableTable, AnalyticsTimeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnalyticsTimeTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userRoleIdLocalDBMeta =
  const VerificationMeta('userRoleIdLocalDB');
  @override
  late final GeneratedColumn<int?> userRoleIdLocalDB = GeneratedColumn<int?>(
      'user_role_id_local_d_b', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<String?> month = GeneratedColumn<String?>(
      'month', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String?> year = GeneratedColumn<String?>(
      'year', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _hoursForStatus2Meta =
  const VerificationMeta('hoursForStatus2');
  @override
  late final GeneratedColumn<int?> hoursForStatus2 = GeneratedColumn<int?>(
      'hours_for_status2', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _hoursForStatus3Meta =
  const VerificationMeta('hoursForStatus3');
  @override
  late final GeneratedColumn<int?> hoursForStatus3 = GeneratedColumn<int?>(
      'hours_for_status3', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _hoursForStatus4Meta =
  const VerificationMeta('hoursForStatus4');
  @override
  late final GeneratedColumn<int?> hoursForStatus4 = GeneratedColumn<int?>(
      'hours_for_status4', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userRoleIdLocalDB,
    month,
    year,
    hoursForStatus2,
    hoursForStatus3,
    hoursForStatus4
  ];
  @override
  String get aliasedName => _alias ?? 'analytics_time_table';
  @override
  String get actualTableName => 'analytics_time_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AnalyticsTimeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_role_id_local_d_b')) {
      context.handle(
          _userRoleIdLocalDBMeta,
          userRoleIdLocalDB.isAcceptableOrUnknown(
              data['user_role_id_local_d_b']!, _userRoleIdLocalDBMeta));
    } else if (isInserting) {
      context.missing(_userRoleIdLocalDBMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    }
    if (data.containsKey('hours_for_status2')) {
      context.handle(
          _hoursForStatus2Meta,
          hoursForStatus2.isAcceptableOrUnknown(
              data['hours_for_status2']!, _hoursForStatus2Meta));
    }
    if (data.containsKey('hours_for_status3')) {
      context.handle(
          _hoursForStatus3Meta,
          hoursForStatus3.isAcceptableOrUnknown(
              data['hours_for_status3']!, _hoursForStatus3Meta));
    }
    if (data.containsKey('hours_for_status4')) {
      context.handle(
          _hoursForStatus4Meta,
          hoursForStatus4.isAcceptableOrUnknown(
              data['hours_for_status4']!, _hoursForStatus4Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnalyticsTimeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AnalyticsTimeTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AnalyticsTimeTableTable createAlias(String alias) {
    return $AnalyticsTimeTableTable(attachedDatabase, alias);
  }
}

class AnalyticsWeekTableData extends DataClass
    implements Insertable<AnalyticsWeekTableData> {
  final int id;
  final int userRoleIdLocalDB;
  final String? month;
  final String? year;
  final int? week1TotalForStatus2;
  final int? week1TotalForStatus3;
  final int? week1TotalForStatus4;
  final int? week2TotalForStatus2;
  final int? week2TotalForStatus3;
  final int? week2TotalForStatus4;
  final int? week3TotalForStatus2;
  final int? week3TotalForStatus3;
  final int? week3TotalForStatus4;
  final int? week4TotalForStatus2;
  final int? week4TotalForStatus3;
  final int? week4TotalForStatus4;
  AnalyticsWeekTableData(
      {required this.id,
        required this.userRoleIdLocalDB,
        this.month,
        this.year,
        this.week1TotalForStatus2,
        this.week1TotalForStatus3,
        this.week1TotalForStatus4,
        this.week2TotalForStatus2,
        this.week2TotalForStatus3,
        this.week2TotalForStatus4,
        this.week3TotalForStatus2,
        this.week3TotalForStatus3,
        this.week3TotalForStatus4,
        this.week4TotalForStatus2,
        this.week4TotalForStatus3,
        this.week4TotalForStatus4});
  factory AnalyticsWeekTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AnalyticsWeekTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userRoleIdLocalDB: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}user_role_id_local_d_b'])!,
      month: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}month']),
      year: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}year']),
      week1TotalForStatus2: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week1_total_for_status2']),
      week1TotalForStatus3: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week1_total_for_status3']),
      week1TotalForStatus4: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week1_total_for_status4']),
      week2TotalForStatus2: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week2_total_for_status2']),
      week2TotalForStatus3: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week2_total_for_status3']),
      week2TotalForStatus4: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week2_total_for_status4']),
      week3TotalForStatus2: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week3_total_for_status2']),
      week3TotalForStatus3: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week3_total_for_status3']),
      week3TotalForStatus4: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week3_total_for_status4']),
      week4TotalForStatus2: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week4_total_for_status2']),
      week4TotalForStatus3: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week4_total_for_status3']),
      week4TotalForStatus4: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}week4_total_for_status4']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_role_id_local_d_b'] = Variable<int>(userRoleIdLocalDB);
    if (!nullToAbsent || month != null) {
      map['month'] = Variable<String?>(month);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<String?>(year);
    }
    if (!nullToAbsent || week1TotalForStatus2 != null) {
      map['week1_total_for_status2'] = Variable<int?>(week1TotalForStatus2);
    }
    if (!nullToAbsent || week1TotalForStatus3 != null) {
      map['week1_total_for_status3'] = Variable<int?>(week1TotalForStatus3);
    }
    if (!nullToAbsent || week1TotalForStatus4 != null) {
      map['week1_total_for_status4'] = Variable<int?>(week1TotalForStatus4);
    }
    if (!nullToAbsent || week2TotalForStatus2 != null) {
      map['week2_total_for_status2'] = Variable<int?>(week2TotalForStatus2);
    }
    if (!nullToAbsent || week2TotalForStatus3 != null) {
      map['week2_total_for_status3'] = Variable<int?>(week2TotalForStatus3);
    }
    if (!nullToAbsent || week2TotalForStatus4 != null) {
      map['week2_total_for_status4'] = Variable<int?>(week2TotalForStatus4);
    }
    if (!nullToAbsent || week3TotalForStatus2 != null) {
      map['week3_total_for_status2'] = Variable<int?>(week3TotalForStatus2);
    }
    if (!nullToAbsent || week3TotalForStatus3 != null) {
      map['week3_total_for_status3'] = Variable<int?>(week3TotalForStatus3);
    }
    if (!nullToAbsent || week3TotalForStatus4 != null) {
      map['week3_total_for_status4'] = Variable<int?>(week3TotalForStatus4);
    }
    if (!nullToAbsent || week4TotalForStatus2 != null) {
      map['week4_total_for_status2'] = Variable<int?>(week4TotalForStatus2);
    }
    if (!nullToAbsent || week4TotalForStatus3 != null) {
      map['week4_total_for_status3'] = Variable<int?>(week4TotalForStatus3);
    }
    if (!nullToAbsent || week4TotalForStatus4 != null) {
      map['week4_total_for_status4'] = Variable<int?>(week4TotalForStatus4);
    }
    return map;
  }

  AnalyticsWeekTableCompanion toCompanion(bool nullToAbsent) {
    return AnalyticsWeekTableCompanion(
      id: Value(id),
      userRoleIdLocalDB: Value(userRoleIdLocalDB),
      month:
      month == null && nullToAbsent ? const Value.absent() : Value(month),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      week1TotalForStatus2: week1TotalForStatus2 == null && nullToAbsent
          ? const Value.absent()
          : Value(week1TotalForStatus2),
      week1TotalForStatus3: week1TotalForStatus3 == null && nullToAbsent
          ? const Value.absent()
          : Value(week1TotalForStatus3),
      week1TotalForStatus4: week1TotalForStatus4 == null && nullToAbsent
          ? const Value.absent()
          : Value(week1TotalForStatus4),
      week2TotalForStatus2: week2TotalForStatus2 == null && nullToAbsent
          ? const Value.absent()
          : Value(week2TotalForStatus2),
      week2TotalForStatus3: week2TotalForStatus3 == null && nullToAbsent
          ? const Value.absent()
          : Value(week2TotalForStatus3),
      week2TotalForStatus4: week2TotalForStatus4 == null && nullToAbsent
          ? const Value.absent()
          : Value(week2TotalForStatus4),
      week3TotalForStatus2: week3TotalForStatus2 == null && nullToAbsent
          ? const Value.absent()
          : Value(week3TotalForStatus2),
      week3TotalForStatus3: week3TotalForStatus3 == null && nullToAbsent
          ? const Value.absent()
          : Value(week3TotalForStatus3),
      week3TotalForStatus4: week3TotalForStatus4 == null && nullToAbsent
          ? const Value.absent()
          : Value(week3TotalForStatus4),
      week4TotalForStatus2: week4TotalForStatus2 == null && nullToAbsent
          ? const Value.absent()
          : Value(week4TotalForStatus2),
      week4TotalForStatus3: week4TotalForStatus3 == null && nullToAbsent
          ? const Value.absent()
          : Value(week4TotalForStatus3),
      week4TotalForStatus4: week4TotalForStatus4 == null && nullToAbsent
          ? const Value.absent()
          : Value(week4TotalForStatus4),
    );
  }

  factory AnalyticsWeekTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnalyticsWeekTableData(
      id: serializer.fromJson<int>(json['id']),
      userRoleIdLocalDB: serializer.fromJson<int>(json['userRoleIdLocalDB']),
      month: serializer.fromJson<String?>(json['month']),
      year: serializer.fromJson<String?>(json['year']),
      week1TotalForStatus2:
      serializer.fromJson<int?>(json['week1TotalForStatus2']),
      week1TotalForStatus3:
      serializer.fromJson<int?>(json['week1TotalForStatus3']),
      week1TotalForStatus4:
      serializer.fromJson<int?>(json['week1TotalForStatus4']),
      week2TotalForStatus2:
      serializer.fromJson<int?>(json['week2TotalForStatus2']),
      week2TotalForStatus3:
      serializer.fromJson<int?>(json['week2TotalForStatus3']),
      week2TotalForStatus4:
      serializer.fromJson<int?>(json['week2TotalForStatus4']),
      week3TotalForStatus2:
      serializer.fromJson<int?>(json['week3TotalForStatus2']),
      week3TotalForStatus3:
      serializer.fromJson<int?>(json['week3TotalForStatus3']),
      week3TotalForStatus4:
      serializer.fromJson<int?>(json['week3TotalForStatus4']),
      week4TotalForStatus2:
      serializer.fromJson<int?>(json['week4TotalForStatus2']),
      week4TotalForStatus3:
      serializer.fromJson<int?>(json['week4TotalForStatus3']),
      week4TotalForStatus4:
      serializer.fromJson<int?>(json['week4TotalForStatus4']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userRoleIdLocalDB': serializer.toJson<int>(userRoleIdLocalDB),
      'month': serializer.toJson<String?>(month),
      'year': serializer.toJson<String?>(year),
      'week1TotalForStatus2': serializer.toJson<int?>(week1TotalForStatus2),
      'week1TotalForStatus3': serializer.toJson<int?>(week1TotalForStatus3),
      'week1TotalForStatus4': serializer.toJson<int?>(week1TotalForStatus4),
      'week2TotalForStatus2': serializer.toJson<int?>(week2TotalForStatus2),
      'week2TotalForStatus3': serializer.toJson<int?>(week2TotalForStatus3),
      'week2TotalForStatus4': serializer.toJson<int?>(week2TotalForStatus4),
      'week3TotalForStatus2': serializer.toJson<int?>(week3TotalForStatus2),
      'week3TotalForStatus3': serializer.toJson<int?>(week3TotalForStatus3),
      'week3TotalForStatus4': serializer.toJson<int?>(week3TotalForStatus4),
      'week4TotalForStatus2': serializer.toJson<int?>(week4TotalForStatus2),
      'week4TotalForStatus3': serializer.toJson<int?>(week4TotalForStatus3),
      'week4TotalForStatus4': serializer.toJson<int?>(week4TotalForStatus4),
    };
  }

  AnalyticsWeekTableData copyWith(
      {int? id,
        int? userRoleIdLocalDB,
        String? month,
        String? year,
        int? week1TotalForStatus2,
        int? week1TotalForStatus3,
        int? week1TotalForStatus4,
        int? week2TotalForStatus2,
        int? week2TotalForStatus3,
        int? week2TotalForStatus4,
        int? week3TotalForStatus2,
        int? week3TotalForStatus3,
        int? week3TotalForStatus4,
        int? week4TotalForStatus2,
        int? week4TotalForStatus3,
        int? week4TotalForStatus4}) =>
      AnalyticsWeekTableData(
        id: id ?? this.id,
        userRoleIdLocalDB: userRoleIdLocalDB ?? this.userRoleIdLocalDB,
        month: month ?? this.month,
        year: year ?? this.year,
        week1TotalForStatus2: week1TotalForStatus2 ?? this.week1TotalForStatus2,
        week1TotalForStatus3: week1TotalForStatus3 ?? this.week1TotalForStatus3,
        week1TotalForStatus4: week1TotalForStatus4 ?? this.week1TotalForStatus4,
        week2TotalForStatus2: week2TotalForStatus2 ?? this.week2TotalForStatus2,
        week2TotalForStatus3: week2TotalForStatus3 ?? this.week2TotalForStatus3,
        week2TotalForStatus4: week2TotalForStatus4 ?? this.week2TotalForStatus4,
        week3TotalForStatus2: week3TotalForStatus2 ?? this.week3TotalForStatus2,
        week3TotalForStatus3: week3TotalForStatus3 ?? this.week3TotalForStatus3,
        week3TotalForStatus4: week3TotalForStatus4 ?? this.week3TotalForStatus4,
        week4TotalForStatus2: week4TotalForStatus2 ?? this.week4TotalForStatus2,
        week4TotalForStatus3: week4TotalForStatus3 ?? this.week4TotalForStatus3,
        week4TotalForStatus4: week4TotalForStatus4 ?? this.week4TotalForStatus4,
      );
  @override
  String toString() {
    return (StringBuffer('AnalyticsWeekTableData(')
      ..write('id: $id, ')
      ..write('userRoleIdLocalDB: $userRoleIdLocalDB, ')
      ..write('month: $month, ')
      ..write('year: $year, ')
      ..write('week1TotalForStatus2: $week1TotalForStatus2, ')
      ..write('week1TotalForStatus3: $week1TotalForStatus3, ')
      ..write('week1TotalForStatus4: $week1TotalForStatus4, ')
      ..write('week2TotalForStatus2: $week2TotalForStatus2, ')
      ..write('week2TotalForStatus3: $week2TotalForStatus3, ')
      ..write('week2TotalForStatus4: $week2TotalForStatus4, ')
      ..write('week3TotalForStatus2: $week3TotalForStatus2, ')
      ..write('week3TotalForStatus3: $week3TotalForStatus3, ')
      ..write('week3TotalForStatus4: $week3TotalForStatus4, ')
      ..write('week4TotalForStatus2: $week4TotalForStatus2, ')
      ..write('week4TotalForStatus3: $week4TotalForStatus3, ')
      ..write('week4TotalForStatus4: $week4TotalForStatus4')
      ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userRoleIdLocalDB,
      month,
      year,
      week1TotalForStatus2,
      week1TotalForStatus3,
      week1TotalForStatus4,
      week2TotalForStatus2,
      week2TotalForStatus3,
      week2TotalForStatus4,
      week3TotalForStatus2,
      week3TotalForStatus3,
      week3TotalForStatus4,
      week4TotalForStatus2,
      week4TotalForStatus3,
      week4TotalForStatus4);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AnalyticsWeekTableData &&
              other.id == this.id &&
              other.userRoleIdLocalDB == this.userRoleIdLocalDB &&
              other.month == this.month &&
              other.year == this.year &&
              other.week1TotalForStatus2 == this.week1TotalForStatus2 &&
              other.week1TotalForStatus3 == this.week1TotalForStatus3 &&
              other.week1TotalForStatus4 == this.week1TotalForStatus4 &&
              other.week2TotalForStatus2 == this.week2TotalForStatus2 &&
              other.week2TotalForStatus3 == this.week2TotalForStatus3 &&
              other.week2TotalForStatus4 == this.week2TotalForStatus4 &&
              other.week3TotalForStatus2 == this.week3TotalForStatus2 &&
              other.week3TotalForStatus3 == this.week3TotalForStatus3 &&
              other.week3TotalForStatus4 == this.week3TotalForStatus4 &&
              other.week4TotalForStatus2 == this.week4TotalForStatus2 &&
              other.week4TotalForStatus3 == this.week4TotalForStatus3 &&
              other.week4TotalForStatus4 == this.week4TotalForStatus4);
}

class AnalyticsWeekTableCompanion
    extends UpdateCompanion<AnalyticsWeekTableData> {
  final Value<int> id;
  final Value<int> userRoleIdLocalDB;
  final Value<String?> month;
  final Value<String?> year;
  final Value<int?> week1TotalForStatus2;
  final Value<int?> week1TotalForStatus3;
  final Value<int?> week1TotalForStatus4;
  final Value<int?> week2TotalForStatus2;
  final Value<int?> week2TotalForStatus3;
  final Value<int?> week2TotalForStatus4;
  final Value<int?> week3TotalForStatus2;
  final Value<int?> week3TotalForStatus3;
  final Value<int?> week3TotalForStatus4;
  final Value<int?> week4TotalForStatus2;
  final Value<int?> week4TotalForStatus3;
  final Value<int?> week4TotalForStatus4;
  const AnalyticsWeekTableCompanion({
    this.id = const Value.absent(),
    this.userRoleIdLocalDB = const Value.absent(),
    this.month = const Value.absent(),
    this.year = const Value.absent(),
    this.week1TotalForStatus2 = const Value.absent(),
    this.week1TotalForStatus3 = const Value.absent(),
    this.week1TotalForStatus4 = const Value.absent(),
    this.week2TotalForStatus2 = const Value.absent(),
    this.week2TotalForStatus3 = const Value.absent(),
    this.week2TotalForStatus4 = const Value.absent(),
    this.week3TotalForStatus2 = const Value.absent(),
    this.week3TotalForStatus3 = const Value.absent(),
    this.week3TotalForStatus4 = const Value.absent(),
    this.week4TotalForStatus2 = const Value.absent(),
    this.week4TotalForStatus3 = const Value.absent(),
    this.week4TotalForStatus4 = const Value.absent(),
  });
  AnalyticsWeekTableCompanion.insert({
    this.id = const Value.absent(),
    required int userRoleIdLocalDB,
    this.month = const Value.absent(),
    this.year = const Value.absent(),
    this.week1TotalForStatus2 = const Value.absent(),
    this.week1TotalForStatus3 = const Value.absent(),
    this.week1TotalForStatus4 = const Value.absent(),
    this.week2TotalForStatus2 = const Value.absent(),
    this.week2TotalForStatus3 = const Value.absent(),
    this.week2TotalForStatus4 = const Value.absent(),
    this.week3TotalForStatus2 = const Value.absent(),
    this.week3TotalForStatus3 = const Value.absent(),
    this.week3TotalForStatus4 = const Value.absent(),
    this.week4TotalForStatus2 = const Value.absent(),
    this.week4TotalForStatus3 = const Value.absent(),
    this.week4TotalForStatus4 = const Value.absent(),
  }) : userRoleIdLocalDB = Value(userRoleIdLocalDB);
  static Insertable<AnalyticsWeekTableData> custom({
    Expression<int>? id,
    Expression<int>? userRoleIdLocalDB,
    Expression<String?>? month,
    Expression<String?>? year,
    Expression<int?>? week1TotalForStatus2,
    Expression<int?>? week1TotalForStatus3,
    Expression<int?>? week1TotalForStatus4,
    Expression<int?>? week2TotalForStatus2,
    Expression<int?>? week2TotalForStatus3,
    Expression<int?>? week2TotalForStatus4,
    Expression<int?>? week3TotalForStatus2,
    Expression<int?>? week3TotalForStatus3,
    Expression<int?>? week3TotalForStatus4,
    Expression<int?>? week4TotalForStatus2,
    Expression<int?>? week4TotalForStatus3,
    Expression<int?>? week4TotalForStatus4,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userRoleIdLocalDB != null)
        'user_role_id_local_d_b': userRoleIdLocalDB,
      if (month != null) 'month': month,
      if (year != null) 'year': year,
      if (week1TotalForStatus2 != null)
        'week1_total_for_status2': week1TotalForStatus2,
      if (week1TotalForStatus3 != null)
        'week1_total_for_status3': week1TotalForStatus3,
      if (week1TotalForStatus4 != null)
        'week1_total_for_status4': week1TotalForStatus4,
      if (week2TotalForStatus2 != null)
        'week2_total_for_status2': week2TotalForStatus2,
      if (week2TotalForStatus3 != null)
        'week2_total_for_status3': week2TotalForStatus3,
      if (week2TotalForStatus4 != null)
        'week2_total_for_status4': week2TotalForStatus4,
      if (week3TotalForStatus2 != null)
        'week3_total_for_status2': week3TotalForStatus2,
      if (week3TotalForStatus3 != null)
        'week3_total_for_status3': week3TotalForStatus3,
      if (week3TotalForStatus4 != null)
        'week3_total_for_status4': week3TotalForStatus4,
      if (week4TotalForStatus2 != null)
        'week4_total_for_status2': week4TotalForStatus2,
      if (week4TotalForStatus3 != null)
        'week4_total_for_status3': week4TotalForStatus3,
      if (week4TotalForStatus4 != null)
        'week4_total_for_status4': week4TotalForStatus4,
    });
  }

  AnalyticsWeekTableCompanion copyWith(
      {Value<int>? id,
        Value<int>? userRoleIdLocalDB,
        Value<String?>? month,
        Value<String?>? year,
        Value<int?>? week1TotalForStatus2,
        Value<int?>? week1TotalForStatus3,
        Value<int?>? week1TotalForStatus4,
        Value<int?>? week2TotalForStatus2,
        Value<int?>? week2TotalForStatus3,
        Value<int?>? week2TotalForStatus4,
        Value<int?>? week3TotalForStatus2,
        Value<int?>? week3TotalForStatus3,
        Value<int?>? week3TotalForStatus4,
        Value<int?>? week4TotalForStatus2,
        Value<int?>? week4TotalForStatus3,
        Value<int?>? week4TotalForStatus4}) {
    return AnalyticsWeekTableCompanion(
      id: id ?? this.id,
      userRoleIdLocalDB: userRoleIdLocalDB ?? this.userRoleIdLocalDB,
      month: month ?? this.month,
      year: year ?? this.year,
      week1TotalForStatus2: week1TotalForStatus2 ?? this.week1TotalForStatus2,
      week1TotalForStatus3: week1TotalForStatus3 ?? this.week1TotalForStatus3,
      week1TotalForStatus4: week1TotalForStatus4 ?? this.week1TotalForStatus4,
      week2TotalForStatus2: week2TotalForStatus2 ?? this.week2TotalForStatus2,
      week2TotalForStatus3: week2TotalForStatus3 ?? this.week2TotalForStatus3,
      week2TotalForStatus4: week2TotalForStatus4 ?? this.week2TotalForStatus4,
      week3TotalForStatus2: week3TotalForStatus2 ?? this.week3TotalForStatus2,
      week3TotalForStatus3: week3TotalForStatus3 ?? this.week3TotalForStatus3,
      week3TotalForStatus4: week3TotalForStatus4 ?? this.week3TotalForStatus4,
      week4TotalForStatus2: week4TotalForStatus2 ?? this.week4TotalForStatus2,
      week4TotalForStatus3: week4TotalForStatus3 ?? this.week4TotalForStatus3,
      week4TotalForStatus4: week4TotalForStatus4 ?? this.week4TotalForStatus4,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userRoleIdLocalDB.present) {
      map['user_role_id_local_d_b'] = Variable<int>(userRoleIdLocalDB.value);
    }
    if (month.present) {
      map['month'] = Variable<String?>(month.value);
    }
    if (year.present) {
      map['year'] = Variable<String?>(year.value);
    }
    if (week1TotalForStatus2.present) {
      map['week1_total_for_status2'] =
          Variable<int?>(week1TotalForStatus2.value);
    }
    if (week1TotalForStatus3.present) {
      map['week1_total_for_status3'] =
          Variable<int?>(week1TotalForStatus3.value);
    }
    if (week1TotalForStatus4.present) {
      map['week1_total_for_status4'] =
          Variable<int?>(week1TotalForStatus4.value);
    }
    if (week2TotalForStatus2.present) {
      map['week2_total_for_status2'] =
          Variable<int?>(week2TotalForStatus2.value);
    }
    if (week2TotalForStatus3.present) {
      map['week2_total_for_status3'] =
          Variable<int?>(week2TotalForStatus3.value);
    }
    if (week2TotalForStatus4.present) {
      map['week2_total_for_status4'] =
          Variable<int?>(week2TotalForStatus4.value);
    }
    if (week3TotalForStatus2.present) {
      map['week3_total_for_status2'] =
          Variable<int?>(week3TotalForStatus2.value);
    }
    if (week3TotalForStatus3.present) {
      map['week3_total_for_status3'] =
          Variable<int?>(week3TotalForStatus3.value);
    }
    if (week3TotalForStatus4.present) {
      map['week3_total_for_status4'] =
          Variable<int?>(week3TotalForStatus4.value);
    }
    if (week4TotalForStatus2.present) {
      map['week4_total_for_status2'] =
          Variable<int?>(week4TotalForStatus2.value);
    }
    if (week4TotalForStatus3.present) {
      map['week4_total_for_status3'] =
          Variable<int?>(week4TotalForStatus3.value);
    }
    if (week4TotalForStatus4.present) {
      map['week4_total_for_status4'] =
          Variable<int?>(week4TotalForStatus4.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnalyticsWeekTableCompanion(')
      ..write('id: $id, ')
      ..write('userRoleIdLocalDB: $userRoleIdLocalDB, ')
      ..write('month: $month, ')
      ..write('year: $year, ')
      ..write('week1TotalForStatus2: $week1TotalForStatus2, ')
      ..write('week1TotalForStatus3: $week1TotalForStatus3, ')
      ..write('week1TotalForStatus4: $week1TotalForStatus4, ')
      ..write('week2TotalForStatus2: $week2TotalForStatus2, ')
      ..write('week2TotalForStatus3: $week2TotalForStatus3, ')
      ..write('week2TotalForStatus4: $week2TotalForStatus4, ')
      ..write('week3TotalForStatus2: $week3TotalForStatus2, ')
      ..write('week3TotalForStatus3: $week3TotalForStatus3, ')
      ..write('week3TotalForStatus4: $week3TotalForStatus4, ')
      ..write('week4TotalForStatus2: $week4TotalForStatus2, ')
      ..write('week4TotalForStatus3: $week4TotalForStatus3, ')
      ..write('week4TotalForStatus4: $week4TotalForStatus4')
      ..write(')'))
        .toString();
  }
}

class $AnalyticsWeekTableTable extends AnalyticsWeekTable
    with TableInfo<$AnalyticsWeekTableTable, AnalyticsWeekTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnalyticsWeekTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userRoleIdLocalDBMeta =
  const VerificationMeta('userRoleIdLocalDB');
  @override
  late final GeneratedColumn<int?> userRoleIdLocalDB = GeneratedColumn<int?>(
      'user_role_id_local_d_b', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<String?> month = GeneratedColumn<String?>(
      'month', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String?> year = GeneratedColumn<String?>(
      'year', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _week1TotalForStatus2Meta =
  const VerificationMeta('week1TotalForStatus2');
  @override
  late final GeneratedColumn<int?> week1TotalForStatus2 = GeneratedColumn<int?>(
      'week1_total_for_status2', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week1TotalForStatus3Meta =
  const VerificationMeta('week1TotalForStatus3');
  @override
  late final GeneratedColumn<int?> week1TotalForStatus3 = GeneratedColumn<int?>(
      'week1_total_for_status3', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week1TotalForStatus4Meta =
  const VerificationMeta('week1TotalForStatus4');
  @override
  late final GeneratedColumn<int?> week1TotalForStatus4 = GeneratedColumn<int?>(
      'week1_total_for_status4', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week2TotalForStatus2Meta =
  const VerificationMeta('week2TotalForStatus2');
  @override
  late final GeneratedColumn<int?> week2TotalForStatus2 = GeneratedColumn<int?>(
      'week2_total_for_status2', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week2TotalForStatus3Meta =
  const VerificationMeta('week2TotalForStatus3');
  @override
  late final GeneratedColumn<int?> week2TotalForStatus3 = GeneratedColumn<int?>(
      'week2_total_for_status3', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week2TotalForStatus4Meta =
  const VerificationMeta('week2TotalForStatus4');
  @override
  late final GeneratedColumn<int?> week2TotalForStatus4 = GeneratedColumn<int?>(
      'week2_total_for_status4', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week3TotalForStatus2Meta =
  const VerificationMeta('week3TotalForStatus2');
  @override
  late final GeneratedColumn<int?> week3TotalForStatus2 = GeneratedColumn<int?>(
      'week3_total_for_status2', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week3TotalForStatus3Meta =
  const VerificationMeta('week3TotalForStatus3');
  @override
  late final GeneratedColumn<int?> week3TotalForStatus3 = GeneratedColumn<int?>(
      'week3_total_for_status3', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week3TotalForStatus4Meta =
  const VerificationMeta('week3TotalForStatus4');
  @override
  late final GeneratedColumn<int?> week3TotalForStatus4 = GeneratedColumn<int?>(
      'week3_total_for_status4', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week4TotalForStatus2Meta =
  const VerificationMeta('week4TotalForStatus2');
  @override
  late final GeneratedColumn<int?> week4TotalForStatus2 = GeneratedColumn<int?>(
      'week4_total_for_status2', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week4TotalForStatus3Meta =
  const VerificationMeta('week4TotalForStatus3');
  @override
  late final GeneratedColumn<int?> week4TotalForStatus3 = GeneratedColumn<int?>(
      'week4_total_for_status3', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _week4TotalForStatus4Meta =
  const VerificationMeta('week4TotalForStatus4');
  @override
  late final GeneratedColumn<int?> week4TotalForStatus4 = GeneratedColumn<int?>(
      'week4_total_for_status4', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userRoleIdLocalDB,
    month,
    year,
    week1TotalForStatus2,
    week1TotalForStatus3,
    week1TotalForStatus4,
    week2TotalForStatus2,
    week2TotalForStatus3,
    week2TotalForStatus4,
    week3TotalForStatus2,
    week3TotalForStatus3,
    week3TotalForStatus4,
    week4TotalForStatus2,
    week4TotalForStatus3,
    week4TotalForStatus4
  ];
  @override
  String get aliasedName => _alias ?? 'analytics_week_table';
  @override
  String get actualTableName => 'analytics_week_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AnalyticsWeekTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_role_id_local_d_b')) {
      context.handle(
          _userRoleIdLocalDBMeta,
          userRoleIdLocalDB.isAcceptableOrUnknown(
              data['user_role_id_local_d_b']!, _userRoleIdLocalDBMeta));
    } else if (isInserting) {
      context.missing(_userRoleIdLocalDBMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    }
    if (data.containsKey('week1_total_for_status2')) {
      context.handle(
          _week1TotalForStatus2Meta,
          week1TotalForStatus2.isAcceptableOrUnknown(
              data['week1_total_for_status2']!, _week1TotalForStatus2Meta));
    }
    if (data.containsKey('week1_total_for_status3')) {
      context.handle(
          _week1TotalForStatus3Meta,
          week1TotalForStatus3.isAcceptableOrUnknown(
              data['week1_total_for_status3']!, _week1TotalForStatus3Meta));
    }
    if (data.containsKey('week1_total_for_status4')) {
      context.handle(
          _week1TotalForStatus4Meta,
          week1TotalForStatus4.isAcceptableOrUnknown(
              data['week1_total_for_status4']!, _week1TotalForStatus4Meta));
    }
    if (data.containsKey('week2_total_for_status2')) {
      context.handle(
          _week2TotalForStatus2Meta,
          week2TotalForStatus2.isAcceptableOrUnknown(
              data['week2_total_for_status2']!, _week2TotalForStatus2Meta));
    }
    if (data.containsKey('week2_total_for_status3')) {
      context.handle(
          _week2TotalForStatus3Meta,
          week2TotalForStatus3.isAcceptableOrUnknown(
              data['week2_total_for_status3']!, _week2TotalForStatus3Meta));
    }
    if (data.containsKey('week2_total_for_status4')) {
      context.handle(
          _week2TotalForStatus4Meta,
          week2TotalForStatus4.isAcceptableOrUnknown(
              data['week2_total_for_status4']!, _week2TotalForStatus4Meta));
    }
    if (data.containsKey('week3_total_for_status2')) {
      context.handle(
          _week3TotalForStatus2Meta,
          week3TotalForStatus2.isAcceptableOrUnknown(
              data['week3_total_for_status2']!, _week3TotalForStatus2Meta));
    }
    if (data.containsKey('week3_total_for_status3')) {
      context.handle(
          _week3TotalForStatus3Meta,
          week3TotalForStatus3.isAcceptableOrUnknown(
              data['week3_total_for_status3']!, _week3TotalForStatus3Meta));
    }
    if (data.containsKey('week3_total_for_status4')) {
      context.handle(
          _week3TotalForStatus4Meta,
          week3TotalForStatus4.isAcceptableOrUnknown(
              data['week3_total_for_status4']!, _week3TotalForStatus4Meta));
    }
    if (data.containsKey('week4_total_for_status2')) {
      context.handle(
          _week4TotalForStatus2Meta,
          week4TotalForStatus2.isAcceptableOrUnknown(
              data['week4_total_for_status2']!, _week4TotalForStatus2Meta));
    }
    if (data.containsKey('week4_total_for_status3')) {
      context.handle(
          _week4TotalForStatus3Meta,
          week4TotalForStatus3.isAcceptableOrUnknown(
              data['week4_total_for_status3']!, _week4TotalForStatus3Meta));
    }
    if (data.containsKey('week4_total_for_status4')) {
      context.handle(
          _week4TotalForStatus4Meta,
          week4TotalForStatus4.isAcceptableOrUnknown(
              data['week4_total_for_status4']!, _week4TotalForStatus4Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnalyticsWeekTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AnalyticsWeekTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AnalyticsWeekTableTable createAlias(String alias) {
    return $AnalyticsWeekTableTable(attachedDatabase, alias);
  }
}

abstract class _$InterventionDetailsDatabase extends GeneratedDatabase {
  _$InterventionDetailsDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $InterventionDetailsTableTable interventionDetailsTable =
  $InterventionDetailsTableTable(this);
  late final $RCInterventionDetailsTableTable rCInterventionDetailsTable =
  $RCInterventionDetailsTableTable(this);
  late final $AnalyticsTimeTableTable analyticsTimeTable =
  $AnalyticsTimeTableTable(this);
  late final $AnalyticsWeekTableTable analyticsWeekTable =
  $AnalyticsWeekTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    interventionDetailsTable,
    rCInterventionDetailsTable,
    analyticsTimeTable,
    analyticsWeekTable
  ];
}