import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/14_upload_intervention_pdf_screen.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_selection_container_n_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_pdf_util.dart';
import 'package:imc/InterventionDetails/presentation/widgets/bottom_sheets/intervention_questions_bottom_sheet.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:intl/intl.dart';

class ReportingAGripCasePage extends StatelessWidget {
  final Records interventionRecord;
  final bool isForceGrip;
  ReportingAGripCasePage({Key? key, required this.interventionRecord, required this.isForceGrip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
        builder: (context, state) {
          if (state is InterventionDetailsLoaded) {
            InterventionDetailsModel? _interventionDetails = state.interventionDetails;
            return Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                        color: AppColor.kPrimaryColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
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
                            AppBoldText(appLocalizations.translate("reporting_a_grip_case")),
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
                              value: _interventionDetails.gripCaseReason,
                              onBtnPressed: (String? value) {
                                String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
                                var interventionDetails = _interventionDetails.copyWith(
                                    isGripCase: true, gripCaseReason: value, startTimeOfIntervention: formattedDateTime);
                                InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                              },
                            ),
                            SizedBox(height: 0.04.sh),
                            AppBoldText(appLocalizations.translate("notice_of_passage")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InterventionDetailsImageContainerWidget(
                                  filePath: _interventionDetails.noticeOfPassageImage1,
                                  onImageSelected: (String? filePath) {
                                    var interventionDetails = _interventionDetails.copyWith(noticeOfPassageImage1: filePath);
                                    InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                  },
                                ),
                                InterventionDetailsImageContainerWidget(
                                  filePath: _interventionDetails.noticeOfPassageImage2,
                                  onImageSelected: (String? filePath) {
                                    var interventionDetails = _interventionDetails.copyWith(noticeOfPassageImage2: filePath);
                                    InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
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
                                  filePath: _interventionDetails.displacementPhotoImage1,
                                  onImageSelected: (String? filePath) {
                                    var interventionDetails = _interventionDetails.copyWith(displacementPhotoImage1: filePath);
                                    InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                  },
                                ),
                                InterventionDetailsImageContainerWidget(
                                  filePath: _interventionDetails.displacementPhotoImage2,
                                  onImageSelected: (String? filePath) {
                                    var interventionDetails = _interventionDetails.copyWith(displacementPhotoImage2: filePath);
                                    InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 0.04.sh),
                            AppBoldText(appLocalizations.translate("comment")),
                            SizedBox(height: 0.02.sh),
                            InterventionDetailsTextFieldLarge(
                              initialText: _interventionDetails.gripCaseComment,
                              onChanged: (String value) {
                                var interventionDetails = _interventionDetails.copyWith(gripCaseComment: value);
                                InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
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
                              onPressed: _disableButton(_interventionDetails)
                                  ? null
                                  : () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                saveDataIntoDatabase(context, _interventionDetails);
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => InterventionQuestionBottomSheet(
                                      sheetTitle: appLocalizations.translate("are_you_sure_to_send_grip_case_bottom_sheet") +
                                          " ${interventionRecord.client?.firstname}?",
                                      onYesPressed: () async {
                                        String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
                                        var interventionDetails = _interventionDetails.copyWith(endTimeOfIntervention: formattedDateTime);

                                        //saving the inputted grip case page values in intervention bloc and in local database
                                        InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                        saveDataIntoDatabase(context, interventionDetails);

                                        try {
                                          //generating pdf for normal intervention grip or force grip case
                                          File? file = await InterventionPdfUtil.generatePDF(
                                              interventionDetails: _interventionDetails, bldCtx: context, isGripCase: true);
                                          if (file != null) {
                                            //navigating to upload pdf screen, after pdf generation
                                            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) {
                                              return UploadInterventionPdfScreen(
                                                normalInterventionDetails: interventionDetails,
                                                pdfFile: file,
                                                interventionRecord: interventionRecord,
                                                isRc: false,
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

  bool _disableButton(InterventionDetailsModel _interventionDetails) {
    if (_interventionDetails.gripCaseReason == null ||
        _interventionDetails.noticeOfPassageImage1 == null ||
        _interventionDetails.noticeOfPassageImage2 == null ||
        _interventionDetails.displacementPhotoImage1 == null ||
        _interventionDetails.displacementPhotoImage2 == null ||
        _interventionDetails.gripCaseComment == null ||
        (_interventionDetails.gripCaseComment != null && _interventionDetails.gripCaseComment!.isEmpty)) {
      return true;
    }
    return false;
  }

  // save grip case data into database
  void saveDataIntoDatabase(BuildContext context, InterventionDetailsModel interventionDetails) {
    final _interventionDetailsDatabase = GetIt.I<InterventionDetailsDatabase>();
    _interventionDetailsDatabase.insertInterventionIntoLocalDb(InterventionDetailsModel(
      id: interventionRecord.id,
      startTimeOfIntervention: interventionDetails.startTimeOfIntervention,
      endTimeOfIntervention: interventionDetails.endTimeOfIntervention,
      isGripCase: interventionDetails.isGripCase,
      gripCaseReason: interventionDetails.gripCaseReason,
      noticeOfPassageImage1: interventionDetails.noticeOfPassageImage1,
      noticeOfPassageImage2: interventionDetails.noticeOfPassageImage2,
      displacementPhotoImage1: interventionDetails.displacementPhotoImage1,
      displacementPhotoImage2: interventionDetails.displacementPhotoImage2,
      gripCaseComment: interventionDetails.gripCaseComment,
    ));
  }
}