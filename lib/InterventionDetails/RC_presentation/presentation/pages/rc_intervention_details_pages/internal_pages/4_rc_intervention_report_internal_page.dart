import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/rc_intervention_details_page_helpers/rc_intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/utils/rc_intervention_details_utils.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/utils/rc_intervention_pdf_util.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/widgets/rc_custom_listTile_large.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/rc_intervention_details_cubit/rc_intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/14_upload_intervention_pdf_screen.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_help_details_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/widgets/custom_details_list_tile.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:intl/intl.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/app_localizations.dart';

class RCInterventionReportInternalPage extends StatelessWidget {
  final int selectedPageVal;
  final Records interventionRecordVal;
  const RCInterventionReportInternalPage({Key? key, required this.selectedPageVal, required this.interventionRecordVal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<RCInterventionDetailsCubit, RCInterventionDetailsState>(
      builder: (context, state) {
        if (state is RCInterventionDetailsLoaded) {
          RCInterventionDetailsModel _rcInterventionDetails = state.rcInterventionDetails;
          return Scaffold(
            body: Stack(alignment: Alignment.topCenter, children: [
              Column(
                children: [
                  Container(
                    height: 0.16.sh,
                    padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                      color: AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.w),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        BackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: AppColor.kWhiteColor),
                        AppBoldText("Mr John Doe", color: AppColor.kWhiteColor, fontSize: 18),
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => InterventionHelpDetailsBottomSheet(isForceGrip: true,isRc: true,interventionRecords: interventionRecordVal),
                              );
                            },
                            child: Image.asset(AppIcons.help, scale: 3.5)),
                      ]),
                    ),
                  ),
                  Expanded(
                    // height: 0.75.sh,
                    child: SingleChildScrollView(

                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            AppBoldText("RC Intervention", fontSize: 16),
                            SizedBox(height: 20),
                            CustomDetailsListTile(title: appLocalizations.translate("gps_coordinates"), description: "48.8566 N, 2.3522 E"),
                            SizedBox(height: 10),
                            CustomDetailsListTile(title: "Roding", description: "00/00/0000 00:00"),
                            SizedBox(height: 10),
                            Divider(color: AppColor.kPrimaryColor, height: 2),

                            // Meter Reprogramming page
                            selectedPageVal == RCInterventionDetailsUtils.MeterReprogrammngPageId
                                ? Column(
                              children: [
                                SizedBox(height: 0.03.sh),
                                AppBoldText(appLocalizations.translate("meter_reprogramming"), fontSize: 16.sp),
                                SizedBox(height: 0.02.sh),
                                CustomDetailsListTile(
                                  title: appLocalizations.translate("did_you_reprogram_meter"),
                                  description: "${_rcInterventionDetails.confirmMeterReprogramming}",
                                ),
                                SizedBox(height: 0.02.sh),
                                RCCustomListTileLarge(
                                  title: appLocalizations.translate("additional_information"),
                                  description: "${_rcInterventionDetails.additionalInfoOfMeterReprogramming}",
                                ),
                                Wrap(
                                  spacing: 0.1.sw,
                                  children: [
                                    InterventionDetailsImageContainerWidget(
                                      disableOnTap: true,
                                      title: "Image 1",
                                      filePath: "${_rcInterventionDetails.meterReprogrammingImage1}",
                                    ),
                                    InterventionDetailsImageContainerWidget(
                                      disableOnTap: true,
                                      title: "Image 2",
                                      filePath: "${_rcInterventionDetails.meterReprogrammingImage2}",
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0.03.sh),
                                Divider(color: AppColor.kPrimaryColor, height: 2),
                                SizedBox(height: 0.03.sh),
                              ],
                            )
                                : SizedBox.shrink(),

                            // Test Of Enslavement Page
                            selectedPageVal == RCInterventionDetailsUtils.EnslavementTestPageId
                                ? Column(
                              children: [
                                SizedBox(height: 0.03.sh),
                                AppBoldText(appLocalizations.translate("enslavement_test"), fontSize: 16.sp),
                                SizedBox(height: 0.02.sh),
                                RCCustomListTileLarge(
                                  title: appLocalizations.translate("did_you_test_for_enslavement"),
                                  description: "${_rcInterventionDetails.confirmEnslavementTest}",
                                ),
                                SizedBox(height: 0.02.sh),
                                RCCustomListTileLarge(
                                  title: appLocalizations.translate("additional_information"),
                                  description: "${_rcInterventionDetails.additionalInfoOfEnslavementTest}",
                                ),
                                Wrap(
                                  spacing: 0.1.sw,
                                  children: [
                                    InterventionDetailsImageContainerWidget(
                                      disableOnTap: true,
                                      title: "Image 1",
                                      filePath: "${_rcInterventionDetails.meterEnslavementTestImage1}",
                                    ),
                                    InterventionDetailsImageContainerWidget(
                                      disableOnTap: true,
                                      title: "Image 2",
                                      filePath: "${_rcInterventionDetails.meterEnslavementTestImage2}",
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0.03.sh),
                                Divider(color: AppColor.kPrimaryColor, height: 2),
                                SizedBox(height: 0.03.sh),
                              ],
                            )
                                : SizedBox.shrink(),

                            //Other Action Page
                            selectedPageVal == RCInterventionDetailsUtils.OtherActionsPageId
                                ? Column(
                              children: [
                                SizedBox(height: 0.03.sh),
                                AppBoldText(appLocalizations.translate("other_actions"), fontSize: 16.sp),
                                CustomDetailsListTile(
                                  title: appLocalizations.translate("specify_your_action"),
                                  description: "${_rcInterventionDetails.specifyYourAction}",
                                ),
                                AppBoldText("Photos"),
                                Wrap(
                                  spacing: 0.1.sw,
                                  children: [
                                    ..._rcInterventionDetails.photosOfAction!.map(
                                          (filePath) => InterventionDetailsImageContainerWidget(
                                        disableOnTap: true,
                                        filePath: "${filePath}",
                                      ),
                                    )
                                  ],
                                ),
                                RCCustomListTileLarge(
                                  title: appLocalizations.translate("additional_information"),
                                  description: "${_rcInterventionDetails.additionalInfoOfActions}",
                                ),
                              ],
                            )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.06.sw),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonRoundedButton(
                            color: AppColor.kPrimaryColor,
                            btnText: appLocalizations.translate("finish"),
                            textColor: Colors.white,
                            onPressed: () async {

                              String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());


                              //saving end time of intervention  into the RC intervention bloc
                              var rcInterventionDetails = _rcInterventionDetails.copyWith(endTimeOfIntervention:formattedDateTime);
                              RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                              //when 'Finish' btn is enabled and pressed,save the data locally
                              RCInterventionDetailsHelperFunctions.saveRCDataIntoDatabase(rcInterventionDetails: rcInterventionDetails,selectedPage: RCInterventionDetailsUtils.ReportPageId);

                              //generating pdf according to passed rc intervention page
                              File? file = await RCInterventionPdfUtil.generatePDF(
                                rcInterventionDetails: rcInterventionDetails,
                                bldctx: context,
                                selectedPageIdVal: selectedPageVal,
                                isGripCase: false,
                              );

                              //navigating to upload pdf screen after pdf generation
                              if (file != null) {
                                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext ctx) {
                                  return UploadInterventionPdfScreen(
                                    rcIntervention: rcInterventionDetails,
                                    isRc: true,
                                    pdfFile: file,
                                    interventionRecord: interventionRecordVal,
                                    isGrip: false,
                                    isForceGrip: false,
                                  );
                                }));

                              } else
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some Error Occurred")));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0.14.sh,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)], borderRadius: BorderRadius.circular(25), color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: AppBoldText(appLocalizations.translate("report"), color: AppColor.kSuccessColor, fontSize: 12),
                    ),
                  ),
                ),
              ),

            ]),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}