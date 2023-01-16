
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Planning_day/presentation/cubit/team_leader_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/cubit/technician_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/widgets/intervention_mini_details_bottom_sheet_widget.dart';
import 'package:imc/Planning_day/presentation/widgets/planning_day_tile.dart';
import 'package:imc/TeamLeader/presentation/pages/success_page/team_leader/teamlead_success_screen_index.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_function.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:time_planner/time_planner.dart';
import 'package:intl/intl.dart';
import 'package:imc/common_widgets/custom_time_planner.dart' as c;
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;

class CompletedTaskPlanningDayWidget extends StatefulWidget {
  const CompletedTaskPlanningDayWidget({Key? key}) : super(key: key);

  @override
  State<CompletedTaskPlanningDayWidget> createState() => _CompletedTaskPlanningDayWidgetState();
}

class _CompletedTaskPlanningDayWidgetState extends State<CompletedTaskPlanningDayWidget> {
  @override
  void initState() {
    initDataFromBloc();
    super.initState();
  }

  ///[initDataFromBloc] initialize data(completed interventions records detail) according the the [UserRoles] we get from local DB for today
  void initDataFromBloc() {
    if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
      //accessing technician's 'planning day completed intervention' bloc
      final _planningDayCubit = BlocProvider.of<PlanningDayCompletedInterventionCubit>(context);
      //getting the completed list of interventions for today of the technician
      _planningDayCubit.getCompletedTechnicianInterventionForToday();
    } else {
      //accessing  teamleader's 'plannning day completed intervention' bloc
      final _planningDayCubit = BlocProvider.of<TeamLeaderPlanningDayCompletedInterventionCubit>(context);
      //getting the completed list of all interventions(realised,grip,force grip) for the team leader
      _planningDayCubit.getTeamLeaderCompletedInterventionForToday([
        InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
        InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
        InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    //variable to get the locale language code
    String locale = Localizations.localeOf(context).languageCode;

    ///Building the screen with data from Bloc according to the [UserRoles] we get from the local DB
    return (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID)
        ? BlocBuilder<PlanningDayCompletedInterventionCubit, PlanningDayState>(
      builder: (context, state) {
        if (state is PlanningDayLoaded) {
          List<Records?>? _listOfCompletedRecords = state.listOfRecords;
          final int listLength = (_listOfCompletedRecords?.length ?? 0) < 1 ? 1 : _listOfCompletedRecords!.length;
          if (_listOfCompletedRecords == null || _listOfCompletedRecords.isEmpty) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  AppRegularText(appLocalizations.translate("there_are_no_record_available_for_this_duration")),
                ],
              ),
            );
          }

          return c.TimePlanner(
            style: TimePlannerStyle(showScrollBar: true, cellWidth: 1.sw.toInt()),
            // time will be start at this hour on table
            startHour: 0,
            // time will be end at this hour on table
            endHour: 23,
            // each header is a column and a day
            headers: [
              TimePlannerTitle(
                date: "${DateTime.now().toString().substring(0, 10)}",
                title: "${DateFormat('EEEE', locale).format(DateTime.now())}",
              ),
            ],
            // List of task will be show on the time planner
            tasks: [
              ...List.generate(listLength, (index) {
                final listItem = _listOfCompletedRecords[index];
                return TimePlannerTask(
                    color: Colors.transparent,
                    // day: Index of header, hour: Task will be begin at this hour
                    // minutes: Task will be begin at this minutes
                    dateTime:
                    TimePlannerDateTime(day: 0, hour: int.tryParse("${listItem?.scheduleStart.toString().substring(11, 13)}") ?? 0, minutes: 0),
                    // Minutes duration of task
                    minutesDuration:(listItem!=null)? getDurationOfInterventionSchedule(scheduleEndTime: listItem.scheduleEnd!, scheduleStartTime: listItem.scheduleStart!):60,
                    // Days duration of task (use for multi days task)
                    // daysDuration: 1,
                    onTap: () {
                      if (_listOfCompletedRecords[index] != null) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => InterventionMiniDetailsBottomSheetWidget(
                            interventionDetails: _listOfCompletedRecords[index]!,
                            isRc: ((listItem?.interventionTypeId != null) && (listItem?.interventionTypeId == InterventionTypes.RC)),
                          ),
                        );
                      }
                    },
                    child: PlanningDayTile(
                      tileColor: getColor(listItem?.interventionStatusId),
                      isRC: ((listItem?.interventionTypeId != null) && (listItem?.interventionTypeId == InterventionTypes.RC)),
                      clientName: '${listItem?.client?.firstname} ${listItem?.client?.lastname}',
                      clientAddress: '${listItem?.client?.address}, ${listItem?.client?.postalCode??''}',
                      clientAccNo: '${listItem?.client?.accNumber}',
                      interventionNumber: '${index + 1}',
                    ));
              })
            ],
          );
        } else if (state is PlanningDayError) {
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
        : BlocBuilder<TeamLeaderPlanningDayCompletedInterventionCubit, TeamLeaderPlanningDayState>(
      builder: (context, state) {
        if (state is TeamLeaderPlanningDayLoaded) {
          List<teamLeaderInterventionModel.Records?>? _listOfCompletedRecords = state.listOfRecords;
          final int listLength = (_listOfCompletedRecords?.length ?? 0) < 1 ? 1 : _listOfCompletedRecords!.length;

          if (_listOfCompletedRecords == null || _listOfCompletedRecords.isEmpty) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  AppRegularText(appLocalizations.translate("there_are_no_record_available_for_this_duration")),
                ],
              ),
            );
          }

          return c.TimePlanner(
            style: TimePlannerStyle(showScrollBar: true, cellWidth: 1.sw.toInt()),
            // time will be start at this hour on table
            startHour: 0,
            // time will be end at this hour on table
            endHour: 23,
            // each header is a column and a day
            headers: [
              TimePlannerTitle(
                date: "${DateTime.now().toString().substring(0, 10)}",
                title: "${DateFormat('EEEE').format(DateTime.now())}",
              ),
            ],
            // List of task will be show on the time planner
            tasks: [
              ...List.generate(listLength, (index) {
                final listItem = _listOfCompletedRecords[index];

                return TimePlannerTask(
                    color: Colors.transparent,
                    // day: Index of header, hour: Task will be begin at this hour
                    // minutes: Task will be begin at this minutes
                    dateTime:
                    TimePlannerDateTime(day: 0, hour: int.tryParse("${listItem?.scheduleStart.toString().substring(11, 13)}") ?? 0, minutes: 0),
                    // Minutes duration of task
                    minutesDuration:(listItem!=null)? getDurationOfInterventionSchedule(scheduleEndTime: listItem.scheduleEnd!, scheduleStartTime: listItem.scheduleStart!):60,
                    // Days duration of task (use for multi days task)
                    // daysDuration: 1,
                    onTap: () {
                      if (_listOfCompletedRecords[index] != null) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (ctx) => TeamLeadSuccessScreenIndex(
                              isTodos:
                              (listItem!.visitStatusId == InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode) ? true : false,
                              teamLeaderinterventionRecords: _listOfCompletedRecords[index]!,
                            ),
                          ),
                        );
                      }
                    },
                    child: PlanningDayTile(
                      tileColor: getColor(listItem?.visitStatusId),
                      isRC: false,
                      clientName: '${listItem?.client?.firstname}',
                      clientAddress: '${listItem?.client?.address}, ${listItem?.client?.firstname}',
                      clientAccNo: '${listItem?.client?.accNumber}',
                      interventionNumber: '${index + 1}',
                    ));
              })
            ],
          );
        } else if (state is TeamLeaderPlanningDayError) {
          return Center(
            child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}