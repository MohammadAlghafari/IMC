import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/TeamLeader/data/model/team_leader_team_members_model.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_member/cubit/team_member_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/pages/technicien_details_screen/details_screen_realized_widget.dart';
import 'package:imc/TeamLeader/presentation/pages/technicien_details_screen/details_screen_todo_widget.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecord;
import 'package:imc/TeamLeader/presentation/pages/technicien_details_screen/technicien_planning_month_widget.dart';
import 'package:imc/TeamLeader/presentation/pages/technicien_details_screen/technicien_planning_week.dart';
import 'package:imc/common_widgets/common_chip_widget.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_localizations.dart';
import '../../../../../../core/constant/app_color.dart';
import '../../../../../../common_widgets/custom_text.dart';

class TeamTechnicienDetailsScreen extends StatefulWidget {
  final Records teamMemberRecord;
  const TeamTechnicienDetailsScreen({Key? key, required this.teamMemberRecord}) : super(key: key);

  @override
  State<TeamTechnicienDetailsScreen> createState() => _TeamTechnicienDetailsScreen();
}

//Values will be used in if-check for filtering of page(show daily or weekly or monthly data of the technician)
class TeamMemberPages {
  static String dayWise = "Day";
  static String weekWise = "Week";
  static String monthWise = "Month";
}

class _TeamTechnicienDetailsScreen extends State<TeamTechnicienDetailsScreen> {
  PageController pageController = PageController(initialPage: 0);

  int _index = 0;

  /*var to store the dropdownValue (initial value is 'Day')coz, when the technician details screen navigating then,
  we want to show the today's data
  */
  String _dropDownValue = TeamMemberPages.dayWise;

  //list with the 3 value to be used to in drop down widget
  static const List<String> _dropDownValues = ["Day", "Week", "Month"];

  @override
  void initState() {
    initTeamMemberInterventionForToday();
    super.initState();
  }

  ///[initTeamMemberInterventionForToday] will initialise the today's data(intervention lists) for the technician
  void initTeamMemberInterventionForToday() {
    //accessing the 'team leader realized interventions' bloc
    final _bloc = BlocProvider.of<TeamMemberInterventionsCubit>(context);
    String _today = DateTime.now().toString().substring(0, 10);
    // Because we want to get intervention for today
    _bloc.getTeamMemberInterventionsByDateRangeStatus(
      _today,
      _today,
      widget.teamMemberRecord.collaboratorId!,
      [
        InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
        InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
        InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode,
      ],
    );
  }

  // bool variable to sort the list(and use as checks) for diff types of interventions when button(success,semi-ko,ko) pressed
  bool isSuccessTapped = false;
  bool isSemiKoTapped = false;
  bool isKoTapped = false;

  //var to store the total count w.r.t to the intervention status
  int totalKo = 0;
  int totalSemiKo = 0;
  int totalSuccess = 0;

  //[finalRecordsList] will be used to display in the users screen
  List<teamMemberInterventionRecord.Records?>? finalRecordsList = [];

  ///[changeRecordsList]will change the 'finalRecordsList' value to the new passed [listOfRecordsVal]
  void changeRecordsList(List<teamMemberInterventionRecord.Records?>? listOfRecordsVal) {
    setState(() {
      finalRecordsList = listOfRecordsVal;
    });
  }

  ///[getSortedList] will set the interventions 'finalRecordsList' according to the passed status value (eg.3 represent grip case interventions)
  void getSortedList(int passedStatus, List<teamMemberInterventionRecord.Records?>? listOfRecordsVal) {
    if (passedStatus == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode) {
      setState(() {
        finalRecordsList = listOfRecordsVal?.where((element) => element?.interventionStatusId == 2).toList();
      });
    } else if (passedStatus == InterventionStatus.InterventionStatusStandBy.interventionStatusCode) {
      setState(() {
        finalRecordsList = listOfRecordsVal?.where((element) => element?.interventionStatusId == 3).toList();
      });
    } else if (passedStatus == InterventionStatus.InterventionStatusRealisee.interventionStatusCode) {
      setState(() {
        finalRecordsList = listOfRecordsVal?.where((element) => element?.interventionStatusId == 4).toList();
      });
    }
  }

