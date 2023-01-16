import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/internal_pages/customer_intervention_history_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/0_get_technician_location_map_screen.dart';
import 'package:imc/InterventionDetails/presentation/widgets/bottom_sheets/intervention_questions_bottom_sheet.dart';
import 'package:imc/TeamLeader/data/local_database/team_leader_hive_helper.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecordModel;

import 'package:imc/TeamLeader/presentation/pages/success_page/team_member/internal_pages/team_member_details_widget.dart';
import 'package:imc/TeamLeader/presentation/pages/success_page/team_member/internal_pages/team_member_success_report_widget.dart';
import 'package:imc/TeamLeader/presentation/pages/team_leader_vqd_screens/teamlead_vqd_screen.dart';
import 'package:imc/TeamLeader/utils/team_lead_flow_vqd_constants.dart';
import 'package:imc/common_widgets/common_chip_widget.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/core/utils/permission_utils.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constant/app_color.dart';
import '../../../../../../common_widgets/custom_text.dart';

class TeamMemberSuccessScreenIndex extends StatefulWidget {
  final teamMemberInterventionRecordModel.Records? teamMemberInterventionRecords;
  /*[isTodos] is  used to check if we are navigating to a completed intervention or not, if we
  the intervention is completed then we don't want to show the history tab in the 'TeamLeadSuccessScreenIndex'
  */
  final bool isTodos;

  TeamMemberSuccessScreenIndex({Key? key, required this.isTodos, required this.teamMemberInterventionRecords}) : super(key: key);

  @override
  State<TeamMemberSuccessScreenIndex> createState() => _TeamMemberSuccessScreen();
}

class _TeamMemberSuccessScreen extends State<TeamMemberSuccessScreenIndex> {
  PageController pageController = PageController(initialPage: 0);
  int _index = 0;

  ///[saveTimeAndLocationInLocalDB] will save the 'intervention start time', 'latitude' and 'longitude' in local Hive DB
  void saveTimeAndLocationInLocalDB(LatLng userLocation) {
    String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    TeamLeaderHiveHelper.saveInterventionStartTime(formattedDateTime);
    TeamLeaderHiveHelper.saveLatitude(userLocation.latitude.toString());
    TeamLeaderHiveHelper.saveLongitude(userLocation.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);
    return Scaffold(
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            // child: CommonRoundedButton(
            //   onPressed: () {
            //     print("visit id for team member : ${widget.teamMemberInterventionRecords?.visitId}");
            //     // If Location permission is not given then ask for location permission
            //     PermissionHelperFunctions.enableLocation(context, () async {
            //       LatLng? userLocation = await Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
            //         return GetTechnicianLocationMapScreen();
            //       }));
            //       if (userLocation != null) {
            //         saveTimeAndLocationInLocalDB(userLocation);
            //         //after saving the the loation in local DB showing Intervention's Questions Bottom Sheet
            //         TeamLeadBottomSheets.showInterventionQuestionsBottomSheet(context, widget.teamMemberInterventionRecords!);
            //       }
            //     });
            //   },
            //   btnText: appLocalizatons.translate("start_the_tour"),
            //   color: AppColor.kPrimaryColor,
            //   textColor: AppColor.kWhiteColor,
            // )
            //TODO: use this child widget after testing
            child: (widget.teamMemberInterventionRecords?.visitId != null)
                ? CommonRoundedButton(
              onPressed: () {
                print("visit id for team member : ${widget.teamMemberInterventionRecords?.visitId}");
                // If Location permission is not given then ask for location permission
                PermissionHelperFunctions.enableLocation(context, () async {
                  LatLng? userLocation = await Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                    return GetTechnicianLocationMapScreen();
                  }));
                  if (userLocation != null) {
                    saveTimeAndLocationInLocalDB(userLocation);
                    //after saving the the loation in local DB showing Intervention's Questions Bottom Sheet
                    TeamLeadBottomSheets.showInterventionQuestionsBottomSheet(context, widget.teamMemberInterventionRecords!);
                  }
                });
              },
              btnText: appLocalizatons.translate("start_the_tour"),
              color: AppColor.kPrimaryColor,
              textColor: AppColor.kWhiteColor,
            )
                : null),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Container(
            height: 0.17.sh,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                color: AppColor.kSuccessColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    BackButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: AppColor.kWhiteColor),
                    AppBoldText("Mr John Doe", color: AppColor.kWhiteColor, fontSize: 18.sp),
                    Text("")
                    // Image.asset(AppIcons.gps, scale: 3.3),
                  ]),
                ],
              ),
            ),
          ),
          Container(
            // top: 0.145.sh,
            child: Transform.translate(
              offset: Offset(0.0, -0.02.sh),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.isTodos == false)
                    ChipWidget(
                      pageControllerVal: pageController,
                      animateToPage: 0,
                      text: appLocalizatons.translate("report"),
                      containerColor: _index == 0 ? Color(0xff363535) : AppColor.kWhiteColor,
                      textColor: _index == 0 ? AppColor.kWhiteColor : Color(0xff363535),
                    ),
                  SizedBox(width: 10.h),
                  ChipWidget(
                    pageControllerVal: pageController,
                    animateToPage: (widget.isTodos == false) ? 1 : 0,
                    text: appLocalizatons.translate("details"),
                    containerColor: (widget.isTodos)
                        ? (_index == 0 ? Color(0xff363535) : AppColor.kWhiteColor)
                        : (_index == 1 ? Color(0xff363535) : AppColor.kWhiteColor),
                    textColor: (widget.isTodos)
                        ? (_index == 0 ? AppColor.kWhiteColor : Color(0xff363535))
                        : (_index == 1 ? AppColor.kWhiteColor : Color(0xff363535)),
                  ),
                  SizedBox(width: 10.h),
                  if (widget.teamMemberInterventionRecords?.visitId != null)
                    ChipWidget(
                      pageControllerVal: pageController,
                      animateToPage: (widget.isTodos == false) ? 2 : 1,
                      text: appLocalizatons.translate("history"),
                      containerColor: (widget.isTodos)
                          ? (_index == 1 ? Color(0xff363535) : AppColor.kWhiteColor)
                          : (_index == 2 ? Color(0xff363535) : AppColor.kWhiteColor),
                      textColor: (widget.isTodos)
                          ? (_index == 1 ? AppColor.kWhiteColor : Color(0xff363535))
                          : (_index == 2 ? AppColor.kWhiteColor : Color(0xff363535)),
                    ),
                ],
              ),
            ),
          ),

          SizedBox(height: 5.h),
          Expanded(
            child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                controller: pageController,
                children: [
                  if (widget.isTodos == false) TeamMemberSuccessReportWidget(teamMemberinterventionRecord: widget.teamMemberInterventionRecords!),
                  TeamMemberSuccessDetailsWidget(teamMemberInterventionRecords: widget.teamMemberInterventionRecords),
                  if (widget.teamMemberInterventionRecords?.visitId != null)
                    CustomerInterventionHistoryWidget(
                      teamMemberInterventionRecords: widget.teamMemberInterventionRecords,
                    ),
                ]),
          ),
        ],
      ),
    );
  }
}

