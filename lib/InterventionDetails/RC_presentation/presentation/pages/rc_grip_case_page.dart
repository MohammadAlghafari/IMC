import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/rc_intervention_details_page_helpers/rc_intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/utils/rc_intervention_pdf_util.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/rc_intervention_details_cubit/rc_intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/14_upload_intervention_pdf_screen.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_selection_container_n_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/widgets/bottom_sheets/intervention_questions_bottom_sheet.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:intl/intl.dart';

class ReportingRCGripCasePage extends StatelessWidget {
  final Records interventionRecord;
  final bool isForceGrip;
  ReportingRCGripCasePage({Key? key, required this.isForceGrip, required this.interventionRecord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: BlocBuilder<RCInterventionDetailsCubit, RCInterventionDetailsState>(
        builder: (context, state) {
          if (state is RCInterventionDetailsLoaded) {
            RCInterventionDetailsModel? _rcInterventionDetails = state.rcInterventionDetails;
            return Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                        color: AppColor.kPrimaryColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.r), bottomRight: Radius.circular(25.r))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).viewPadding.top,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            BackButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            AppBoldText("${interventionRecord.client?.firstname}", color: AppColor.kWhiteColor, fontSize: 18),
                            Text(""),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 0.03.sh, horizontal: 0.1.sw),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppBoldText("(RC) " + appLocalizations.translate("reporting_a_grip_case")),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            InterventionDetailsSelectionContainer(
                              listOfItems: [
                                appLocalizations.translate("customer_request_appointment_modification"),
                                appLocalizations.translate("missing_hardware"),
                                appLocalizations.translate("accessibility_counter_error"),
                                appLocalizations.translate("absent_customer"),
                                appLocalizations.translate("customer_refusal"),
                                appLocalizations.translate("linky_already_laid"),
                              ],
                              hint: appLocalizations.translate("select_the_situation"),
                              value: _rcInterventionDetails.gripCaseReason,
                              onBtnPressed: (String? value) {
                                String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
                                var rcInterventionDetails = _rcInterventionDetails.copyWith(
                                    gripCaseReason: value, startTimeOfIntervention: formattedDateTime, isGripCase: true);
                                RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                              },
                            ),
                            SizedBox(height: 0.04.sh),
                            AppBoldText(appLocalizations.translate("notice_of_passage")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InterventionDetailsImageContainerWidget(
                                  filePath: _rcInterventionDetails.noticeOfPassageImage1,
                                  onImageSelected: (String? filePath) {
                                    var rcInterventionDetails = _rcInterventionDetails.copyWith(noticeOfPassageImage1: filePath);
                                    RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                                  },
                                ),
                                InterventionDetailsImageContainerWidget(
                                  filePath: _rcInterventionDetails.noticeOfPassageImage2,
                                  onImageSelected: (String? filePath) {
                                    var rcInterventionDetails = _rcInterventionDetails.copyWith(noticeOfPassageImage2: filePath);
                                    RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 0.02.sh),
                            AppBoldText(appLocalizations.translate("displacement_photo")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InterventionDetailsImageContainerWidget(
                                  filePath: _rcInterventionDetails.displacementPhotoImage1,
                                  onImageSelected: (String? filePath) {
                                    var rcInterventionDetails = _rcInterventionDetails.copyWith(displacementPhotoImage1: filePath);
                                    RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                                  },
                                ),
                                InterventionDetailsImageContainerWidget(
                                  filePath: _rcInterventionDetails.displacementPhotoImage2,
                                  onImageSelected: (String? filePath) {
                                    var rcInterventionDetails = _rcInterventionDetails.copyWith(displacementPhotoImage2: filePath);
                                    RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 0.04.sh),
                            AppBoldText(appLocalizations.translate("comment")),
                            SizedBox(height: 0.02.sh),
                            InterventionDetailsTextFieldLarge(
                              initialText: _rcInterventionDetails.gripCaseComment,
                              hintText: appLocalizations.translate("type_your_comment_here"),
                              onChanged: (String value) {
                                var rcInterventionDetails = _rcInterventionDetails.copyWith(gripCaseComment: value);
                                RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.06.sw),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonRoundedButton(
                              color: AppColor.kPrimaryColor,
                              btnText: appLocalizations.translate("next"),
                              textColor: Colors.white,
                              onPressed: _disableButton(_rcInterventionDetails)
                                  ? null
                                  : () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                //saving all grip case pages values
                                saveDataIntoDatabase(context, _rcInterventionDetails);

                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => InterventionQuestionBottomSheet(
                                      sheetTitle: appLocalizations.translate("are_you_sure_to_send_grip_case_bottom_sheet") +
                                          " ${interventionRecord.client?.firstname}?",
                                      onYesPressed: () async {
                                        String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
                                        var rcInterventionDetails = _rcInterventionDetails.copyWith(endTimeOfIntervention: formattedDateTime);
                                        RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                                        saveDataIntoDatabase(context, rcInterventionDetails);
                                        //generating pdf with all rc grip case values
                                        try {
                                          File? file = await RCInterventionPdfUtil.generatePDF(
                                            rcInterventionDetails: rcInterventionDetails,
                                            bldctx: context,
                                            selectedPageIdVal: 5,
                                            isGripCase: true,
                                          );
                                          //navigating to upload pdf screen after generating pdf
                                          if (file != null) {
                                            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) {
                                              return UploadInterventionPdfScreen(
                                                rcIntervention: rcInterventionDetails,
                                                pdfFile: file,
                                                interventionRecord: interventionRecord,
                                                isRc: true,
                                                isForceGrip: isForceGrip,
                                                isGrip: true,
                                              );
                                            }));
                                          }
                                        } catch (e) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
                                        }
                                      },
                                      onNoPressed: () {
                                        Navigator.pop(context);
                                      }),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else
            return SizedBox.shrink();
        },
      ),
    );
  }

  ///[_disableButton] will keep the 'next' button disable until all fields of grip case page are filled
  bool _disableButton(RCInterventionDetailsModel _rcInterventionDetails) {
    if (_rcInterventionDetails.gripCaseReason == null ||
        _rcInterventionDetails.noticeOfPassageImage1 == null ||
        _rcInterventionDetails.noticeOfPassageImage2 == null ||
        _rcInterventionDetails.displacementPhotoImage1 == null ||
        _rcInterventionDetails.displacementPhotoImage2 == null ||
        _rcInterventionDetails.gripCaseComment == null ||
        _rcInterventionDetails.gripCaseComment == "") {
      return true;
    }
    return false;
  }

  /// [saveDataIntoDatabase] will save grip case data into local database
  void saveDataIntoDatabase(BuildContext context, RCInterventionDetailsModel rcInterventionDetails) {
    final _interventionDetailsDatabase = GetIt.I<InterventionDetailsDatabase>();
    _interventionDetailsDatabase.insertRCInterventionIntoLocalDb(RCInterventionDetailsModel(
      id: interventionRecord.id,
      startTimeOfIntervention: rcInterventionDetails.startTimeOfIntervention,
      endTimeOfIntervention: rcInterventionDetails.endTimeOfIntervention,
      latitude: rcInterventionDetails.latitude,
      longitude: rcInterventionDetails.longitude,
      isGripCase: rcInterventionDetails.isGripCase,
      gripCaseReason: rcInterventionDetails.gripCaseReason,
      noticeOfPassageImage1: rcInterventionDetails.noticeOfPassageImage1,
      noticeOfPassageImage2: rcInterventionDetails.noticeOfPassageImage2,
      displacementPhotoImage1: rcInterventionDetails.displacementPhotoImage1,
      displacementPhotoImage2: rcInterventionDetails.displacementPhotoImage2,
      gripCaseComment: rcInterventionDetails.gripCaseComment,
    ));
  }
}