  ///[getTotalsAccordingToStatus]function to get the total count of status  w.r.t to their interventionStatus
  void getTotalsAccordingToStatus(List<teamMemberInterventionRecord.Records?>? listOfRecordsVal) {
    List<teamMemberInterventionRecord.Records?>? koStatusList = listOfRecordsVal?.where((element) => element?.interventionStatusId == 2).toList();
    List<teamMemberInterventionRecord.Records?>? semiKoStatusList = listOfRecordsVal?.where((element) => element?.interventionStatusId == 3).toList();
    List<teamMemberInterventionRecord.Records?>? successStatusList =
    listOfRecordsVal?.where((element) => element?.interventionStatusId == 4).toList();
    if (koStatusList != null) {
      totalKo = koStatusList.length;
    }
    if (semiKoStatusList != null) {
      totalSemiKo = semiKoStatusList.length;
    }
    if (successStatusList != null) {
      totalSuccess = successStatusList.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            // height: 0.16.sh,
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                color: AppColor.kPrimaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.amber,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    BackButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: AppColor.kWhiteColor),
                    Column(
                      children: [
                        Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                image: widget.teamMemberRecord.collaborator?.picture!=null? DecorationImage(image: NetworkImage(widget.teamMemberRecord.collaborator!.picture!), fit: BoxFit.fitWidth):DecorationImage(image: AssetImage('assets/images/img_user.jpeg'), fit: BoxFit.cover),
                                shape: BoxShape.circle,
                                color: AppColor.kWhiteColor)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: AppBoldText("${widget.teamMemberRecord.collaborator?.name}", color: AppColor.kWhiteColor),
                        ),
                      ],
                    ),
                    DropdownButton<String>(
                      iconEnabledColor: AppColor.kWhiteColor,
                      borderRadius: BorderRadius.circular(0),
                      dropdownColor: AppColor.kPrimaryColor,
                      items: _dropDownValues
                          .map((String item) => DropdownMenuItem<String>(
                        child: AppBoldText(item, color: AppColor.kWhiteColor),
                        value: item,
                      ))
                          .toList(),
                      onChanged: (newItem) {
                        setState(() {
                          _dropDownValue = newItem!;
                        });
                      },
                      value: _dropDownValue,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ),
          if (_dropDownValue == TeamMemberPages.dayWise)
            Container(
              // width: 100,
              //   height: 40,
              // color: Colors.amber,
              child: Transform.translate(
                offset: Offset(-0.04.sw, -0.02.sh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChipWidget(
                      pageControllerVal: pageController,
                      animateToPage: 0,
                      containerColor: _index == 0 ? Color(0xff363535) : Colors.white,
                      textColor: _index == 0 ? AppColor.kWhiteColor : Colors.black,
                      text: appLocalizations.translate("realized"),
                    ),
                    SizedBox(width: 10.w),
                    ChipWidget(
                      pageControllerVal: pageController,
                      animateToPage: 1,
                      containerColor: _index == 1 ? Color(0xff363535) : Colors.white,
                      textColor: _index == 1 ? AppColor.kWhiteColor : Colors.black,
                      text: appLocalizations.translate("to_do"),
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(height: 10.h),
          if (_dropDownValue == TeamMemberPages.dayWise)
            Expanded(
              child: PageView(
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                controller: pageController,
                children: [
                  DetailsScreenRealizedWidget(listOfRecords: finalRecordsList),
                  DetailsScreenTodoWidget(
                    teamMemberRecord: widget.teamMemberRecord,
                  )
                ],
              ),
            ),
          if (_dropDownValue == TeamMemberPages.dayWise)
            (_index == 1
                ? SizedBox()
                : Align(
              alignment: Alignment.bottomCenter,
              child: BlocConsumer<TeamMemberInterventionsCubit, TeamMemberInterventionsState>(
                listener: ((context, state) {
                  if (state is TeamMemberInterventionsLoaded) {
                    final List<teamMemberInterventionRecord.Records?>? listOfRecords = state.listOfRecords!;
                    changeRecordsList(listOfRecords);
                  }
                }),
                builder: (context, state) {
                  if (state is TeamMemberInterventionsLoaded) {
                    final List<teamMemberInterventionRecord.Records?>? listOfRecords = state.listOfRecords!;
                    getTotalsAccordingToStatus(listOfRecords);
                    return Container(
                        height: 0.08.sh,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 8.0, offset: Offset(0, 5))],
                            color: AppColor.kWhiteColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
                                  onPressed: () {
                                    //disabling other selections(semi-ko, ko) if 'success' is tapped
                                    setState(() {
                                      isSuccessTapped = !isSuccessTapped;
                                      if (isSemiKoTapped == true || isKoTapped == true) {
                                        isSemiKoTapped = false;
                                        isKoTapped = false;
                                      }
                                    });
                                    //getting sorted list with status type of 'success';
                                    if (isSuccessTapped == true) {
                                      getSortedList(InterventionStatus.InterventionStatusRealisee.interventionStatusCode, listOfRecords);
                                      //if 'success' is tapped again, then change the final list to the default one(list of records with all status)
                                    } else if (isSuccessTapped == false) {
                                      changeRecordsList(listOfRecords);
                                    }
                                  },
                                  child: Container(
                                    height: 0.05.sh,
                                    decoration: BoxDecoration(
                                        color: isSuccessTapped ? AppColor.kSuccessColor : AppColor.kWhiteColor,
                                        borderRadius: BorderRadius.circular(20.r)),
                                    child: customRow(
                                        name: "Success",
                                        containerColor: AppColor.kSuccessColor,
                                        textColor: isSuccessTapped ? AppColor.kWhiteColor : AppColor.kSuccessColor,
                                        count: "${totalSuccess}",
                                        countColor: AppColor.kWhiteColor),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
                                  onPressed: () {
                                    //disabling other selections(success, ko) if 'semi-ko' is tapped
                                    setState(() {
                                      isSemiKoTapped = !isSemiKoTapped;
                                      if (isSuccessTapped == true || isKoTapped == true) {
                                        isSuccessTapped = false;
                                        isKoTapped = false;
                                      }
                                    });
                                    //getting sorted list with status type of 'semi-ko'
                                    if (isSemiKoTapped == true) {
                                      getSortedList(InterventionStatus.InterventionStatusStandBy.interventionStatusCode, listOfRecords);
                                      //if 'semi-ko' is tapped again, then change the final list to the default one(list of records with all status)
                                    } else if (isSemiKoTapped == false) {
                                      changeRecordsList(listOfRecords);
                                    }
                                  },
                                  child: Container(
                                    height: 0.05.sh,
                                    decoration: BoxDecoration(
                                        color: isSemiKoTapped ? AppColor.kToDOColor : AppColor.kWhiteColor,
                                        borderRadius: BorderRadius.circular(20.r)),
                                    child: customRow(
                                        name: "Semi-KO",
                                        containerColor: AppColor.kToDOColor,
                                        textColor: isSemiKoTapped ? AppColor.kWhiteColor : AppColor.kToDOColor,
                                        count: "${totalSemiKo}",
                                        countColor: AppColor.kWhiteColor),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
                                  onPressed: () {
                                    //disabling other selections(success, semi-ko) if 'ko' is tapped
                                    setState(() {
                                      isKoTapped = !isKoTapped;
                                      if (isSemiKoTapped == true || isSuccessTapped == true) {
                                        isSemiKoTapped = false;
                                        isSuccessTapped = false;
                                      }
                                    });
                                    //getting sorted list with status type of 'ko'
                                    if (isKoTapped == true) {
                                      getSortedList(InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode, listOfRecords);

                                      //if 'ko' is tapped again, then change the final list to the default one(list of records with all status)
                                    } else if (isKoTapped == false) {
                                      changeRecordsList(listOfRecords);
                                    }
                                  },
                                  child: Container(
                                    height: 0.05.sh,
                                    decoration: BoxDecoration(
                                        color: isKoTapped ? AppColor.kCaseColor : AppColor.kWhiteColor,
                                        borderRadius: BorderRadius.circular(20.r)),
                                    child: customRow(
                                        name: "Ko",
                                        containerColor: AppColor.kCaseColor,
                                        textColor: isKoTapped ? AppColor.kWhiteColor : AppColor.kCaseColor,
                                        count: "${totalKo}",
                                        countColor: AppColor.kWhiteColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
                  } else if (state is TeamMemberInterventionsError) {
                    return Center(
                      child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            )),
          if (_dropDownValue == TeamMemberPages.weekWise)
            TechnicienPlanningWeekWidget(
                teamMemberId: widget.teamMemberRecord.collaboratorId!),
          if (_dropDownValue == TeamMemberPages.monthWise)
            TechnicienPlanningMonthWidget(
                teamMemberId: widget.teamMemberRecord.collaboratorId!),
        ],
      ),
    );
  }

  Widget customRow({String? name, Color? containerColor, Color? textColor, Color? countColor, String? count}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBoldText(name.toString(), color: textColor, fontSize: 12.sp, fontWeight: FontWeight.w800),
          if (count != null) SizedBox(width: 6.w),
          if (count != null)
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(shape: BoxShape.circle, color: containerColor),
              child: Center(child: AppBoldText(count.toString(), color: countColor, fontSize: 13.sp)),
            )
        ],
      ),
    );
  }
}