class TeamLeadBottomSheets {
  /// function to show bottom sheets (with team-lead questions) and navigating according to the selected flow
  static void showInterventionQuestionsBottomSheet(BuildContext context, teamMemberInterventionRecordModel.Records teamMemberInterventionRecord) {
    final appLocalizatons = AppLocalizations.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 0.25.sh,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 0.09.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBoldText(
              appLocalizatons.translate("when_do_you_want_to_intervene"),
              fontSize: 18.sp,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonRoundedButton(
                  color: AppColor.kSuccessColor,
                  textColor: Colors.white,
                  btnText: "A posteriori",
                  onPressed: () {
                    showYesNoBottomSheet(
                      context: context,
                      sheetTitle: appLocalizatons.translate("is_the_customer_present?"),
                      onYesPressed: () {
                        showYesNoBottomSheet(
                          context: context,
                          sheetTitle: appLocalizatons.translate("is_the_meter_accessible?"),
                          onYesPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'aPosterioriClientPresentMeterAccessible'
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamMemberIntervention: teamMemberInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterAccessible,
                                    )));
                          },
                          onNoPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'aPosterioriClientPresentMeterNotAccessible'
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamMemberIntervention: teamMemberInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterNotAccessible,
                                    )));
                          },
                        );
                      },
                      onNoPressed: () {
                        showYesNoBottomSheet(
                          context: context,
                          sheetTitle: appLocalizatons.translate("is_the_meter_accessible?"),
                          onYesPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'aPosterioriClientAbsentMeterAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamMemberIntervention: teamMemberInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterAccessible,
                                    )));
                          },
                          onNoPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'aPosterioriClientAbsentMeterNotAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamMemberIntervention: teamMemberInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterNotAccessible,
                                    )));
                          },
                        );
                      },
                    );
                  },
                ),
                SizedBox(width: 0.06.sw),
                CommonRoundedButton(
                  btnText: "Simultanee",
                  textColor: Colors.white,
                  color: AppColor.kCaseColor,
                  onPressed: () {
                    showYesNoBottomSheet(
                      context: context,
                      sheetTitle: appLocalizatons.translate("is_the_customer_present?"),
                      onYesPressed: () {
                        showYesNoBottomSheet(
                          context: context,
                          sheetTitle: appLocalizatons.translate("is_the_meter_accessible?"),
                          onYesPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'simultaneeClientPresentMeterAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamMemberIntervention: teamMemberInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.simultaneeClientPresentMeterAccessible,
                                    )));
                          },
                          onNoPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'simultaneeClientPresentMeterNotAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamMemberIntervention: teamMemberInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.simultaneeClientPresentMeterNotAccessible,
                                    )));
                          },
                        );
                      },
                      onNoPressed: () {
                        showYesNoBottomSheet(
                          context: context,
                          sheetTitle: appLocalizatons.translate("is_the_meter_accessible?"),
                          onYesPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'simultaneeClientAbsentMeterAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamMemberIntervention: teamMemberInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterAccessible,
                                    )));
                          },
                          onNoPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'simultaneeClientAbsentMeterNotAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamMemberIntervention: teamMemberInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterNotAccessible,
                                    )));
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///common bottom sheet for all questions
  static void showYesNoBottomSheet(
      {required BuildContext context, required String sheetTitle, required Function onYesPressed, required Function onNoPressed}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => InterventionQuestionBottomSheet(sheetTitle: sheetTitle, onYesPressed: onYesPressed, onNoPressed: onNoPressed),
    );
  }
}