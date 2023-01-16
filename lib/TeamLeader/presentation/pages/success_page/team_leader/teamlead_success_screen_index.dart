import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/internal_pages/customer_intervention_history_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/0_get_technician_location_map_screen.dart';
import 'package:imc/InterventionDetails/presentation/widgets/bottom_sheets/intervention_questions_bottom_sheet.dart';
import 'package:imc/TeamLeader/data/local_database/team_leader_hive_helper.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionRecordModel;

import 'package:imc/TeamLeader/presentation/pages/success_page/team_leader/internal_pages/success_details_widget.dart';
import 'package:imc/TeamLeader/presentation/pages/success_page/team_leader/internal_pages/success_report_widget.dart';
import 'package:imc/TeamLeader/presentation/pages/team_leader_vqd_screens/teamlead_vqd_screen.dart';
import 'package:imc/TeamLeader/utils/team_lead_flow_vqd_constants.dart';
import 'package:imc/common_widgets/common_chip_widget.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/core/utils/permission_utils.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../core/constant/app_color.dart';
import '../../../../../../../../common_widgets/custom_text.dart';

class TeamLeadSuccessScreenIndex extends StatefulWidget {
  final teamLeaderInterventionRecordModel.Records
  teamLeaderinterventionRecords;
  /*[isTodos] is  used to check if we are navigating to a completed intervention or not, if we
  the intervention is completed then we don't want to show the history tab in the 'TeamLeadSuccessScreenIndex'
  */
  final bool isTodos;

  TeamLeadSuccessScreenIndex({Key? key, required this.isTodos, required this.teamLeaderinterventionRecords, })
      : super(key: key);

  @override
  State<TeamLeadSuccessScreenIndex> createState() => _TeamLeadSuccessScreen();
}

class _TeamLeadSuccessScreen extends State<TeamLeadSuccessScreenIndex> {
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
          child: CommonRoundedButton(
            onPressed: () {
              // If Location permission is not given then ask for location permission
              PermissionHelperFunctions.enableLocation(context, () async {
                LatLng? userLocation = await Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                  return GetTechnicianLocationMapScreen();
                }));
                if (userLocation != null) {
                  saveTimeAndLocationInLocalDB(userLocation);
                  //after saving the the loation in local DB showing Intervention's Questions Bottom Sheet
                  TeamLeadBottomSheets.showInterventionQuestionsBottomSheet(context, widget.teamLeaderinterventionRecords);
                }
              });
            },
            btnText: appLocalizatons.translate("start_the_tour"),
            color: AppColor.kPrimaryColor,
            textColor: AppColor.kWhiteColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
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
                      if (widget.isTodos == false) SuccessReportWidget(interventionRecord: widget.teamLeaderinterventionRecords),
                      SuccessDetailsWidget(teamLeaderinterventionRecords: widget.teamLeaderinterventionRecords),
                      CustomerInterventionHistoryWidget(teamLeaderinterventionRecords: widget.teamLeaderinterventionRecords),
                    ]),
              ),
            ],
          ),
          Positioned(
            top: 0.145.sh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ],
      ),
    );
  }
}

class TeamLeadBottomSheets {
  /// function to show bottom sheets (with team-lead questions) and navigating according to the selected flow
  static void showInterventionQuestionsBottomSheet(BuildContext context, teamLeaderInterventionRecordModel.Records teamLeaderInterventionRecord) {
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
                                      teamLeaderIntervention: teamLeaderInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterAccessible,
                                    )));
                          },
                          onNoPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'aPosterioriClientPresentMeterNotAccessible'
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamLeaderIntervention: teamLeaderInterventionRecord,
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
                                      teamLeaderIntervention: teamLeaderInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterAccessible,
                                    )));
                          },
                          onNoPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'aPosterioriClientAbsentMeterNotAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamLeaderIntervention: teamLeaderInterventionRecord,
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
                  btnText: "Simultané",
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
                                      teamLeaderIntervention: teamLeaderInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.simultaneeClientPresentMeterAccessible,
                                    )));
                          },
                          onNoPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'simultaneeClientPresentMeterNotAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamLeaderIntervention: teamLeaderInterventionRecord,
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
                                      teamLeaderIntervention: teamLeaderInterventionRecord,
                                      flow: TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterAccessible,
                                    )));
                          },
                          onNoPressed: () {
                            //navigating to the 'Team Lead VQD Screen' with flow value 'simultaneeClientAbsentMeterNotAccessible'

                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => TeamLeadVQScreen(
                                      teamLeaderIntervention: teamLeaderInterventionRecord,
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