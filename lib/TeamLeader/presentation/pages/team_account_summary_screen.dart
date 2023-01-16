import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/widgets/rc_custom_listTile_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/14_upload_intervention_pdf_screen.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/TeamLeader/data/model/team_leader_question_model.dart';
import 'package:imc/TeamLeader/utils/team_leader_pdf_util.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecordModel;

import '../../../../../core/constant/app_color.dart';
import '../../../../../common_widgets/custom_text.dart';

class TeamAccountSummaryScreen extends StatefulWidget {
  final teamLeaderInterventionModel.Records? teamLeaderInterventionRecords;
  final teamMemberInterventionRecordModel.Records? teamMemberInterventionRecords;
  final List<TeamLeaderQuestionModel> listOfQuestionsAnswers;
  const TeamAccountSummaryScreen(
      {Key? key, this.teamLeaderInterventionRecords, this.teamMemberInterventionRecords, required this.listOfQuestionsAnswers})
      : super(key: key);

  @override
  State<TeamAccountSummaryScreen> createState() => _TeamAccountSummaryScreenState();
}

class _TeamAccountSummaryScreenState extends State<TeamAccountSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(
                height: 0.2.sh,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                    color: AppColor.kSuccessColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        BackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: AppColor.kWhiteColor),
                        AppBoldText("Mr John Doe", color: AppColor.kWhiteColor, fontSize: 18.sp),
                        Text("")
                      ]),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.listOfQuestionsAnswers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(18.h),
                      child: Column(
                        children: [
                          RCCustomListTileLarge(
                            description: widget.listOfQuestionsAnswers[index].questionAnswer.toString(),
                            title: "Q${widget.listOfQuestionsAnswers[index].id}. " + widget.listOfQuestionsAnswers[index].questionAsked!,
                          ),
                          SizedBox(height: 20.h),
                          if (widget.listOfQuestionsAnswers[index].questionAnswer == false) ...[
                            AppBoldText("Photos", textAlign: TextAlign.center),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InterventionDetailsImageContainerWidget(
                                  disableOnTap: true,
                                  filePath: widget.listOfQuestionsAnswers[index].questionImage1,
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                InterventionDetailsImageContainerWidget(
                                  disableOnTap: true,
                                  filePath: widget.listOfQuestionsAnswers[index].questionImage2,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            AppBoldText(appLocalizatons.translate("explanations")),
                            SizedBox(height: 10.h),
                            AppRegularText(widget.listOfQuestionsAnswers[index].comment!),
                            SizedBox(height: 20.h),
                          ],
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => Divider(
                    thickness: 1,
                    color: AppColor.kBlackColor,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: AppColor.kWhiteColor,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: CommonRoundedButton(
                      btnText: appLocalizatons.translate("close_the_visit"),
                      color: AppColor.kPrimaryColor,
                      textColor: AppColor.kWhiteColor,
                      onPressed: () async {
                        String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
                        //generating pdf for all the VQD questions
                        var file = await TeamLeaderPdfUtil.generatePDFForQuestions(widget.listOfQuestionsAnswers);
                        if (file != null) {
                          /*
                               navigating to uplodad pdf screen according to if we are coming from team members screen's
                               or if we are coming from team leader's home screen (planning day /planning week/ planning month)
                             */
                          if (widget.teamLeaderInterventionRecords != null) {
                            //navigating to upload pdf screen with team leader flow
                            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) {
                              return UploadInterventionPdfScreen(
                                isTeamLeader: true,
                                teamLeaderInterventionRecords: widget.teamLeaderInterventionRecords,
                                teamLeaderEndInterventionTime: formattedDateTime,
                                pdfFile: file,
                                isRc: false,
                                isGrip: false,
                                isForceGrip: false,
                              );
                            }));
                          } else if (widget.teamMemberInterventionRecords != null) {
                            //navigating to upload pdf screen with team member(the intervention will also done by the team leader) flow
                            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) {
                              return UploadInterventionPdfScreen(
                                isTeamLeader: true,
                                teamMemberInterventionRecords: widget.teamMemberInterventionRecords,
                                teamLeaderEndInterventionTime: formattedDateTime,
                                pdfFile: file,
                                isRc: false,
                                isGrip: false,
                                isForceGrip: false,
                              );
                            }));
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0.175.sh,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)], borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: AppBoldText(appLocalizatons.translate("account_page_name"), color: AppColor.kSuccessColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}