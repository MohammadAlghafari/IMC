import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/widgets/rc_custom_listTile_large.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/widgets/custom_details_list_tile.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class AccountInterventionSummaryInternalPage extends StatelessWidget {
  const AccountInterventionSummaryInternalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if(state is InterventionDetailsLoaded){
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          AppBoldText("Intervention", fontSize: 16),
                          SizedBox(height: 20),
                          CustomDetailsListTile(
                              title:appLocalizations.translate("gps_coordinates"), description: "48.8566 N, 2.3522 E"),
                          SizedBox(height: 10),
                          CustomDetailsListTile(title: "Roding", description: "00/00/0000 00:00"),
                          SizedBox(height: 10),
                          Divider(color: AppColor.kPrimaryColor, height: 2),

                          // SEARCHING PAGE
                          SizedBox(height: 0.03.sh),
                          AppBoldText(appLocalizations.translate("searching_internal_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          CustomDetailsListTile(title: appLocalizations.translate("can_you_get_started_safely"), description: "${_interventionDetails.canYouGetStartedToday}"),
                          CustomDetailsListTile(title: appLocalizations.translate("presence_of_pnt"), description: "${_interventionDetails.presenceOfPnt}"),
                          CustomDetailsListTile(title: appLocalizations.translate("confirm_ppe_ports"), description: "${_interventionDetails.confirmPpePorts}"),
                          CustomDetailsListTile(title: appLocalizations.translate("confirm_installation_of_macarons"), description: "${_interventionDetails.confirmMacronsInstallation}"),
                          CustomDetailsListTile(title:appLocalizations.translate("confirm_top"), description: "${_interventionDetails.confirmTop}"),
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("local"),
                                filePath: "${_interventionDetails.localMeterImage}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title:appLocalizations.translate("meter_number"),
                                filePath: "${_interventionDetails.meterNumberImage}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("counting_pannel"),
                                filePath: "${_interventionDetails.countingPanelImage}",
                              ),

                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // CIRCUIT BREAKER
                          AppBoldText(appLocalizations.translate("circuit_breaker_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          CustomDetailsListTile(title: appLocalizations.translate("circuit_breaker_brand"), description: "${_interventionDetails.circuitBreakerBrand}"),
                          CustomDetailsListTile(title: appLocalizations.translate("month"), description: "${_interventionDetails.month}"),
                          CustomDetailsListTile(title: appLocalizations.translate("year"), description: "${_interventionDetails.year}"),

                          RCCustomListTileLarge(title: appLocalizations.translate("test_of_vat_of_circuit_breaker"), description: "${_interventionDetails.testOfVat}"),
                          CustomDetailsListTile(title:appLocalizations.translate("setting_anomaly"), description: "${_interventionDetails.settingsAnomaly}"),
                          CustomDetailsListTile(title: appLocalizations.translate("circuit_breaker_malfunction"), description: "${_interventionDetails.circuitBreakerMalfuncttion}"),
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("serial_number_scan"),
                                filePath: "${_interventionDetails.serialNumberScanImage}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title:appLocalizations.translate("size_control"),
                                filePath: "${_interventionDetails.sizeControlImage}",
                              ),
                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // METER READING
                          AppBoldText(appLocalizations.translate("meter_reading_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          CustomDetailsListTile(title: appLocalizations.translate("meter_rate"), description: "${_interventionDetails.meterRate}"),
                          CustomDetailsListTile(title: appLocalizations.translate("consumption_full_time"), description: "${_interventionDetails.fullTimeRate}"),
                          CustomDetailsListTile(title: appLocalizations.translate("consumption_off_peak_time"), description: "${_interventionDetails.offPeakTime}"),
                          SizedBox(height: 0.02.sh),
                          AppBoldText(appLocalizations.translate("photo(s)_of_index")),
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              ..._interventionDetails.photoOfIndexImage!.map((filePath) => InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                filePath: "${filePath}",
                              ),)
                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // Phase Position
                          AppBoldText(appLocalizations.translate("phase_position_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          CustomDetailsListTile(title:appLocalizations.translate("is_the_driver_well_positioned"), description: "${_interventionDetails.isTheDriverWellPositioned}"),
                          if(_interventionDetails.isTheDriverWellPositioned == false)
                            CustomDetailsListTile(title:appLocalizations.translate("reason"), description: "${_interventionDetails.reasonFOrDriverNotWellPositioned}"),
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title:appLocalizations.translate("position_of_the_phase_conductor"),
                                filePath: "${_interventionDetails.sizeControlImage}",
                              ),
                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // Installation Policy
                          AppBoldText(appLocalizations.translate("installation_policy_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          AppBoldText(appLocalizations.translate("ccpi_logging")),
                          SizedBox(height: 0.02.sh),
                          Center(child: AppBoldText(appLocalizations.translate("before"))),
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                filePath: "${_interventionDetails.beforeCcpiLoggingImage1}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                filePath: "${_interventionDetails.beforeCcpiLoggingImage1}",
                              ),
                            ],
                          ),
                          SizedBox(height: 0.02.sh),
                          Center(child: AppBoldText(appLocalizations.translate("after"))),
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                filePath: "${_interventionDetails.afterCcpiLoggingImage1}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                filePath: "${_interventionDetails.afterCcpiLoggingImage2}",
                              ),
                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // Meter Deposit
                          AppBoldText(appLocalizations.translate("meter_deposit_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          Container(child: RCCustomListTileLarge(title: appLocalizations.translate("identification_between_phase_and_neutral"), description: "${_interventionDetails.identificationBetweenPhaseAndNeutral}")),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("old_meter"),
                                filePath: "${_interventionDetails.oldMeterImage}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("terminal_block_of_tightened_power"),
                                filePath: "${_interventionDetails.terminalBlockTightenedPowerImage}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title:appLocalizations.translate("terminal_cover_put_back_in_place"),
                                filePath: "${_interventionDetails.terminalCoverPutBackInPlaceImage}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("old_meter_deposited"),
                                filePath: "${_interventionDetails.oldMeterDepositedImage}",
                              ),
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("electrical_equipment_deposited"),
                                filePath: "${_interventionDetails.electricalEquipmentDepositedImage}",
                              ),
                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // Meter Installation
                          AppBoldText(appLocalizations.translate("meter_installation_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          Container(
                            width: 1.sw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppBoldText(appLocalizations.translate("enter_additional_materials"), color: AppColor.kPrimaryColor, fontSize: 13.sp),
                                if(_interventionDetails.enterAdditionallyMaterial != null)
                                Column(
                                  children: [
                                    ..._interventionDetails.enterAdditionallyMaterial!.map((e) => AppRegularText(e)).toList()
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 0.015.sh),
                          RCCustomListTileLarge(title: appLocalizations.translate("inversion_between_phase_and_neutral"), description: "${_interventionDetails.inversionBetweenPhaseAndMaterial}"),
                          CustomDetailsListTile(title: appLocalizations.translate("resumption_of_enslavement"), description: "${_interventionDetails.resumptionOfEnslavement}"),
                          CustomDetailsListTile(title: appLocalizations.translate("ict_cabling"), description: "${_interventionDetails.ictCabling}"),
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("photo_of_wiring(pull_the_cables)"),
                                filePath: "${_interventionDetails.photoOfWiringImage}",
                              ),
                            ],
                          ),
                          AppBoldText(appLocalizations.translate("photo_of_new_meter_installed")),
                          if(_interventionDetails.photosOfNewMeterInstalled != null)
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              ..._interventionDetails.photosOfNewMeterInstalled!.map((filePath) => InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                filePath: "${filePath}",
                              ),)
                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // Circuit Breaker Replacement
                          AppBoldText(appLocalizations.translate("circuit_breaker_replacement_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),

                          RCCustomListTileLarge(title: appLocalizations.translate("has_the_circuit_breaker_been_replaced"), description: "${_interventionDetails.hasTheCircuitBreakerBeenReplaced}"),
                          if(_interventionDetails.hasTheCircuitBreakerBeenReplaced == false)
                            CustomDetailsListTile(title:appLocalizations.translate("reason"), description: "${_interventionDetails.resonForCircuitBreakerNonReplacement}"),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),


                          // Circuit Breaker Settings
                          AppBoldText(appLocalizations.translate("circuit_breaker_settings_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          CustomDetailsListTile(title: appLocalizations.translate("circuit_breaker_lead"), description: "${_interventionDetails.circuitBreakerLead}"),
                          if(_interventionDetails.circuitBreakerLead == false)
                            CustomDetailsListTile(title: appLocalizations.translate("reason"), description: "${_interventionDetails.reasonForNoncircuitBreakerLead}"),
                          CustomDetailsListTile(title: appLocalizations.translate("lead_ccpi"), description: "${_interventionDetails.leadCCPI}"),
                          if(_interventionDetails.leadCCPI == false)
                            CustomDetailsListTile(title: appLocalizations.translate("reason"), description: "${_interventionDetails.indicateReasonForCircuitBreakerSettings}"),
                          CustomDetailsListTile(title: appLocalizations.translate("modified_circuit_breaker_capacity"), description: "${_interventionDetails.modifiedCircuitBreakerCapacity}"),
                          if(_interventionDetails.modifiedCircuitBreakerCapacity == true)
                            CustomDetailsListTile(title: appLocalizations.translate("calibrated_power"), description: "${_interventionDetails.calibratedPower}"),
                          if(_interventionDetails.modifiedCircuitBreakerCapacity == false)
                            CustomDetailsListTile(title: appLocalizations.translate("reason"), description: "${_interventionDetails.reasonForNonModifiedCircuitBreakerCapacity}"),

                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title:appLocalizations.translate("circuit_breaker_gauge"),
                                filePath: "${_interventionDetails.circuitBreakerGuageImage}",
                              ),
                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // Programming
                          AppBoldText(appLocalizations.translate("programming_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          CustomDetailsListTile(title: appLocalizations.translate("status_of_the_installed_meter"), description: "${_interventionDetails.statusOfInstalledMeter == true ? "Correct": "Defective"}"),
                          if(_interventionDetails.statusOfInstalledMeter == false)
                            CustomDetailsListTile(title: appLocalizations.translate("anomaly"), description: "${_interventionDetails.enterTheAnomalyProgramming}"),
                          if(_interventionDetails.statusOfInstalledMeter == false)
                            CustomDetailsListTile(title: appLocalizations.translate("serial_number"), description: "${_interventionDetails.serialNumber}"),
                          if(_interventionDetails.statusOfInstalledMeter == false)
                            RCCustomListTileLarge(title: appLocalizations.translate("additional_information"), description: "${_interventionDetails.additionalInformationProgramming}"),
                          Wrap(
                            spacing: 0.1.sw,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                disableOnTap: true,
                                title: appLocalizations.translate("meter_anomaly"),
                                filePath: "${_interventionDetails.oldMeterImage}",
                              ),

                            ],
                          ),
                          SizedBox(height: 0.03.sh),
                          Divider(color: AppColor.kPrimaryColor, height: 2),
                          SizedBox(height: 0.03.sh),

                          // Circuit Breaker Interlock
                          AppBoldText(appLocalizations.translate("circuit_breaker_interlock_page_name"), fontSize: 16.sp),
                          SizedBox(height: 0.02.sh),
                          CustomDetailsListTile(title: appLocalizations.translate("circuit_breaker_properly_engaged"), description: "${_interventionDetails.circuitBreakerProperlyEngaged}"),
                          if(_interventionDetails.circuitBreakerProperlyEngaged == false)
                            CustomDetailsListTile(title: appLocalizations.translate("anomaly"), description: "${_interventionDetails.enterTheAnomalyCircuitBreakerInterlock}"),
                          RCCustomListTileLarge(title: appLocalizations.translate("additional_information"), description: "${_interventionDetails.additionalInformationCircuitBreakerInterlock}"),
                          SizedBox(height: 0.03.sh),

                        ],
                      ),
                    ),
                  ],
                ),
              ));
        }
        else return SizedBox.shrink();
      },
    );

  }
}