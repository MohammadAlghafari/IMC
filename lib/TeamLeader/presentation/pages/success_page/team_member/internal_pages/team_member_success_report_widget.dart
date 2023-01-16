import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/widgets/rc_custom_listTile_large.dart';
import 'package:imc/InterventionDetails/presentation/widgets/custom_details_list_tile.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecordModel;

class TeamMemberSuccessReportWidget extends StatelessWidget {
  const TeamMemberSuccessReportWidget({Key? key, required this.teamMemberinterventionRecord}) : super(key: key);
  final teamMemberInterventionRecordModel.Records teamMemberinterventionRecord;//todo:check if correct model values is passed after new 'team leader intervention record' model

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    teamMemberInterventionRecordModel.Details? interventionDetails = teamMemberinterventionRecord.details;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30),
            if(teamMemberinterventionRecord.scheduleStart!=null)CustomDetailsListTile(title: "Schedule start time", description: "${teamMemberinterventionRecord.scheduleStart?.substring(11, 19)}"),
            if(teamMemberinterventionRecord.scheduleEnd!=null)CustomDetailsListTile(title: "Schedule end time", description: "${teamMemberinterventionRecord.scheduleEnd?.substring(11, 19)}"),
            if(teamMemberinterventionRecord.startDate!=null) CustomDetailsListTile(title: "Intervention start time", description: "${teamMemberinterventionRecord.startDate?.substring(11, 19)}"),
            if(teamMemberinterventionRecord.endDate!=null) CustomDetailsListTile(title: "Intervention end time", description: "${teamMemberinterventionRecord.endDate?.substring(11, 19)}"),
            if(teamMemberinterventionRecord.diffHours!=null) CustomDetailsListTile(title: "Diff hours", description: "${teamMemberinterventionRecord.diffHours}"),
            if(teamMemberinterventionRecord.latitude!=null) CustomDetailsListTile(title: "Latitude", description: "${teamMemberinterventionRecord.latitude}"),
            if(teamMemberinterventionRecord.longitude!=null) CustomDetailsListTile(title: "Longitude", description: "${teamMemberinterventionRecord.longitude}"),

            // SEARCHING PAGE
            SizedBox(height: 0.03.sh),
            AppBoldText(appLocalizations.translate("searching_internal_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.canYouGetStartedToday != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("can_you_get_started_safely"), description: "${interventionDetails?.canYouGetStartedToday}"),
            if (interventionDetails?.presenceOfPnt != null)
              CustomDetailsListTile(title: appLocalizations.translate("presence_of_pnt"), description: "${interventionDetails?.presenceOfPnt}"),
            if (interventionDetails?.confirmPpePorts != null)
              CustomDetailsListTile(title: appLocalizations.translate("confirm_ppe_ports"), description: "${interventionDetails?.confirmPpePorts}"),
            if (interventionDetails?.confirmMacronsInstallation != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("confirm_installation_of_macarons"),
                  description: "${interventionDetails?.confirmMacronsInstallation}"),
            if (interventionDetails?.confirmTop != null)
              CustomDetailsListTile(title: appLocalizations.translate("confirm_top"), description: "${interventionDetails?.confirmTop}"),

            SizedBox(height: 0.03.sh),
            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // CIRCUIT BREAKER
            AppBoldText(appLocalizations.translate("circuit_breaker_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.circuitBreakerBrand != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("circuit_breaker_brand"), description: "${interventionDetails?.circuitBreakerBrand}"),
            if (interventionDetails?.month != null)
              CustomDetailsListTile(title: appLocalizations.translate("month"), description: "${interventionDetails?.month}"),
            if (interventionDetails?.year != null)
              CustomDetailsListTile(title: appLocalizations.translate("year"), description: "${interventionDetails?.year}"),

            if (interventionDetails?.testOfVat != null)
              RCCustomListTileLarge(
                  title: appLocalizations.translate("test_of_vat_of_circuit_breaker"), description: "${interventionDetails?.testOfVat}"),
            if (interventionDetails?.settingsAnomaly != null)
              CustomDetailsListTile(title: appLocalizations.translate("setting_anomaly"), description: "${interventionDetails?.settingsAnomaly}"),
            if (interventionDetails?.circuitBreakerMalfuncttion != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("circuit_breaker_malfunction"), description: "${interventionDetails?.circuitBreakerMalfuncttion}"),

            SizedBox(height: 0.03.sh),
            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // METER READING
            AppBoldText(appLocalizations.translate("meter_reading_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.meterRate != null)
              CustomDetailsListTile(title: appLocalizations.translate("meter_rate"), description: "${interventionDetails?.meterRate}"),
            if (interventionDetails?.fullTimeRate != null)
              CustomDetailsListTile(title: appLocalizations.translate("consumption_full_time"), description: "${interventionDetails?.fullTimeRate}"),
            if (interventionDetails?.offPeakTime != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("consumption_off_peak_time"), description: "${interventionDetails?.offPeakTime}"),
            SizedBox(height: 0.02.sh),

            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // Phase Position
            AppBoldText(appLocalizations.translate("phase_position_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.isTheDriverWellPositioned != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("is_the_driver_well_positioned"),
                  description: "${interventionDetails?.isTheDriverWellPositioned}"),
            //TODO:some intervention values are missing from the api response
            // if (interventionDetails.isTheDriverWellPositioned == false)
            //   CustomDetailsListTile(
            //       title: appLocalizations.translate("reason"), description: "${interventionDetails.reasonFOrDriverNotWellPositioned}"),

            SizedBox(height: 0.03.sh),
            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // Meter Deposit
            AppBoldText(appLocalizations.translate("meter_deposit_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.identificationBetweenPhaseAndNeutral != null)
              Container(
                  child: RCCustomListTileLarge(
                      title: appLocalizations.translate("identification_between_phase_and_neutral"),
                      description: "${interventionDetails?.identificationBetweenPhaseAndNeutral}")),

            SizedBox(height: 0.03.sh),
            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // Meter Installation
            AppBoldText(appLocalizations.translate("meter_installation_page_name"), fontSize: 16.sp),

            SizedBox(height: 0.015.sh),
            if (interventionDetails?.inversionBetweenPhaseAndMaterial != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("inversion_between_phase_and_neutral"),
                  description: "${interventionDetails?.inversionBetweenPhaseAndMaterial}"),
            if (interventionDetails?.resumptionOfEnslavement != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("resumption_of_enslavement"), description: "${interventionDetails?.resumptionOfEnslavement}"),
            if (interventionDetails?.ictCabling != null)
              CustomDetailsListTile(title: appLocalizations.translate("ict_cabling"), description: "${interventionDetails?.ictCabling}"),

            SizedBox(height: 0.03.sh),
            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // Circuit Breaker Replacement
            AppBoldText(appLocalizations.translate("circuit_breaker_replacement_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.hasTheCircuitBreakerBeenReplaced != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("has_the_circuit_breaker_been_replaced"),
                  description: "${interventionDetails?.hasTheCircuitBreakerBeenReplaced}"),
            if (interventionDetails?.hasTheCircuitBreakerBeenReplaced != null)
              if (interventionDetails?.hasTheCircuitBreakerBeenReplaced == false)
                RCCustomListTileLarge(
                    title: appLocalizations.translate("reason"), description: "${interventionDetails?.resonForCircuitBreakerNonReplacement}"),
            SizedBox(height: 0.03.sh),
            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // Circuit Breaker Settings
            AppBoldText(appLocalizations.translate("circuit_breaker_settings_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.circuitBreakerLead != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("circuit_breaker_lead"), description: "${interventionDetails?.circuitBreakerLead}"),
            // if (interventionDetails.circuitBreakerLead == false)
            //   CustomDetailsListTile(title: appLocalizations.translate("reason"), description: "${interventionDetails.reasonForNoncircuitBreakerLead}"),
            // CustomDetailsListTile(title: appLocalizations.translate("lead_ccpi"), description: "${interventionDetails.leadCCPI}"),
            // if (interventionDetails.leadCCPI == false)
            if (interventionDetails?.indicateReasonForCircuitBreakerSettings != null)
              RCCustomListTileLarge(
                  title: appLocalizations.translate("reason"), description: "${interventionDetails?.indicateReasonForCircuitBreakerSettings}"),
            if (interventionDetails?.modifiedCircuitBreakerCapacity != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("modified_circuit_breaker_capacity"),
                  description: "${interventionDetails?.modifiedCircuitBreakerCapacity}"),
            if (interventionDetails?.calibratedPower!= null)
              if (interventionDetails?.modifiedCircuitBreakerCapacity == true)
                CustomDetailsListTile(title: appLocalizations.translate("calibrated_power"), description: "${interventionDetails?.calibratedPower}"),
            if (interventionDetails?.modifiedCircuitBreakerCapacity != null)
              if (interventionDetails?.modifiedCircuitBreakerCapacity == false)
                RCCustomListTileLarge(
                    title: appLocalizations.translate("reason"), description: "${interventionDetails?.reasonForNonModifiedCircuitBreakerCapacity}"),

            SizedBox(height: 0.03.sh),
            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // Programming
            AppBoldText(appLocalizations.translate("programming_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.statusOfInstalledMeter != null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("status_of_the_installed_meter"),
                  description: "${interventionDetails?.statusOfInstalledMeter == true ? "Correct" : "Defective"}"),
            if (interventionDetails?.statusOfInstalledMeter != null)
              if (interventionDetails?.statusOfInstalledMeter == false)
                CustomDetailsListTile(title: appLocalizations.translate("anomaly"), description: "${interventionDetails?.enterTheAnomalyProgramming}"),
            if (interventionDetails?.statusOfInstalledMeter != null)
              if (interventionDetails?.statusOfInstalledMeter == false)
                CustomDetailsListTile(title: appLocalizations.translate("serial_number"), description: "${interventionDetails?.serialNumber}"),
            if (interventionDetails?.statusOfInstalledMeter != null)
              if (interventionDetails?.statusOfInstalledMeter == false)
                RCCustomListTileLarge(
                    title: appLocalizations.translate("additional_information"),
                    description: "${interventionDetails?.additionalInformationProgramming}"),

            SizedBox(height: 0.03.sh),
            Divider(color: AppColor.kPrimaryColor, height: 2),
            SizedBox(height: 0.03.sh),

            // Circuit Breaker Interlock
            AppBoldText(appLocalizations.translate("circuit_breaker_interlock_page_name"), fontSize: 16.sp),
            SizedBox(height: 0.02.sh),
            if (interventionDetails?.circuitBreakerProperlyEngaged!= null)
              CustomDetailsListTile(
                  title: appLocalizations.translate("circuit_breaker_properly_engaged"),
                  description: "${interventionDetails?.circuitBreakerProperlyEngaged}"),
            if (interventionDetails?.circuitBreakerProperlyEngaged != null)
              if (interventionDetails?.circuitBreakerProperlyEngaged == false)
                CustomDetailsListTile(
                    title: appLocalizations.translate("anomaly"), description: "${interventionDetails?.enterTheAnomalyCircuitBreakerInterlock}"),
            if (interventionDetails?.additionalInformationCircuitBreakerInterlock != null)
              RCCustomListTileLarge(
                  title: appLocalizations.translate("additional_information"),
                  description: "${interventionDetails?.additionalInformationCircuitBreakerInterlock}"),
            SizedBox(height: 0.03.sh),
          ],
        ),
      ),
    );
  }
}