import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/utils/rc_intervention_details_utils.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_pdf_util.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:pdf/pdf.dart' as PDF;
import 'package:pdf/widgets.dart' as pw;

class RCInterventionPdfUtil {
  ///[isSinglePageValFilled] will check for all the RC intervention pages if any details for that page is filled or not and generated pdf values according to it.
  static bool isSinglePageValFilled(RCInterventionDetailsModel rcInterventionDetails, int selectedPage) {
    switch (selectedPage) {
      case RCInterventionDetailsUtils.MeterReprogrammngPageId:
        if (rcInterventionDetails.confirmMeterReprogramming != null ||
            rcInterventionDetails.meterReprogrammingImage1 != null ||
            rcInterventionDetails.meterReprogrammingImage2 != null ||
            rcInterventionDetails.additionalInfoOfMeterReprogramming != null) {
          return true;
        }
        break;
      case RCInterventionDetailsUtils.EnslavementTestPageId:
        if (rcInterventionDetails.confirmEnslavementTest != null ||
            rcInterventionDetails.meterEnslavementTestImage1 != null ||
            rcInterventionDetails.meterEnslavementTestImage2 != null ||
            rcInterventionDetails.additionalInfoOfEnslavementTest != null) {
          return true;
        }
        break;
    }
    return false;
  }

