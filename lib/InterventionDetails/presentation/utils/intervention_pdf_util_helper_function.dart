import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_details_utils.dart';
// import 'package:get/get.dart';

class InterventionPdfUtilHelperFunction {
  ///Function is used to check for each intervention page for all values(filled or not).
  static bool isSinglePageValueFilled(int selectedPage, InterventionDetailsModel interventionDetails) {
    switch (selectedPage) {
      case InterventionDetailsUtils.searchingPagePageId:
        {
          if (interventionDetails.localMeterImage != null ||
              interventionDetails.meterNumberImage != null ||
              interventionDetails.countingPanelImage != null ||
              interventionDetails.confirmPpePorts != null ||
              interventionDetails.confirmMacronsInstallation != null ||
              interventionDetails.confirmTop != null ||
              interventionDetails.canYouGetStartedToday != null ||
              interventionDetails.presenceOfPnt != null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.circuitBreakerPageId:
        {
          if (interventionDetails.circuitBreakerBrand != null ||
              interventionDetails.month != null ||
              interventionDetails.year != null ||
              interventionDetails.serialNumberScanImage != null ||
              interventionDetails.sizeControlImage != null ||
              interventionDetails.testOfVat != null ||
              interventionDetails.settingsAnomaly != null ||
              interventionDetails.circuitBreakerMalfuncttion != null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.MeterReadingPageId:
        {
          if (interventionDetails.meterRate != null ||
              interventionDetails.fullTimeRate != null ||
              interventionDetails.offPeakTime != null ||
              (interventionDetails.photoOfIndexImage != null && interventionDetails.photoOfIndexImage?.contains("") == false)) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.PhasePositionPageId:
        {
          if (interventionDetails.positionOfPhaseConductorImage != null || interventionDetails.isTheDriverWellPositioned != null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.InstallationPolicyPageId:
        {
          if (interventionDetails.beforeCcpiLoggingImage1 != null ||
              interventionDetails.beforeCcpiLoggingImage2 != null ||
              interventionDetails.afterCcpiLoggingImage1 != null ||
              interventionDetails.afterCcpiLoggingImage2 != null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.MeterDepositPageId:
        {
          if (interventionDetails.identificationBetweenPhaseAndNeutral != null ||
              interventionDetails.oldMeterImage != null ||
              interventionDetails.terminalBlockTightenedPowerImage != null ||
              interventionDetails.terminalCoverPutBackInPlaceImage != null ||
              interventionDetails.oldMeterDepositedImage != null ||
              interventionDetails.electricalEquipmentDepositedImage != null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.MeterInstallationPageId:
        {
          if ((interventionDetails.enterAdditionallyMaterial != null && (interventionDetails.enterAdditionallyMaterial?.contains("")==false)) ||
              interventionDetails.inversionBetweenPhaseAndMaterial != null ||
              interventionDetails.resumptionOfEnslavement != null ||
              interventionDetails.ictCabling != null ||
              interventionDetails.photoOfWiringImage != null ||
              (interventionDetails.photosOfNewMeterInstalled != null && (interventionDetails.photosOfNewMeterInstalled?.contains("")==false))) {

            return true;
          }
          break;
        }
      case InterventionDetailsUtils.CircuitBreakerReplacementPageId:
        {
          if (interventionDetails.hasTheCircuitBreakerBeenReplaced != null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.CircuitBreakerSettingsPageId:
        {
          if (interventionDetails.circuitBreakerLead != null ||
              interventionDetails.leadCCPI != null ||
              interventionDetails.circuitBreakerGuageImage != null ||
              interventionDetails.modifiedCircuitBreakerCapacity != null) {
            return true;
          }
          break;
        }

      case InterventionDetailsUtils.ProgrammingPageId:
        {
          if (interventionDetails.statusOfInstalledMeter != null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.CircuitBreakerInterlockPageId:
        {
          if (interventionDetails.circuitBreakerProperlyEngaged != null || interventionDetails.additionalInformationCircuitBreakerInterlock != null) {
            return true;
          }
          break;
        }
      case InterventionDetailsUtils.CustomerFeedbackPageId:
        {
          if (interventionDetails.customerFeedbackComment != null || interventionDetails.customerSignatureImage != null) {
            return true;
          }
        }
    }

    return false;
  }
}