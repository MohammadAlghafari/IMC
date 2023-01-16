import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_details_utils.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_pdf_util_helper_function.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:pdf/pdf.dart' as PDF;
import 'package:pdf/widgets.dart' as pw;

class InterventionPdfUtil {
  /// This [generatePDF] function will generate pdf for (normal, grip, force grip)intervention case
  static Future<File?> generatePDF(
      {required InterventionDetailsModel interventionDetails, required BuildContext bldCtx, required bool isGripCase}) async {
    try {
      final appLocalizations = AppLocalizations.of(bldCtx);
      // Create a new PDF document.
      final document = pw.Document();

      document.addPage(pw.MultiPage(
          pageFormat: PDF.PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  //!page 1: "Account"
                  _getPdfPageTitle(title: appLocalizations.translate("account_page_name")),
                  pw.Container(height: 20, width: 1.sw),
                  if (interventionDetails.startTimeOfIntervention != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("start_time_of_intervention"),
                        description: interventionDetails.startTimeOfIntervention),
                  ],
                  if (interventionDetails.endTimeOfIntervention != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("end_time_of_intervention"),
                        description: interventionDetails.endTimeOfIntervention),
                  ],
                  if (interventionDetails.latitude != null) ...[
                    _getPdfTitleValuePairTextElement(ctx: bldCtx, title: "Latitude", description: interventionDetails.latitude.toString()),
                  ],
                  if (interventionDetails.longitude != null) ...[
                    _getPdfTitleValuePairTextElement(ctx: bldCtx, title: "Longitude", description: interventionDetails.longitude.toString()),
                  ],

                  pw.SizedBox(height: 10),
                  pw.Divider(height: 4, endIndent: 0, indent: 0),

                  //!page 2: "customer feedback"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.CustomerFeedbackPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.CustomerFeedbackPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("customer_feedback_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.CustomerFeedbackPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.customerFeedbackComment != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("customer_comment"), description: interventionDetails.customerFeedbackComment),
                  ],
                  if (interventionDetails.customerSignatureImage != null) ...[
                    _drawImage(
                        isSignature: true,
                        title: "Customer Electronic Signature",
                        filePath: "${interventionDetails.customerSignatureImage}"),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.CustomerFeedbackPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.CustomerFeedbackPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //! page 3 :"searching"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.searchingPagePageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.searchingPagePageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("searching_internal_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.searchingPagePageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.canYouGetStartedToday != null) ...[
                    _getPdfTitleValuePairTextElement(
                      ctx: bldCtx,
                      title: appLocalizations.translate("can_you_get_started_safely"),
                      value: interventionDetails.canYouGetStartedToday,
                    ),
                  ],
                  if (interventionDetails.presenceOfPnt != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("presence_of_pnt"), value: interventionDetails.presenceOfPnt),
                  ],
                  if (interventionDetails.confirmPpePorts != null) ...[
                    _getPdfTitleValuePairTextElement(
                      ctx: bldCtx,
                      title: appLocalizations.translate("confirm_ppe_ports"),
                      value: interventionDetails.confirmPpePorts,
                    ),
                  ],
                  if (interventionDetails.confirmMacronsInstallation != null) ...[
                    _getPdfTitleValuePairTextElement(
                      ctx: bldCtx,
                      title: appLocalizations.translate("confirm_installation_of_macarons"),
                      value: interventionDetails.confirmMacronsInstallation,
                    ),
                  ],
                  if (interventionDetails.confirmTop != null) ...[
                    _getPdfTitleValuePairTextElement(
                      ctx: bldCtx,
                      title: appLocalizations.translate("confirm_top"),
                      value: interventionDetails.confirmTop,
                    ),
                  ],

                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.searchingPagePageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  pw.Container(
                    width: 1.sw,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      mainAxisSize: pw.MainAxisSize.max,
                      children: [
                        if (interventionDetails.localMeterImage != null) ...[
                          _drawImage(
                            title: appLocalizations.translate("local"),
                            filePath: "${interventionDetails.localMeterImage}",
                          ),
                        ],
                        if (interventionDetails.meterNumberImage != null) ...[
                          _drawImage(
                            title: appLocalizations.translate("meter_number"),
                            filePath: "${interventionDetails.meterNumberImage}",
                          ),
                        ],
                        if (interventionDetails.countingPanelImage != null) ...[
                          _drawImage(
                            title: appLocalizations.translate("counting_pannel"),
                            filePath: "${interventionDetails.countingPanelImage}",
                          ),
                        ],
                      ],
                    ),
                  ),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.searchingPagePageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.searchingPagePageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //! page 4 :"circuit breaker"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.circuitBreakerPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.circuitBreakerPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("circuit_breaker_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.circuitBreakerPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.circuitBreakerBrand != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("circuit_breaker_brand"),
                        description: interventionDetails.circuitBreakerBrand),
                  ],
                  if (interventionDetails.month != null) ...[
                    _getPdfTitleValuePairTextElement(ctx: bldCtx, title: appLocalizations.translate("month"), description: interventionDetails.month),
                  ],
                  if (interventionDetails.year != null) ...[
                    _getPdfTitleValuePairTextElement(ctx: bldCtx, title: appLocalizations.translate("year"), description: interventionDetails.year),
                  ],
                  if (interventionDetails.testOfVat != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("test_of_vat_of_circuit_breaker"), value: interventionDetails.testOfVat),
                  ],
                  if (interventionDetails.settingsAnomaly != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("setting_anomaly"), value: interventionDetails.settingsAnomaly),
                  ],
                  if (interventionDetails.circuitBreakerMalfuncttion != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("circuit_breaker_malfunction"),
                        value: interventionDetails.circuitBreakerMalfuncttion),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.circuitBreakerPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  pw.Container(
                    width: 1.sw,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      mainAxisSize: pw.MainAxisSize.max,
                      children: [
                        if (interventionDetails.serialNumberScanImage != null) ...[
                          _drawImage(
                              title: appLocalizations.translate("serial_number_scan"), filePath: "${interventionDetails.serialNumberScanImage}"),
                        ],
                        if (interventionDetails.sizeControlImage != null) ...[
                          _drawImage(title: appLocalizations.translate("size_control"), filePath: "${interventionDetails.sizeControlImage}"),
                        ],
                      ],
                    ),
                  ),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.circuitBreakerPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.circuitBreakerPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //! page 5:"meter reading"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterReadingPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterReadingPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("meter_reading_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterReadingPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.meterRate != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("meter_rate"), description: interventionDetails.meterRate),
                  ],
                  if (interventionDetails.fullTimeRate != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("full_time"), description: interventionDetails.fullTimeRate),
                  ],
                  if (interventionDetails.offPeakTime != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("off_peak_time"), description: interventionDetails.offPeakTime),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterReadingPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  //* List of strings field

                  pw.Container(
                    width: 1.sw,
                    child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, mainAxisSize: pw.MainAxisSize.max, children: [
                      pw.ListView.builder(
                          direction: pw.Axis.horizontal,
                          spacing: 60,
                          itemBuilder: (context, index) {
                            String filePath = "${interventionDetails.photoOfIndexImage![index]}";
                            if (filePath != "" && filePath.isNotEmpty)
                              return _drawImage(
                                  title: appLocalizations.translate("photo(s)_of_index"),
                                  filePath: "${interventionDetails.photoOfIndexImage![index]}");
                            return pw.Container();
                          },
                          itemCount: interventionDetails.photoOfIndexImage!.length),
                    ]),
                  ),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterReadingPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterReadingPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //! page 6:"phase position"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.PhasePositionPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.PhasePositionPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("phase_position_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.PhasePositionPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.isTheDriverWellPositioned != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("is_the_driver_well_positioned"),
                        value: interventionDetails.isTheDriverWellPositioned),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.PhasePositionPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.isTheDriverWellPositioned != null && interventionDetails.reasonFOrDriverNotWellPositioned != null) ...[
                    interventionDetails.isTheDriverWellPositioned == false
                        ? _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("reason_for_driver_not_well_positioned"),
                        description: interventionDetails.reasonFOrDriverNotWellPositioned)
                        : pw.SizedBox(),
                  ],
                  if (interventionDetails.positionOfPhaseConductorImage != null) ...[
                    _drawImage(
                        title: appLocalizations.translate("position_of_the_phase_conductor"),
                        filePath: "${interventionDetails.positionOfPhaseConductorImage}"),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.PhasePositionPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.PhasePositionPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //! page 7: "installation polciy"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.InstallationPolicyPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.InstallationPolicyPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("installation_policy_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.InstallationPolicyPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                    if (interventionDetails.beforeCcpiLoggingImage1 != null) ...[
                      _drawImage(
                          title: appLocalizations.translate("before_CCPI_logging_image_1"),
                          filePath: "${interventionDetails.beforeCcpiLoggingImage1}")
                    ],
                    if (interventionDetails.beforeCcpiLoggingImage2 != null) ...[
                      _drawImage(
                          title: appLocalizations.translate("before_CCPI_logging_image_2"),
                          filePath: "${interventionDetails.beforeCcpiLoggingImage2}"),
                    ],
                  ]),
                  pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                    if (interventionDetails.afterCcpiLoggingImage1 != null) ...[
                      _drawImage(
                          title: appLocalizations.translate("after_CCPI_logging_image_1"), filePath: "${interventionDetails.afterCcpiLoggingImage1}"),
                    ],
                    if (interventionDetails.afterCcpiLoggingImage2 != null) ...[
                      _drawImage(
                          title: appLocalizations.translate("after_CCPI_logging_image_2"), filePath: "${interventionDetails.afterCcpiLoggingImage2}"),
                    ],
                  ]),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.InstallationPolicyPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.InstallationPolicyPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //! page 8: "meter deposit"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterDepositPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterDepositPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("meter_deposit_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterDepositPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.identificationBetweenPhaseAndNeutral != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("identification_between_phase_and_neutral"),
                        value: interventionDetails.identificationBetweenPhaseAndNeutral),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterDepositPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  pw.Column(children: [
                    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                      if (interventionDetails.oldMeterImage != null) ...[
                        _drawImage(title: appLocalizations.translate("old_meter"), filePath: "${interventionDetails.oldMeterImage}"),
                      ],
                      if (interventionDetails.terminalBlockTightenedPowerImage != null) ...[
                        _drawImage(
                            title: appLocalizations.translate("terminal_block_of_tightened_power"),
                            filePath: "${interventionDetails.terminalBlockTightenedPowerImage}"),
                      ],
                      if (interventionDetails.terminalCoverPutBackInPlaceImage != null) ...[
                        _drawImage(
                            title: appLocalizations.translate("terminal_cover_put_back_in_place"),
                            filePath: "${interventionDetails.terminalCoverPutBackInPlaceImage}"),
                      ],
                    ]),
                    InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterDepositPageId, interventionDetails)
                        ? pw.Container(height: 20, width: 1.sw)
                        : pw.SizedBox.shrink(),
                    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                      if (interventionDetails.oldMeterDepositedImage != null) ...[
                        _drawImage(
                            title: appLocalizations.translate("old_meter_deposited"), filePath: "${interventionDetails.oldMeterDepositedImage}"),
                      ],
                      if (interventionDetails.electricalEquipmentDepositedImage != null) ...[
                        _drawImage(
                            title: appLocalizations.translate("electrical_equipment_deposited"),
                            filePath: "${interventionDetails.electricalEquipmentDepositedImage}"),
                      ],
                    ]),
                  ]),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterDepositPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterDepositPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //! page 9: "meter installation"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterInstallationPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterInstallationPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("meter_installation_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterInstallationPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  //* List of strings field

                  if (interventionDetails.enterAdditionallyMaterial != null &&
                      interventionDetails.enterAdditionallyMaterial!.isNotEmpty &&
                      interventionDetails.enterAdditionallyMaterial != [""] &&
                      (interventionDetails.enterAdditionallyMaterial?.contains("") == false)) ...[
                    pw.Row(children: [
                      pw.Text(appLocalizations.translate("enter_additional_materials"),
                          style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.black)),
                      pw.Spacer(),
                      pw.ListView.builder(
                          direction: pw.Axis.horizontal,
                          spacing: 60,
                          itemBuilder: ((context, index) {
                            if (interventionDetails.enterAdditionallyMaterial != null &&
                                interventionDetails.enterAdditionallyMaterial!.isNotEmpty &&
                                interventionDetails.enterAdditionallyMaterial != [""] &&
                                (interventionDetails.enterAdditionallyMaterial?.contains("") == false))
                              return pw.Text(
                                interventionDetails.enterAdditionallyMaterial![index],
                                style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.blue),
                              );
                            return pw.Container();
                          }),
                          itemCount: interventionDetails.enterAdditionallyMaterial!.length),
                    ]),
                  ],

                  if (interventionDetails.inversionBetweenPhaseAndMaterial != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("inversion_between_phase_and_neutral"),
                        value: interventionDetails.inversionBetweenPhaseAndMaterial)
                  ],
                  if (interventionDetails.resumptionOfEnslavement != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("resumption_of_enslavement"),
                        value: interventionDetails.resumptionOfEnslavement),
                  ],
                  if (interventionDetails.ictCabling != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("ict_cabling"), value: interventionDetails.ictCabling),
                  ],
                  pw.Container(height: 20, width: 1.sw),
                  if (interventionDetails.photoOfWiringImage != null) ...[
                    _drawImage(
                        title: appLocalizations.translate("photo_of_wiring(pull_the_cables)"), filePath: "${interventionDetails.photoOfWiringImage}"),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterInstallationPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  //* List of strings field

                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      mainAxisSize: pw.MainAxisSize.min,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        if (interventionDetails.photosOfNewMeterInstalled != null &&
                            interventionDetails.photosOfNewMeterInstalled!.isNotEmpty &&
                            interventionDetails.photosOfNewMeterInstalled != [""] &&
                            (interventionDetails.photosOfNewMeterInstalled?.contains("") == false))
                          pw.Text(appLocalizations.translate("photo_of_new_meter_installed"),
                              style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.black)),
                        pw.ListView.builder(
                            direction: pw.Axis.horizontal,
                            spacing: 40,
                            itemBuilder: ((context, index) {
                              String filePath = "${interventionDetails.photosOfNewMeterInstalled![index]}";
                              if (filePath != "" && filePath.isNotEmpty)
                                return _drawImage(title: "", filePath: "${interventionDetails.photosOfNewMeterInstalled![index]}");
                              return pw.Container();
                            }),
                            itemCount: interventionDetails.photosOfNewMeterInstalled!.length),
                      ]),

                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterInstallationPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.MeterInstallationPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //!page 10: "circuit breaker replacement"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerReplacementPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerReplacementPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("circuit_breaker_replacement_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerReplacementPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.hasTheCircuitBreakerBeenReplaced != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("has_the_circuit_breaker_been_replaced"),
                        value: interventionDetails.hasTheCircuitBreakerBeenReplaced),
                  ],
                  if (interventionDetails.hasTheCircuitBreakerBeenReplaced != null &&
                      interventionDetails.resonForCircuitBreakerNonReplacement != null) ...[
                    interventionDetails.hasTheCircuitBreakerBeenReplaced == false
                        ? _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("reason_for_circuit_breaker_non_replacement"),
                        description: interventionDetails.resonForCircuitBreakerNonReplacement)
                        : pw.SizedBox(),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerReplacementPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerReplacementPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //!page 11: "circuit breakr settings"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerSettingsPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerSettingsPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("circuit_breaker_settings_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerSettingsPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.circuitBreakerLead != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("circuit_breaker_lead"), value: interventionDetails.circuitBreakerLead),
                    (interventionDetails.circuitBreakerLead == false && interventionDetails.reasonForNoncircuitBreakerLead != null)
                        ? _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("reason_for_non_circuit_breaker_lead"),
                        description: interventionDetails.reasonForNoncircuitBreakerLead)
                        : pw.SizedBox(),
                  ],
                  if (interventionDetails.leadCCPI != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("lead_ccpi"), value: interventionDetails.leadCCPI),
                  ],
                  if (interventionDetails.leadCCPI != null) ...[
                    (interventionDetails.leadCCPI == false && interventionDetails.indicateReasonForCircuitBreakerSettings != null)
                        ? _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("reason_for_non_lead_CCPI"),
                        description: interventionDetails.indicateReasonForCircuitBreakerSettings)
                        : pw.SizedBox(),
                  ],
                  if (interventionDetails.modifiedCircuitBreakerCapacity != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("modified_circuit_breaker_capacity"),
                        value: interventionDetails.modifiedCircuitBreakerCapacity),
                  ],
                  if (interventionDetails.modifiedCircuitBreakerCapacity != null) ...[
                    interventionDetails.modifiedCircuitBreakerCapacity == true
                        ? _getPdfTitleValuePairTextElement(
                        ctx: bldCtx, title: appLocalizations.translate("calibrated_power"), description: interventionDetails.calibratedPower)
                        : _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("reason_for_non_modified_circuit_breaker_capacity"),
                        description: interventionDetails.reasonForNonModifiedCircuitBreakerCapacity),
                  ],
                  if (interventionDetails.circuitBreakerGuageImage != null) ...[
                    _drawImage(
                        title: appLocalizations.translate("circuit_breaker_gauge"), filePath: "${interventionDetails.circuitBreakerGuageImage}"),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerSettingsPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerSettingsPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //!page 12: "programming"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.ProgrammingPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.ProgrammingPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("programming_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.ProgrammingPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.statusOfInstalledMeter != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("status_of_the_installed_meter"),
                        value: interventionDetails.statusOfInstalledMeter,
                        isStatusOfMeterInstalledField: true),
                    interventionDetails.statusOfInstalledMeter == false
                        ? pw.Column(children: [
                      if (interventionDetails.enterTheAnomalyProgramming != null)
                        _getPdfTitleValuePairTextElement(
                            ctx: bldCtx,
                            title: appLocalizations.translate("anomaly"),
                            description: interventionDetails.enterTheAnomalyProgramming),
                      if (interventionDetails.serialNumber != null)
                        _getPdfTitleValuePairTextElement(
                            ctx: bldCtx, title: appLocalizations.translate("serial_number"), description: interventionDetails.serialNumber),
                      if (interventionDetails.meterAnomalyImage != null) pw.Container(height: 20, width: 1.sw),
                      if (interventionDetails.meterAnomalyImage != null)
                        _drawImage(title: appLocalizations.translate("meter_anomaly"), filePath: "${interventionDetails.meterAnomalyImage}"),
                      if (interventionDetails.meterAnomalyImage != null) pw.Container(height: 10, width: 1.sw),
                      if (interventionDetails.additionalInformationProgramming != null)
                        _getPdfTitleValuePairTextElement(
                            ctx: bldCtx,
                            title: appLocalizations.translate("additional_information"),
                            description: interventionDetails.additionalInformationProgramming),
                    ])
                        : pw.SizedBox(),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.ProgrammingPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(InterventionDetailsUtils.ProgrammingPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  //!page 13: "circuit breaker interlock"
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerInterlockPageId, interventionDetails)
                      ? pw.SizedBox(height: 40)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerInterlockPageId, interventionDetails)
                      ? _getPdfPageTitle(title: appLocalizations.translate("circuit_breaker_interlock_page_name"))
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerInterlockPageId, interventionDetails)
                      ? pw.Container(height: 20, width: 1.sw)
                      : pw.SizedBox.shrink(),
                  if (interventionDetails.circuitBreakerProperlyEngaged != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("circuit_breaker_properly_engaged"),
                        value: interventionDetails.circuitBreakerProperlyEngaged),
                    (interventionDetails.circuitBreakerProperlyEngaged == false && interventionDetails.enterTheAnomalyCircuitBreakerInterlock != null)
                        ? _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("anomaly_circuit_breaker_interlock"),
                        description: interventionDetails.enterTheAnomalyCircuitBreakerInterlock)
                        : pw.SizedBox(),
                  ],
                  if (interventionDetails.additionalInformationCircuitBreakerInterlock != null) ...[
                    _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("additional_information"),
                        description: interventionDetails.additionalInformationCircuitBreakerInterlock),
                  ],
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerInterlockPageId, interventionDetails)
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox.shrink(),
                  InterventionPdfUtilHelperFunction.isSinglePageValueFilled(
                      InterventionDetailsUtils.CircuitBreakerInterlockPageId, interventionDetails)
                      ? pw.Divider(height: 4, endIndent: 0, indent: 0)
                      : pw.SizedBox.shrink(),

                  pw.Divider(height: 4, endIndent: 0, indent: 0, thickness: 5),

                  //!page : "grip case"
                  if (isGripCase) ...[
                    pw.SizedBox(height: 60),
                    _getPdfPageTitle(title: appLocalizations.translate("reporting_a_grip_case")),
                    pw.Container(height: 20, width: 1.sw),
                    if (interventionDetails.gripCaseReason != null) ...[
                      _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("reason_for_grip_case"),
                        description: "${interventionDetails.gripCaseReason}",
                      ),
                    ],
                    if (interventionDetails.gripCaseComment != null) ...[
                      pw.Container(height: 10, width: 1.sw),
                      _getPdfTitleValuePairTextElement(
                        ctx: bldCtx,
                        title: appLocalizations.translate("comments"),
                        description: "${interventionDetails.gripCaseComment}",
                      ),
                    ],
                    pw.Container(height: 40, width: 1.sw),
                    _getPdfPageTitle(title: appLocalizations.translate("notice_of_passage")),
                    pw.Container(height: 20, width: 1.sw),
                    pw.Container(
                        width: 1.sw,
                        child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                            // spacing: 20,
                            // runSpacing: 20,
                            children: [
                              if (interventionDetails.noticeOfPassageImage1 != null) ...[
                                _drawImage(
                                  filePath: "${interventionDetails.noticeOfPassageImage1}",
                                ),
                              ],
                              if (interventionDetails.noticeOfPassageImage2 != null) ...[
                                _drawImage(
                                  filePath: "${interventionDetails.noticeOfPassageImage2}",
                                ),
                              ],
                            ])),
                    pw.Container(height: 40, width: 1.sw),
                    _getPdfPageTitle(title: appLocalizations.translate("displacement_photo")),
                    pw.Container(height: 20, width: 1.sw),
                    pw.Container(height: 20, width: 1.sw),
                    pw.Container(
                      width: 1.sw,
                      child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                          // spacing: 20,
                          // runSpacing: 20,
                          children: [
                            if (interventionDetails.displacementPhotoImage1 != null) ...[
                              _drawImage(
                                filePath: "${interventionDetails.displacementPhotoImage1}",
                              ),
                            ],
                            if (interventionDetails.displacementPhotoImage2 != null) ...[
                              _drawImage(
                                filePath: "${interventionDetails.displacementPhotoImage2}",
                              ),
                            ],
                          ]),
                    ),
                  ],
                ],
              )
            ]; // Center
          }));

      List<int> bytes = await document.save();
      // disposing all resources
      // document.dispose();
      return await saveAndReturnFile(bytes, "Intervention_Output_${interventionDetails.id}.pdf");
    } catch (e, stacktrace) {
      log("Error While generating PDF $e");
      log("GENERATING PDF ERROR ON LINE $stacktrace");
      return null;
    }
  }


  /// The Function [ _getPdfPageTitle ] will generate title
  static pw.Widget _getPdfPageTitle({required String title}) {
    return pw.Center(child: pw.Text("$title", style: pw.TextStyle(fontSize: 18.sp)));
  }

  /// The Function [ _getPdfTitleValuePairTextElement ] will generate title - value pair
  static pw.Widget _getPdfTitleValuePairTextElement(
      {required String title, required BuildContext ctx, bool? value, String? description, bool? isStatusOfMeterInstalledField}) {
    final appLocalizations = AppLocalizations.of(ctx);

    return pw.Row(
      children: [
        pw.Expanded(child: pw.Text("$title", style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.black))),
        pw.Container(width: 0.04.sw),
        if (isStatusOfMeterInstalledField != null && isStatusOfMeterInstalledField == true)
          pw.Expanded(
              child: pw.Text(
                  "${description ?? (value == true ? (appLocalizations.translate("correct")) : (appLocalizations.translate("defective")))}",
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.blue))),
        if (isStatusOfMeterInstalledField == null)
          pw.Expanded(
              child: pw.Text("${description ?? (value == true ? (appLocalizations.translate("yes")) : (appLocalizations.translate("no")))}",
                  textAlign: pw.TextAlign.right, style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.blue))),
      ],
    );
  }

  /// The Function [ _drawImage ] will generate title - value pair
  static pw.Widget _drawImage({
    String? title,
    required String filePath,
    bool? isSignature,
  }) {
    final image = pw.MemoryImage(
      File('$filePath').readAsBytesSync(),
    );

    return pw.Column(children: [
      if (title != null) pw.Text("$title"),
      if (title != null) pw.Container(height: 10),
      pw.Container(
        width: (isSignature != null && isSignature == true) ? 200 : 100,
        height: (isSignature != null && isSignature == true) ? 110 : 100,
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        child: (isSignature != null && isSignature == true)
            ? (pw.Padding(padding: pw.EdgeInsets.all(5), child: pw.Image(image, fit: pw.BoxFit.fitHeight)))
            : pw.Image(image, fit: pw.BoxFit.cover),
      )
    ]);
  }
}

// The function will save the pdf file to external storage and the returns the file
Future<File?> saveAndReturnFile(List<int> bytes, String fileName) async {
  try {
    // Directory? directory = Platform.isAndroid
    //     ? await getExternalStorageDirectory() //FOR ANDROID
    //     : await getApplicationSupportDirectory(); //FOR iOS

    final directory = await getTemporaryDirectory();
    String path = directory.path;
    final File file = File("$path/$fileName");
    return await file.writeAsBytes(bytes, flush: true);
  } catch (e) {
    log("Error While saving PDF $e");
    return null;
  }
}