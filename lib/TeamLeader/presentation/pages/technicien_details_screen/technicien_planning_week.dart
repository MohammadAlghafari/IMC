import 'dart:developer';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imc/Planning_week/data/model/event_model.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_member/cubit/team_member_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/pages/success_page/team_member/team_member_success_screen_index.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecord;
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/app_localizations.dart';

class TechnicienPlanningWeekWidget extends StatefulWidget {
  const TechnicienPlanningWeekWidget({Key? key, required this.teamMemberId}) : super(key: key);
  final int teamMemberId;

  @override
  State<TechnicienPlanningWeekWidget> createState() => _TechnicienPlanningWeekWidgetState();
}

class _TechnicienPlanningWeekWidgetState extends State<TechnicienPlanningWeekWidget> {
  DateTime _now = DateTime.now();
  DateTime _firstDayOfWeek = DateTime.now().firstDayOfWeek();
  DateTime _lastDayOfWeek = DateTime.now().lastDayOfWeek();

  @override
  void initState() {
    initTechnicianPlanningWeekData();
    super.initState();
  }

  ///[initTechnicianPlanningWeekData] will initialise the plannning week data(interventions(to-do,realized,grip,force-grip)) for the selected team member(technician)
  void initTechnicianPlanningWeekData() {
    //accessing the team leaders's realized cubit
    final technicianInterventionsCubit = BlocProvider.of<TeamMemberInterventionsCubit>(context);
    //getting all the intervention(to-do,realized,grip,force-grip) of the technician(by passing it's id)
    technicianInterventionsCubit.getTeamMemberInterventionsByDateRangeStatus(
      _firstDayOfWeek.toString().substring(0, 10),
      _lastDayOfWeek.toString().substring(0, 10),
      widget.teamMemberId,
      [
        InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
        InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
        InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
        InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return SizedBox(
      height: 0.7.sh,
      child: Column(
        children: [
          Expanded(
              child: BlocConsumer<TeamMemberInterventionsCubit, TeamMemberInterventionsState>(
                listener: (context, state) {
                  if (state is TeamMemberInterventionsLoaded) {
                    List<teamMemberInterventionRecord.Records?>? _interventions = state.listOfRecords;
                    final _listOfEvents = _interventions!.map((record) {
                      return CalendarEventData<Event>(
                          date: DateTime.tryParse(record!.scheduleStart!) ?? _now,
                          endDate: DateTime.tryParse(record.scheduleEnd!) ?? _now,
                          event: Event(title: "${record.client?.firstname}", interventionId: record.id ?? 0),
                          title: '${record.client?.firstname}',
                          startTime: DateTime.tryParse(record.scheduleStart!) ?? _now,
                          endTime: DateTime.tryParse(record.scheduleEnd!)??_now.add(Duration(hours: 2)));
                    }).toList();

                    CalendarControllerProvider.of<Event>(context).controller.addAll(_listOfEvents);
                  } else if (state is TeamMemberInterventionsError) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${appLocalizations.translate("an_error_occured")}")));
                  }
                },
                builder: (context, state) {
                  if (state is TeamMemberInterventionsLoaded) {
                    List<teamMemberInterventionRecord.Records?>? _interventions = state.listOfRecords;

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
                                    final _teamMemberCubit = BlocProvider.of<TeamMemberInterventionsCubit>(context);
                                    _teamMemberCubit.emptyWeekRecords();
                                    _firstDayOfWeek = currentStartDate;
                                    _lastDayOfWeek = currentStartDate.lastDayOfWeek();

                                    _teamMemberCubit.getTeamMemberInterventionsByDateRangeStatus(
                                      _firstDayOfWeek.toString().substring(0, 10),
                                      _lastDayOfWeek.toString().substring(0, 10),
                                      widget.teamMemberId,
                                      [
                                        InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
                                        InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
                                        InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
                                        InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode,
                                      ],
                                    );
                                  },
                                  eventTileBuilder: (date, events, boundary, start, end) {
                                    teamMemberInterventionRecord.Records? record =
                                    _interventions!.firstWhereOrNull((record) => record!.scheduleStart.toString() == start.toString().substring(0, 19));
                                    Color tileColor = Colors.grey.shade200;

                                    //getting the tile color according to the intervention status type
                                    if (record != null && record.interventionStatusId != null) {
                                      if (record.interventionStatusId == InterventionStatus.InterventionStatusRealisee.interventionStatusCode) {
                                        tileColor = InterventionStatus.InterventionStatusRealisee.interventionStatusColor;
                                      } else if (record.interventionStatusId == InterventionStatus.InterventionStatusStandBy.interventionStatusCode) {
                                        tileColor = InterventionStatus.InterventionStatusStandBy.interventionStatusColor;
                                      } else if (record.interventionStatusId == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode) {
                                        tileColor = InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusColor;
                                      }
                                    }

                                    return GestureDetector(
                                        onTap: () {
                                          if (record != null) {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (ctx) => TeamMemberSuccessScreenIndex(
                                                  isTodos: (record.interventionStatusId == InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode)
                                                      ? true
                                                      : false,
                                                  teamMemberInterventionRecords: record,
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
                                                      "${record?.client?.firstname} ${record?.client?.lastname}",
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
                  } else if (state is TeamMemberInterventionsError) {
                    return Center(
                      child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}