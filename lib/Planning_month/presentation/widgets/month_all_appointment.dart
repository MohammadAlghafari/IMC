import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Planning_day/presentation/widgets/intervention_mini_details_bottom_sheet_widget.dart';
import 'package:imc/Planning_month/presentation/cubit/team_leader_cubit/planning_month_cubit.dart';
import 'package:imc/Planning_month/presentation/cubit/technician_cubit/planning_month_cubit.dart';
import 'package:imc/TeamLeader/presentation/pages/success_page/team_leader/teamlead_success_screen_index.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_function.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;

class MonthAllAppointmentsWidget extends StatelessWidget {
  const MonthAllAppointmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    ///Building the screen according to the [UserRoleID] we get from the local DB
    return (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID)
        ? BlocConsumer<PlanningMonthCubit, PlanningMonthState>(
      listener: (context, state) {
        if (state is PlanningMonthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${appLocalizations.translate("an_error_occured")}")));
        }
      },
      builder: (context, state) {
        if (state is PlanningMonthLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PlanningMonthLoaded) {
          List<Records?>? _listOfRecords = state.listOfRecords;

          final int listLength = (_listOfRecords?.length ?? 0) < 1 ? 1 : _listOfRecords!.length;

          return Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: listLength,
                itemBuilder: (context, index) {
                  if (_listOfRecords == null || _listOfRecords.isEmpty) {
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

                  final Records listItem = _listOfRecords[index]!;
                  return GestureDetector(
                      onTap: () {
                        if (_listOfRecords[index] != null) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => InterventionMiniDetailsBottomSheetWidget(
                              interventionDetails: listItem,
                              isRc: ((listItem.interventionTypeId != null) && (listItem.interventionTypeId == InterventionTypes.RC)),
                            ),
                          );
                        }
                      },
                      child: PlanningMonthTile(
                        scheduleStartTime: '${listItem.scheduleStart?.substring(11,16)}',
                        scheduleEndTime: '${listItem.scheduleEnd?.substring(11,16)}',
                        interventionStatusId: listItem.interventionStatusId,
                        clientAddress: '${listItem.client?.address}, ${listItem.client?.postalCode??''}',
                        clientName: '${listItem.client?.firstname} ${listItem.client?.lastname}',
                        accNumber: '${listItem.client?.accNumber}',
                        clientDetails:   "${listItem.client?.market?.title??''}  ${listItem.client?.technical?.nbFils??''}  ${listItem.client?.technical?.meterRange??''}",
                      ));
                },
              ));
        } else if (state is PlanningMonthError) {
          return Center(
            child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
          );
        } else {
          return Center(
            child: AppRegularText(appLocalizations.translate("please_select_a_date_range_to_view_data"), textAlign: TextAlign.center),
          );
        }
      },
    )
        : BlocConsumer<TeamLeaderPlanningMonthCubit, TeamLeaderPlanningMonthState>(
      listener: (context, state) {
        if (state is TeamLeaderPlanningMonthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${appLocalizations.translate("an_error_occured")}")));
        }
      },
      builder: (context, state) {
        if (state is TeamLeaderPlanningMonthLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TeamLeaderPlanningMonthLoaded) {
          List<teamLeaderInterventionModel.Records?>? _listOfRecords = state.listOfRecords;

          final int listLength = (_listOfRecords?.length ?? 0) < 1 ? 1 : _listOfRecords!.length;

          return Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: listLength,
                itemBuilder: (context, index) {
                  if (_listOfRecords == null || _listOfRecords.isEmpty) {
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

                  final teamLeaderInterventionModel.Records listItem = _listOfRecords[index]!;
                  return GestureDetector(
                    onTap: () {
                      if (_listOfRecords[index] != null) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (ctx) => TeamLeadSuccessScreenIndex(
                              isTodos: (listItem.visitStatusId == InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode) ? true : false,
                              teamLeaderinterventionRecords: _listOfRecords[index]!,
                            ),
                          ),
                        );
                      }
                    },
                    child: PlanningMonthTile(
                      interventionStatusId: listItem.visitStatusId,
                      clientAddress: '${listItem.client?.address}, ${listItem.client?.postalCode??''}',
                      clientName: '${listItem.client?.firstname} ${listItem.client?.lastname}',
                      scheduleStartTime: '${listItem.scheduleStart?.substring(11,16)}',
                      scheduleEndTime: '${listItem.scheduleEnd?.substring(11,16)}',
                      accNumber: '${listItem.client?.accNumber}',
                      clientDetails:   "${listItem.client?.market?.title??''}  ${listItem.client?.technical?.nbFils??''}  ${listItem.client?.technical?.meterRange??''}",
                    ),
                  );
                },
              ));
        } else if (state is TeamLeaderPlanningMonthError) {
          return Center(
            child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
          );
        } else {
          return Center(
            child: AppRegularText(appLocalizations.translate("please_select_a_date_range_to_view_data"), textAlign: TextAlign.center),
          );
        }
      },
    );
  }
}

class PlanningMonthTile extends StatelessWidget {
  final int? interventionStatusId;
  final String clientName;
  final String clientAddress;
  final String? accNumber;
  final String scheduleStartTime;
  final String scheduleEndTime;
  final String clientDetails;
  const PlanningMonthTile(
      {Key? key,
        required this.interventionStatusId,
        required this.clientName,
        required this.clientAddress,
        required this.scheduleStartTime,
        required this.scheduleEndTime,
        required this.accNumber,
        required this.clientDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: getColor(interventionStatusId),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5.0)],
            borderRadius: BorderRadius.circular(5)),
        child: Row(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AppRegularText("${scheduleStartTime}\n - \n${scheduleEndTime}", fontSize: 12, color: AppColor.kWhiteColor, textAlign: TextAlign.center,)),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: ((interventionStatusId == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode) ||
                        (interventionStatusId == InterventionStatus.InterventionStatusStandBy.interventionStatusCode) ||
                        (interventionStatusId == InterventionStatus.InterventionStatusRealisee.interventionStatusCode))
                        ? AppColor.kWhiteColor.withOpacity(0.86)
                        : AppColor.kWhiteColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), topRight: Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBoldText(
                          "${clientName}",
                          fontSize: 14,
                          maxLines: 1,
                        ),
                        if (accNumber != 'null') AppBoldText("ACC ${accNumber}", fontSize: 12)
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: getColor(interventionStatusId), size: 12),
                        SizedBox(width: 10),
                        Expanded(
                          child: AppBoldText("${clientAddress}", fontSize: 12),
                        )
                      ],
                    ),
                    if(clientDetails != 'null') SizedBox(height: 5),
                    if(clientDetails != 'null') AppBoldText("$clientDetails", color: getColor(interventionStatusId), fontSize: 10)
                  ]),
                ),
              )),
        ]),
      ),
    );
  }
}