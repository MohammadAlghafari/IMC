import 'dart:developer';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Planning_day/presentation/widgets/intervention_mini_details_bottom_sheet_widget.dart';
import 'package:imc/Planning_week/data/model/event_model.dart';
import 'package:imc/Planning_week/presentation/cubit/team_leader_cubit/planning_week_cubit.dart';
import 'package:imc/Planning_week/presentation/cubit/technician_cubit/planning_week_cubit.dart';
import 'package:imc/TeamLeader/presentation/pages/success_page/team_leader/teamlead_success_screen_index.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:imc/common_widgets/common_drawer.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;

import '../../../common_models/intervention_record_model.dart';
import '../../../core/constant/app_constant.dart';

class PlanningWeekScreenIndex extends StatefulWidget {
  const PlanningWeekScreenIndex({Key? key}) : super(key: key);

  @override
  State<PlanningWeekScreenIndex> createState() => _PlanningWeekScreenIndexState();
}

class _PlanningWeekScreenIndexState extends State<PlanningWeekScreenIndex> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _now = DateTime.now();

  //to store the value of first day of the week according to the user's device Date Time
  DateTime _firstDayOfWeek = DateTime.now().firstDayOfWeek();

  //to store the value of last day of the week according to the user's device Date Time
  DateTime _lastDayOfWeek = DateTime.now().lastDayOfWeek();


  //default tile color for todos intervention
  Color tileColor = Colors.grey.shade200;

  @override
  void initState() {
    initDataFromBloc();
    super.initState();
  }

  ///[initDataFromBloc] initialize data(intervention day for the week) according the the [UserRoles] we get from local DB
  void initDataFromBloc() {
    if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
      //accessing technician 'planning week' bloc
      final _planningWeekCubit = BlocProvider.of<PlanningWeekCubit>(context);
      //getting technician's all interventions(to-do,normal,grip,force-grip) for the week
      _planningWeekCubit.getTechnicianInterventionForToWeek(startDate: _firstDayOfWeek, endDate: _lastDayOfWeek);
    } else if (AuthHiveHelper.getUserRoleId == UserRoles.TEAM_LEADER_ROLE_ID) {
      //accessing team leader 'planning week' bloc
      final _planningWeekCubit = BlocProvider.of<TeamLeaderPlanningWeekCubit>(context);
      //getting team leader's all interventions(to-do,normal,grip,force-grip) for the week
      _planningWeekCubit.getTeamLeaderVisitsForTheWeek(
        startDate: _firstDayOfWeek,
        endDate: _lastDayOfWeek,
        statusList: [
          InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
          InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
          InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
          InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    //var to get the locale languaged code
    String locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
        key: scaffoldKey,
        drawer: CommonDrawer(userRoleId: AuthHiveHelper.getUserRoleId),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.r), bottomRight: Radius.circular(25.r))),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.04.sh, horizontal: 0.04.sw),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        GestureDetector(
                          onTap: () => scaffoldKey.currentState?.openDrawer(),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: DecorationImage(image:  NetworkImage('${AuthHiveHelper.getUserPicture}'), fit: BoxFit.cover),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(color: AppColor.kWhiteColor, width: 2.0)),
                          ),
                        ),
                        AppBoldText("${DateFormat("MMMM dd", locale).format(DateTime.now())}, ${DateTime.now().year}",
                            color: AppColor.kWhiteColor, fontSize: 18),
                        Text("")
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(

              ///Building the screen with data from Bloc according to the [UserRoles] we get from the local DB
                child: (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID)
                    ? BlocConsumer<PlanningWeekCubit, PlanningWeekState>(
                  listener: (context, state) {
                    if (state is PlanningWeekLoaded) {
                      List<Records?>? _interventions = state.listOfRecords;
                      final _listOfEvents = _interventions!.map((record) {
                        return CalendarEventData<Event>(
                            date: DateTime.tryParse(record!.scheduleStart!) ?? _now,
                            endDate: DateTime.tryParse(record.scheduleEnd!) ?? _now,
                            event: Event(title: "${record.client?.firstname}", interventionId: record.id ?? 0),
                            title: '${record.client?.firstname}',
                            startTime: DateTime.tryParse(record.scheduleStart!) ?? _now,
                            endTime: DateTime.tryParse(record.scheduleEnd!) ?? _now.add(Duration(hours: 2)));
                      }).toList();

                      CalendarControllerProvider.of<Event>(context).controller.addAll(_listOfEvents);
                    } else if (state is PlanningWeekError) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(appLocalizations.translate("an_error_occured"))));
                    }
                  },
                  builder: (context, state) {
                    if (state is PlanningWeekLoaded) {
                      List<Records?>? _interventions = state.listOfRecords;

                      return Column(
                        children: [
                          Expanded(
                              child: Transform.translate(
                                offset: Offset(0, -MediaQuery.of(context).padding.top),
                                child: Container(
                                  // width: double.infinity,
                                  child: WeekView<Event>(
                                    // width: 0.88.sw,//TODO: fix w.r.t to responsiveness
                                    onPageChange: (currentStartDate, currentIndex) {
                                      // Comment
                                      final _planningWeekCubit = BlocProvider.of<PlanningWeekCubit>(context);
                                      _planningWeekCubit.emptyWeekRecords();
                                      _firstDayOfWeek = currentStartDate;
                                      _lastDayOfWeek = currentStartDate.lastDayOfWeek();

                                      _planningWeekCubit.getTechnicianInterventionForToWeek(startDate: _firstDayOfWeek, endDate: _lastDayOfWeek);
                                    },
                                    eventTileBuilder: (date, events, boundary, start, end) {
                                      Records? record = _interventions!
                                          .firstWhereOrNull((record) => record!.scheduleStart.toString() == start.toString().substring(0, 19));
                                      if (record != null && record.interventionStatusId != null) {
                                        if (record.interventionStatusId == InterventionStatus.InterventionStatusRealisee.interventionStatusCode) {
                                          tileColor = InterventionStatus.InterventionStatusRealisee.interventionStatusColor;
                                        } else if (record.interventionStatusId ==
                                            InterventionStatus.InterventionStatusStandBy.interventionStatusCode) {
                                          tileColor = InterventionStatus.InterventionStatusStandBy.interventionStatusColor;
                                        } else if (record.interventionStatusId ==
                                            InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode) {
                                          tileColor = InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusColor;
                                        } else {
                                          tileColor = Colors.grey.shade200;
                                        }
                                      }

                                      return GestureDetector(
                                          onTap: () {
                                            if (record != null) {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                backgroundColor: Colors.transparent,
                                                builder: (context) => InterventionMiniDetailsBottomSheetWidget(
                                                  interventionDetails: record,
                                                  isRc:
                                                  ((record.interventionTypeId != null) && (record.interventionTypeId == InterventionTypes.RC)),
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(color: tileColor, borderRadius: BorderRadius.circular(6)),
                                              child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Center(
                                                      child: AppRegularText(
                                                        "${record?.client?.firstname}",
                                                        color: tileColor == Colors.grey.shade200 ? Colors.black87 : Colors.white,
                                                        textAlign: TextAlign.center,
                                                      )))));
                                    },
                                    showWeekends: true,
                                    showLiveTimeLineInAllDays: true,
                                    minDay: DateTime(DateTime.now().year - 1),
                                    maxDay: DateTime(DateTime.now().year + 1),
                                    initialDay: _firstDayOfWeek,
                                    heightPerMinute: 1,
                                    eventArranger: SideEventArranger(),
                                    onDateLongPress: (date) => log("$date"),
                                    liveTimeIndicatorSettings: HourIndicatorSettings(color: AppColor.kSuccessColor),
                                    weekDayBuilder: (dateTime) {
                                      return Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            AppBoldText(AppConstant.getWeekTitles(context)[dateTime.weekday - 1], color: AppColor.kPrimaryColor),
                                            AppRegularText(
                                              "${dateTime.day}",
                                              color: AppColor.kPrimaryColor,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )),
                        ],
                      );
                    } else if (state is PlanningWeekError) {
                      return Center(
                        child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
                    : BlocConsumer<TeamLeaderPlanningWeekCubit, TeamLeaderPlanningWeekState>(
                  listener: (context, state) {
                    if (state is TeamLeaderPlanningWeekLoaded) {
                      List<teamLeaderInterventionModel.Records?>? _interventions = state.listOfRecords;
                      final _listOfEvents = _interventions!.map((record) {
                        return CalendarEventData<Event>(
                            date: DateTime.tryParse(record!.scheduleStart!) ?? _now,
                            endDate: DateTime.tryParse(record.scheduleEnd!) ?? _now,
                            event: Event(title: "${record.client?.firstname}", interventionId: record.id ?? 0),
                            title: '${record.client?.firstname}',
                            startTime: DateTime.tryParse(record.scheduleStart!) ?? _now,
                            endTime: DateTime.tryParse(record.scheduleEnd!) ?? _now.add(Duration(hours: 2)));
                      }).toList();

                      CalendarControllerProvider.of<Event>(context).controller.addAll(_listOfEvents);
                    } else if (state is PlanningWeekError) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(appLocalizations.translate("an_error_occured"))));
                    }
                  },
                  builder: (context, state) {
                    if (state is TeamLeaderPlanningWeekLoaded) {
                      List<teamLeaderInterventionModel.Records?>? _interventions = state.listOfRecords;

                      return Column(
                        children: [
                          Expanded(
                              child: Transform.translate(
                                offset: Offset(0, -MediaQuery.of(context).padding.top),
                                child: Container(
                                  // width: double.infinity,
                                  child: WeekView<Event>(
                                    // width: 0.95.sw,//TODO: fix w.r.t to responsiveness
                                    onPageChange: (currentStartDate, currentIndex) {
                                      final _planningWeekCubit = BlocProvider.of<TeamLeaderPlanningWeekCubit>(context);
                                      _planningWeekCubit.emptyWeekRecords();
                                      _firstDayOfWeek = currentStartDate;
                                      _lastDayOfWeek = currentStartDate.lastDayOfWeek();
                                      _planningWeekCubit.getTeamLeaderVisitsForTheWeek(
                                        startDate: _firstDayOfWeek,
                                        endDate: _lastDayOfWeek,
                                        statusList: [
                                          InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
                                          InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
                                          InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
                                          InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode
                                        ],
                                      );
                                    },
                                    eventTileBuilder: (date, events, boundary, start, end) {
                                      teamLeaderInterventionModel.Records? record = _interventions!
                                          .firstWhereOrNull((record) => record!.scheduleStart.toString() == start.toString().substring(0, 19));
                                      if (record != null && record.visitStatusId != null) {
                                        if (record.visitStatusId == InterventionStatus.InterventionStatusRealisee.interventionStatusCode) {
                                          tileColor = InterventionStatus.InterventionStatusRealisee.interventionStatusColor;
                                        }
                                      }

                                      return GestureDetector(
                                          onTap: () {
                                            if (record != null) {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder: (ctx) => TeamLeadSuccessScreenIndex(
                                                    isTodos:
                                                    (record.visitStatusId == InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode)
                                                        ? true
                                                        : false,
                                                    teamLeaderinterventionRecords: record,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(color: tileColor, borderRadius: BorderRadius.circular(6)),
                                              child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Center(
                                                      child: AppRegularText(
                                                        "${record?.client?.firstname}",
                                                        color: tileColor == Colors.grey.shade200 ? Colors.black87 : Colors.white,
                                                        textAlign: TextAlign.center,
                                                      )))));
                                    },
                                    showWeekends: true,
                                    showLiveTimeLineInAllDays: true,
                                    minDay: DateTime(DateTime.now().year - 1),
                                    maxDay: DateTime(DateTime.now().year + 1),
                                    initialDay: _firstDayOfWeek,
                                    heightPerMinute: 1,
                                    eventArranger: SideEventArranger(),
                                    onDateLongPress: (date) => log("$date"),
                                    liveTimeIndicatorSettings: HourIndicatorSettings(color: AppColor.kSuccessColor),
                                    weekDayBuilder: (dateTime) {
                                      return Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            AppBoldText(AppConstant.getWeekTitles(context)[dateTime.weekday - 1], color: AppColor.kPrimaryColor),
                                            AppRegularText(
                                              "${dateTime.day}",
                                              color: AppColor.kPrimaryColor,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )),
                        ],
                      );
                    } else if (state is TeamLeaderPlanningWeekError) {
                      return Center(
                        child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
          ],
        ));
  }
}