  ///[generatePDF] generating pdf with provided value in RC intervention pages
  static Future<File?> generatePDF(
      {required RCInterventionDetailsModel rcInterventionDetails,
        required BuildContext bldctx,
        required int selectedPageIdVal,
        required isGripCase}) async {
    try {
      final appLocalizations = AppLocalizations.of(bldctx);
      final document = pw.Document();

      document.addPage(pw.MultiPage(
          pageFormat: PDF.PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              (pw.Column(children: [
                //! page1: meter reprogramming
                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("meter_reprogramming")) &&
                    (rcInterventionDetails.confirmMeterReprogramming != null ||
                        rcInterventionDetails.meterReprogrammingImage1 != null ||
                        rcInterventionDetails.meterReprogrammingImage2 != null ||
                        rcInterventionDetails.additionalInfoOfMeterReprogramming != null))
                  _getPdfPageTitle(title: appLocalizations.translate("meter_reprogramming")),

                if (isSinglePageValFilled(rcInterventionDetails, selectedPageIdVal)) pw.Container(height: 20, width: 1.sw),

                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("meter_reprogramming")) &&
                    (rcInterventionDetails.confirmMeterReprogramming != null))
                  _getPdfTitleValuePairTextElement(
                      ctx: bldctx,
                      title: appLocalizations.translate("did_you_reprogram_meter"),
                      value: rcInterventionDetails.confirmMeterReprogramming),

                if (isSinglePageValFilled(rcInterventionDetails, selectedPageIdVal)) pw.Container(height: 20, width: 1.sw),

                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("meter_reprogramming")) &&
                    (rcInterventionDetails.additionalInfoOfMeterReprogramming != null))
                  _getPdfTitleValuePairTextElement(
                      ctx: bldctx,
                      title: appLocalizations.translate("additional_information"),
                      description: rcInterventionDetails.additionalInfoOfMeterReprogramming),

                if (isSinglePageValFilled(rcInterventionDetails, selectedPageIdVal)) pw.Container(height: 20, width: 1.sw),

                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly, children: [
                  if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("meter_reprogramming")) &&
                      (rcInterventionDetails.meterReprogrammingImage1 != null))
                    _drawImage(title: appLocalizations.translate("meter_image_1"), filePath: "${rcInterventionDetails.meterReprogrammingImage1}"),
                  if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("meter_reprogramming")) &&
                      (rcInterventionDetails.meterReprogrammingImage2 != null))
                    _drawImage(title: appLocalizations.translate("meter_image_2"), filePath: "${rcInterventionDetails.meterReprogrammingImage2}"),
                ]),
                if (isSinglePageValFilled(rcInterventionDetails, selectedPageIdVal)) pw.Container(height: 20, width: 1.sw),

                //! page2: enslavement test
                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("enslavement_test")) &&
                    (rcInterventionDetails.confirmEnslavementTest != null ||
                        rcInterventionDetails.meterEnslavementTestImage1 != null ||
                        rcInterventionDetails.meterEnslavementTestImage2 != null ||
                        rcInterventionDetails.additionalInfoOfEnslavementTest != null))
                  _getPdfPageTitle(title: appLocalizations.translate("enslavement_test")),

                if (isSinglePageValFilled(rcInterventionDetails, selectedPageIdVal)) pw.Container(height: 20, width: 1.sw),

                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("enslavement_test")) &&
                    (rcInterventionDetails.confirmEnslavementTest != null))
                  _getPdfTitleValuePairTextElement(
                      ctx: bldctx,
                      title: appLocalizations.translate("did_you_test_for_enslavement"),
                      value: rcInterventionDetails.confirmEnslavementTest),

                if (isSinglePageValFilled(rcInterventionDetails, selectedPageIdVal)) pw.Container(height: 20, width: 1.sw),

                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("enslavement_test")) &&
                    (rcInterventionDetails.additionalInfoOfEnslavementTest != null))
                  _getPdfTitleValuePairTextElement(
                      ctx: bldctx,
                      title: appLocalizations.translate("additional_information"),
                      description: rcInterventionDetails.additionalInfoOfEnslavementTest),

                if (isSinglePageValFilled(rcInterventionDetails, selectedPageIdVal)) pw.Container(height: 20, width: 1.sw),

                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly, children: [
                  if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("enslavement_test")) &&
                      (rcInterventionDetails.meterEnslavementTestImage1 != null))
                    _drawImage(title: appLocalizations.translate("meter_image_1"), filePath: "${rcInterventionDetails.meterEnslavementTestImage1}"),
                  if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("enslavement_test")) &&
                      (rcInterventionDetails.meterEnslavementTestImage2 != null))
                    _drawImage(title: appLocalizations.translate("meter_image_2"), filePath: "${rcInterventionDetails.meterEnslavementTestImage2}"),
                ]),
                if (isSinglePageValFilled(rcInterventionDetails, selectedPageIdVal)) pw.Container(height: 20, width: 1.sw),

                //! page3: other actions
                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("other_actions")) &&
                    (rcInterventionDetails.specifyYourAction != null ||
                        (rcInterventionDetails.photosOfAction != null && (rcInterventionDetails.photosOfAction!.isNotEmpty)) ||
                        rcInterventionDetails.additionalInfoOfActions != null))
                  _getPdfPageTitle(title: appLocalizations.translate("other_actions")),

                pw.Container(height: 20, width: 1.sw),
                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("other_actions")) &&
                    (rcInterventionDetails.specifyYourAction != null))
                  _getPdfTitleValuePairTextElement(
                      ctx: bldctx, title: appLocalizations.translate("specify_your_action"), description: rcInterventionDetails.specifyYourAction),

                pw.Container(height: 20, width: 1.sw),
                if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("other_actions")) &&
                    (rcInterventionDetails.additionalInfoOfActions != null))
                  _getPdfTitleValuePairTextElement(
                      ctx: bldctx,
                      title: appLocalizations.translate("additional_information"),
                      description: rcInterventionDetails.additionalInfoOfActions),

                pw.Container(height: 20, width: 1.sw),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    mainAxisSize: pw.MainAxisSize.min,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("other_actions")) &&
                          ((rcInterventionDetails.photosOfAction) != null &&
                              (rcInterventionDetails.photosOfAction?.first != "") &&
                              (rcInterventionDetails.photosOfAction!.length > 1)))
                        pw.Text("Photos", style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.black)),
                      if ((rcInterventionDetails.selectedRCInterventionOption == appLocalizations.translate("other_actions")))
                        pw.ListView.builder(
                            spacing: 10,
                            itemBuilder: ((context, index) {
                              String filePath = "${rcInterventionDetails.photosOfAction![index]}";
                              if (filePath != "" && filePath.isNotEmpty)
                                return _drawImageWithoutTitle(filePath: "${rcInterventionDetails.photosOfAction![index]}");
                              return pw.Container();
                            }),
                            itemCount: rcInterventionDetails.photosOfAction!.length),
                    ]),
                pw.SizedBox(height: 40),
              ])),

              //!page : "grip case"
              if (isGripCase) ...[
                pw.Divider(thickness: 10),
                pw.SizedBox(height: 20),
                _getPdfPageTitle(title: appLocalizations.translate("reporting_a_grip_case")),
                pw.Container(height: 20, width: 1.sw),
                if (rcInterventionDetails.gripCaseReason != null)
                  _getPdfTitleValuePairTextElement(
                    ctx: bldctx,
                    title: appLocalizations.translate("reason_for_grip_case"),
                    description: "${rcInterventionDetails.gripCaseReason}",
                  ),
                if (rcInterventionDetails.gripCaseComment != null) pw.Container(height: 10, width: 1.sw),
                _getPdfTitleValuePairTextElement(
                  ctx: bldctx,
                  title: appLocalizations.translate("comments"),
                  description: "${rcInterventionDetails.gripCaseComment}",
                ),
                pw.Container(height: 40, width: 1.sw),
                _getPdfPageTitle(title: appLocalizations.translate("notice_of_passage")),
                pw.Container(height: 20, width: 1.sw),
                pw.Container(
                    width: 1.sw,
                    child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        // spacing: 20,
                        // runSpacing: 20,
                        children: [
                          if (rcInterventionDetails.noticeOfPassageImage1 != null)
                            _drawImage(
                              title: "Image 1",
                              filePath: "${rcInterventionDetails.noticeOfPassageImage1}",
                            ),
                          if (rcInterventionDetails.noticeOfPassageImage2 != null)
                            _drawImage(
                              title: "Image 2",
                              filePath: "${rcInterventionDetails.noticeOfPassageImage2}",
                            ),
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
                        if (rcInterventionDetails.displacementPhotoImage1 != null)
                          _drawImage(
                            title: "Image 1",
                            filePath: "${rcInterventionDetails.displacementPhotoImage1}",
                          ),
                        if (rcInterventionDetails.displacementPhotoImage2 != null)
                          _drawImage(
                            title: "Image 2",
                            filePath: "${rcInterventionDetails.displacementPhotoImage2}",
                          ),
                      ]),
                ),
              ],
            ];
          }));
      List<int> bytes = await document.save();
      // disposing all resources
      // document.dispose();
      return await saveAndReturnFile(bytes, "RC_Intervention_Output_${rcInterventionDetails.id}.pdf");
    } catch (e, stacktrace) {
      log("Error While generating PDF(RC Intervention) $e");
      log("GENERATING PDF ERROR ON LINE $stacktrace");
      return null;
    }
  }

  /// The Function [ _getPdfPageTitle ] will generate title
  static pw.Widget _getPdfPageTitle({required String title}) {
    return pw.Center(child: pw.Text("$title", style: pw.TextStyle(fontSize: 18.sp)));
  }

  /// The Function [ _getPdfTitleValuePairTextElement ] will generate title - value pair
  static pw.Widget _getPdfTitleValuePairTextElement({required String title, required BuildContext ctx, bool? value, String? description}) {
    final appLocalizations = AppLocalizations.of(ctx);

    return pw.Row(
      children: [
        pw.Expanded(child: pw.Text("$title", style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.black))),
        pw.Container(width: 0.04.sw),
        pw.Expanded(
            child: pw.Text("${description ?? (value == true ? (appLocalizations.translate("yes")) : (appLocalizations.translate("no")))}",
                textAlign: pw.TextAlign.right, style: pw.TextStyle(fontSize: 14.sp, color: PDF.PdfColors.blue))),
      ],
    );
  }

  /// The Function [ _drawImage ] will generate image - value pair
  static pw.Widget _drawImage({
    String? title,
    required String filePath,
  }) {
    final image = pw.MemoryImage(
      File('$filePath').readAsBytesSync(),
    );

    return pw.Column(children: [
      pw.Text("$title"),
      pw.Container(height: 10),
      pw.Container(
        width: 100,
        height: 100,
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        child: pw.Image(image, fit: pw.BoxFit.cover),
      )
    ]);
  }

  ///function for generating image without a title
  static pw.Widget _drawImageWithoutTitle({
    required String filePath,
  }) {
    final image = pw.MemoryImage(
      File('$filePath').readAsBytesSync(),
    );

    return pw.Column(children: [
      pw.Container(height: 10),
      pw.Container(
        width: 100,
        height: 100,
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        child: pw.Image(image, fit: pw.BoxFit.cover),
      )
    ]);
  }
}