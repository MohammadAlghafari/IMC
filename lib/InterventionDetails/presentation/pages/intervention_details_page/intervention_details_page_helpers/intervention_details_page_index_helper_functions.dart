
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_details_utils.dart';

class InterventionDetailsHelperFunctions {
  /// [saveInterventionDetailsInBloc] function is common for all intervention details pages it will insert the data into intervention bloc
  static void saveInterventionDetailsInBloc(BuildContext context, InterventionDetailsModel interventionDetails) {
    var _bloc = BlocProvider.of<InterventionDetailsCubit>(context);
    _bloc.saveInterventionDetailsInBloc(interventionDetails);
  }

  /// [disableButton] function will disable the next button until all the fields of the particular intervention page are filled
  static bool disableButton(int selectedPage, InterventionDetailsModel interventionDetails) {
    switch (selectedPage) {
      case InterventionDetailsUtils.searchingPagePageId:
        {
          if (interventionDetails.localMeterImage == null ||
              interventionDetails.meterNumberImage == null ||
              interventionDetails.countingPanelImage == null ||
              interventionDetails.confirmPpePorts == null ||
              interventionDetails.confirmMacronsInstallation == null ||
              interventionDetails.confirmTop == null ||
              interventionDetails.canYouGetStartedToday == null ||
              interventionDetails.presenceOfPnt == null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.circuitBreakerPageId:
        {
          if (interventionDetails.circuitBreakerBrand == null ||
              interventionDetails.month == null ||
              interventionDetails.year == null ||
              interventionDetails.serialNumberScanImage == null ||
              interventionDetails.sizeControlImage == null ||
              interventionDetails.testOfVat == null ||
              interventionDetails.settingsAnomaly == null ||
              interventionDetails.circuitBreakerMalfuncttion == null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.MeterReadingPageId:
        {
          if (interventionDetails.meterRate == null ||
              interventionDetails.fullTimeRate == null ||
              interventionDetails.fullTimeRate!.isEmpty ||
              interventionDetails.offPeakTime == null ||
              interventionDetails.offPeakTime!.isEmpty ||
              interventionDetails.photoOfIndexImage == null ||
              (interventionDetails.photoOfIndexImage != null &&  interventionDetails.photoOfIndexImage!.isNotEmpty && interventionDetails.photoOfIndexImage!.first == "") ||
              (interventionDetails.photoOfIndexImage != null && interventionDetails.photoOfIndexImage!.length < 1) ||
              (interventionDetails.photoOfIndexImage != null && interventionDetails.photoOfIndexImage!.contains("") == true)
          ) {

            return true;
          }
          break;
        }
      case InterventionDetailsUtils.PhasePositionPageId:
        {
          if (interventionDetails.positionOfPhaseConductorImage == null ||
              interventionDetails.isTheDriverWellPositioned == null ||
              (interventionDetails.isTheDriverWellPositioned == false &&
                  (interventionDetails.reasonFOrDriverNotWellPositioned == "" || interventionDetails.reasonFOrDriverNotWellPositioned == null))) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.InstallationPolicyPageId:
        {
          if (interventionDetails.beforeCcpiLoggingImage1 == null ||
              interventionDetails.beforeCcpiLoggingImage2 == null ||
              interventionDetails.afterCcpiLoggingImage1 == null ||
              interventionDetails.afterCcpiLoggingImage2 == null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.MeterDepositPageId:
        {
          if (interventionDetails.identificationBetweenPhaseAndNeutral == null ||
              interventionDetails.oldMeterImage == null ||
              interventionDetails.terminalBlockTightenedPowerImage == null ||
              interventionDetails.terminalCoverPutBackInPlaceImage == null ||
              interventionDetails.oldMeterDepositedImage == null ||
              interventionDetails.electricalEquipmentDepositedImage == null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.MeterInstallationPageId:
        {
          if (interventionDetails.enterAdditionallyMaterial == null ||
              (interventionDetails.enterAdditionallyMaterial != null && interventionDetails.enterAdditionallyMaterial!.isNotEmpty && interventionDetails.enterAdditionallyMaterial!.first == "") ||
              (interventionDetails.enterAdditionallyMaterial != null && interventionDetails.enterAdditionallyMaterial!.length < 1) ||
              (interventionDetails.enterAdditionallyMaterial != null && interventionDetails.enterAdditionallyMaterial!.contains("") == true) ||
              interventionDetails.inversionBetweenPhaseAndMaterial == null ||
              interventionDetails.resumptionOfEnslavement == null ||
              interventionDetails.ictCabling == null ||
              interventionDetails.photoOfWiringImage == null ||
              interventionDetails.photosOfNewMeterInstalled == null ||
              (interventionDetails.photosOfNewMeterInstalled != null && interventionDetails.photosOfNewMeterInstalled!.isNotEmpty && interventionDetails.photosOfNewMeterInstalled!.first == "") ||
              (interventionDetails.photosOfNewMeterInstalled != null && interventionDetails.photosOfNewMeterInstalled!.length < 1) ||
              (interventionDetails.photosOfNewMeterInstalled != null && interventionDetails.photosOfNewMeterInstalled!.contains("") == true)) {

            return true;
          }
          break;
        }
      case InterventionDetailsUtils.CircuitBreakerReplacementPageId:
        {
          if (interventionDetails.hasTheCircuitBreakerBeenReplaced == null ||
              (interventionDetails.hasTheCircuitBreakerBeenReplaced == false &&
                  (interventionDetails.resonForCircuitBreakerNonReplacement == null ||
                      interventionDetails.resonForCircuitBreakerNonReplacement == ""))) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.CircuitBreakerSettingsPageId:
        {
          if (interventionDetails.circuitBreakerLead == null ||
              interventionDetails.leadCCPI == null ||
              interventionDetails.circuitBreakerGuageImage == null ||
              interventionDetails.modifiedCircuitBreakerCapacity == null ||
              (interventionDetails.modifiedCircuitBreakerCapacity == true &&
                  (interventionDetails.calibratedPower == "" || interventionDetails.calibratedPower == null)) ||
              (interventionDetails.modifiedCircuitBreakerCapacity == false &&
                  (interventionDetails.reasonForNonModifiedCircuitBreakerCapacity == "" ||
                      interventionDetails.reasonForNonModifiedCircuitBreakerCapacity == null)) ||
              (interventionDetails.leadCCPI == false &&
                  (interventionDetails.indicateReasonForCircuitBreakerSettings == "" ||
                      interventionDetails.indicateReasonForCircuitBreakerSettings == null)) ||
              (interventionDetails.circuitBreakerLead == false &&
                  (interventionDetails.reasonForNoncircuitBreakerLead == "" || interventionDetails.reasonForNoncircuitBreakerLead == null))) {
            return true;
          }
          break;
        }

      case InterventionDetailsUtils.ProgrammingPageId:
        {
          if (interventionDetails.statusOfInstalledMeter == null ||
              (interventionDetails.statusOfInstalledMeter == false &&
                  (interventionDetails.enterTheAnomalyProgramming == null ||
                      interventionDetails.enterTheAnomalyProgramming == "" ||
                      interventionDetails.serialNumber == null ||
                      (interventionDetails.serialNumber != null && interventionDetails.serialNumber!.isEmpty) ||
                      interventionDetails.meterAnomalyImage == null ||
                      interventionDetails.meterAnomalyImage == null ||
                      interventionDetails.additionalInformationProgramming == null ||
                      interventionDetails.additionalInformationProgramming == ""))) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.CircuitBreakerInterlockPageId:
        {
          if (interventionDetails.circuitBreakerProperlyEngaged == null ||
              interventionDetails.additionalInformationCircuitBreakerInterlock == null ||
              interventionDetails.additionalInformationCircuitBreakerInterlock == ""
          //TODO - NOT PROVIDED BY CLIENT : uncomment after dynaimc value for (enterTheAnomalyCircuitBreakerInterlock)is provided by the client
          // ||
          // (interventionDetails.circuitBreakerProperlyEngaged == false &&
          //     (interventionDetails.enterTheAnomalyCircuitBreakerInterlock == null ||
          //         interventionDetails.enterTheAnomalyCircuitBreakerInterlock == ""))
          ) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.CustomerFeedbackPageId:
        {
          if (interventionDetails.customerFeedbackComment == null ||
              (interventionDetails.customerFeedbackComment != null && interventionDetails.customerFeedbackComment!.isEmpty) ||
              interventionDetails.customerSignAdded != true) {
            return true;
          }
        }
    }

    return false;
  }

  ///[saveDataIntoDatabase]function to save the intervention details of current selectedPaged page locally
  static void saveDataIntoDatabase(BuildContext context, {required int selectedPage, required InterventionDetailsModel interventionDetails}) {
    final _interventionDetailsDatabase = GetIt.I<InterventionDetailsDatabase>();

    switch (selectedPage) {
      case InterventionDetailsUtils.searchingPagePageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            canYouGetStartedToday: interventionDetails.canYouGetStartedToday,
            presenceOfPnt: interventionDetails.presenceOfPnt,
            localMeterImage: interventionDetails.localMeterImage,
            latitude: interventionDetails.latitude,
            longitude: interventionDetails.longitude,
            meterNumberImage: interventionDetails.meterNumberImage,
            countingPanelImage: interventionDetails.countingPanelImage,
            confirmPpePorts: interventionDetails.confirmPpePorts,
            confirmMacronsInstallation: interventionDetails.confirmMacronsInstallation,
            confirmTop: interventionDetails.confirmTop,
          ));

          break;
        }
      case InterventionDetailsUtils.circuitBreakerPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            circuitBreakerBrand: interventionDetails.circuitBreakerBrand,
            month: interventionDetails.month,
            year: interventionDetails.year,
            serialNumberScanImage: interventionDetails.serialNumberScanImage,
            sizeControlImage: interventionDetails.sizeControlImage,
            testOfVat: interventionDetails.testOfVat,
            settingsAnomaly: interventionDetails.settingsAnomaly,
            circuitBreakerMalfuncttion: interventionDetails.circuitBreakerMalfuncttion,
          ));
          break;
        }
      case InterventionDetailsUtils.MeterReadingPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            meterRate: interventionDetails.meterRate,
            fullTimeRate: interventionDetails.fullTimeRate,
            offPeakTime: interventionDetails.offPeakTime,
            photoOfIndexImage: interventionDetails.photoOfIndexImage,
          ));

          break;
        }
      case InterventionDetailsUtils.PhasePositionPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            positionOfPhaseConductorImage: interventionDetails.positionOfPhaseConductorImage,
            isTheDriverWellPositioned: interventionDetails.isTheDriverWellPositioned,
            reasonFOrDriverNotWellPositioned: interventionDetails.reasonFOrDriverNotWellPositioned,
          ));

          break;
        }
      case InterventionDetailsUtils.InstallationPolicyPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            beforeCcpiLoggingImage1: interventionDetails.beforeCcpiLoggingImage1,
            beforeCcpiLoggingImage2: interventionDetails.beforeCcpiLoggingImage2,
            afterCcpiLoggingImage1: interventionDetails.afterCcpiLoggingImage1,
            afterCcpiLoggingImage2: interventionDetails.afterCcpiLoggingImage2,
          ));
          break;
        }
      case InterventionDetailsUtils.MeterDepositPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            identificationBetweenPhaseAndNeutral: interventionDetails.identificationBetweenPhaseAndNeutral,
            oldMeterImage: interventionDetails.oldMeterImage,
            terminalBlockTightenedPowerImage: interventionDetails.terminalBlockTightenedPowerImage,
            terminalCoverPutBackInPlaceImage: interventionDetails.terminalCoverPutBackInPlaceImage,
            oldMeterDepositedImage: interventionDetails.oldMeterDepositedImage,
            electricalEquipmentDepositedImage: interventionDetails.electricalEquipmentDepositedImage,
          ));
          break;
        }
      case InterventionDetailsUtils.MeterInstallationPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            enterAdditionallyMaterial: interventionDetails.enterAdditionallyMaterial,
            inversionBetweenPhaseAndMaterial: interventionDetails.inversionBetweenPhaseAndMaterial,
            resumptionOfEnslavement: interventionDetails.resumptionOfEnslavement,
            ictCabling: interventionDetails.ictCabling,
            photoOfWiringImage: interventionDetails.photoOfWiringImage,
            photosOfNewMeterInstalled: interventionDetails.photosOfNewMeterInstalled,
          ));
          break;
        }
      case InterventionDetailsUtils.CircuitBreakerReplacementPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            hasTheCircuitBreakerBeenReplaced: interventionDetails.hasTheCircuitBreakerBeenReplaced,
            resonForCircuitBreakerNonReplacement: interventionDetails.resonForCircuitBreakerNonReplacement,
          ));
          break;
        }
      case InterventionDetailsUtils.CircuitBreakerSettingsPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            circuitBreakerLead: interventionDetails.circuitBreakerLead,
            leadCCPI: interventionDetails.leadCCPI,
            circuitBreakerGuageImage: interventionDetails.circuitBreakerGuageImage,
            modifiedCircuitBreakerCapacity: interventionDetails.modifiedCircuitBreakerCapacity,
            calibratedPower: interventionDetails.calibratedPower,
            reasonForNonModifiedCircuitBreakerCapacity: interventionDetails.reasonForNonModifiedCircuitBreakerCapacity,
            indicateReasonForCircuitBreakerSettings: interventionDetails.indicateReasonForCircuitBreakerSettings,
            reasonForNoncircuitBreakerLead: interventionDetails.reasonForNoncircuitBreakerLead,
          ));
        }
        break;
      case InterventionDetailsUtils.ProgrammingPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
              id: interventionDetails.id,
              statusOfInstalledMeter: interventionDetails.statusOfInstalledMeter,
              enterTheAnomalyProgramming: interventionDetails.enterTheAnomalyProgramming,
              serialNumber: interventionDetails.serialNumber,
              meterAnomalyImage: interventionDetails.meterAnomalyImage,
              additionalInformationProgramming: interventionDetails.additionalInformationProgramming));
        }
        break;
      case InterventionDetailsUtils.CircuitBreakerInterlockPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            circuitBreakerProperlyEngaged: interventionDetails.circuitBreakerProperlyEngaged,
            additionalInformationCircuitBreakerInterlock: interventionDetails.additionalInformationCircuitBreakerInterlock,
            enterTheAnomalyCircuitBreakerInterlock: interventionDetails.enterTheAnomalyCircuitBreakerInterlock,
          ));
        }
        break;
      case InterventionDetailsUtils.CustomerFeedbackPageId:
        {
          _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
            id: interventionDetails.id,
            startTimeOfIntervention: interventionDetails.startTimeOfIntervention,
            endTimeOfIntervention: interventionDetails.endTimeOfIntervention,
            customerFeedbackComment: interventionDetails.customerFeedbackComment,
            customerSignatureImage: interventionDetails.customerSignatureImage,
          ));
        }
    }
  }
}