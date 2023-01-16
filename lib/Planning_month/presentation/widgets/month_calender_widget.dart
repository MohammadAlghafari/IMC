import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Planning_month/presentation/cubit/team_leader_cubit/planning_month_cubit.dart';
import 'package:imc/Planning_month/presentation/cubit/technician_cubit/planning_month_cubit.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MonthCalenderWidget extends StatelessWidget {
  MonthCalenderWidget({Key? key}) : super(key: key);

  final _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: AppColor.kPrimaryColor,
        ),
        Container(
            height: 280,
            width: double.infinity,
            child: SfDateRangePicker(

              onSelectionChanged: (args) {
                if (args.value is PickerDateRange) {
                  final DateTime? rangeStartDate = args.value.startDate;
                  final DateTime? rangeEndDate = args.value.endDate;

                  if (rangeStartDate != null && rangeEndDate != null) {
                    if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
                      //accessing technician 'planing day' bloc
                      final planningMonthCubit = BlocProvider.of<PlanningMonthCubit>(context);
                      //getting technician interventions(normal,grip,force grip, to-do) for the selected (start-end) data range
                      planningMonthCubit.getTechnicianInterventionForDateRange(
                          rangeStartDate.toString().substring(0, 10), rangeEndDate.toString().substring(0, 10));
                    } else {
                      //accessing team leader 'planing day' bloc
                      final planningMonthCubit = BlocProvider.of<TeamLeaderPlanningMonthCubit>(context);
                      //getting team leader interventions(normal,grip,force grip, to-do)  for the selected (start-end) data range
                      planningMonthCubit.getTeamLeaderInterventionForDateRange(
                          rangeStartDate.toString().substring(0, 10), rangeEndDate.toString().substring(0, 10), [
                        InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
                        InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
                        InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
                        InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode,
                      ]);
                    }
                  }
                } else if (args.value is DateTime) {
                  final DateTime? selectedDate = args.value;
                  if (selectedDate != null) {
                    if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
                      //accessing technician 'planing day' bloc
                      final planningMonthCubit = BlocProvider.of<PlanningMonthCubit>(context);
                      //getting technician interventions(normal,grip,force grip, to-do)  for the selected (start-end) data range
                      planningMonthCubit.getTechnicianInterventionForDateRange(
                          selectedDate.toString().substring(0, 10), selectedDate.toString().substring(0, 10));
                    } else {
                      //accessing team leader 'planing day' bloc
                      final planningMonthCubit = BlocProvider.of<TeamLeaderPlanningMonthCubit>(context);
                      //getting team leader interventions(normal,grip,force grip, to-do)  for the selected (start-end) data range
                      planningMonthCubit
                          .getTeamLeaderInterventionForDateRange(selectedDate.toString().substring(0, 10), selectedDate.toString().substring(0, 10), [
                        InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
                        InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
                        InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
                        InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode
                      ]);
                    }
                  }
                }
              },
              controller: _controller,
              confirmText: appLocalizations.translate("ok"),
              selectionMode: DateRangePickerSelectionMode.single,
              monthViewSettings: DateRangePickerMonthViewSettings(
                  weekendDays: <int>[1, 6],
                  dayFormat: "EEE",
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: TextStyle(color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold))),
              showNavigationArrow: true,
              headerHeight: 80.h,

              headerStyle: DateRangePickerHeaderStyle(
                  textStyle: TextStyle(color: AppColor.kWhiteColor), textAlign: TextAlign.center, backgroundColor: AppColor.kPrimaryColor),
              monthCellStyle:
              DateRangePickerMonthCellStyle(textStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColor.kBlackColor, fontSize: 16)),
            )),
      ],
    );
  }
}