import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_member/cubit/team_member_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/pages/success_page/team_member/team_member_success_screen_index.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_function.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecord;

class TechnicienPlanningMonthWidget extends StatelessWidget {
  TechnicienPlanningMonthWidget({Key? key,required this.teamMemberId}) : super(key: key);
  final int teamMemberId;
  final _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return SizedBox(
      height: 0.7.sh,
      child: Column(
        children: [
          Container(
              height: 0.26.sh,
              // flex: 1,
              child: SfDateRangePicker(
                onSelectionChanged: (args) {
                  if (args.value is PickerDateRange) {
                    final DateTime? rangeStartDate = args.value.startDate;
                    final DateTime? rangeEndDate = args.value.endDate;

                    if (rangeStartDate != null && rangeEndDate != null) {
                      //accessing 'team leader realized interventions' bloc
                      final planningMonthCubit = BlocProvider.of<TeamMemberInterventionsCubit>(context);
                      //getting interventions for the team member for the passed date range
                      planningMonthCubit.getTeamMemberInterventionsByDateRangeStatus(
                        rangeStartDate.toString().substring(0, 10),
                        rangeEndDate.toString().substring(0, 10),

                        teamMemberId,
                        [
                          InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
                          InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
                          InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
                          InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode,
                        ],
                      );
                    }
                  } else if (args.value is DateTime) {
                    final DateTime? selectedDate = args.value;
                    if (selectedDate != null) {
                      //getting planning month intervention data according to the selected data from the calender
                      final planningMonthCubit = BlocProvider.of<TeamMemberInterventionsCubit>(context);
                      planningMonthCubit.getTeamMemberInterventionsByDateRangeStatus(
                        selectedDate.toString().substring(0, 10),
                        selectedDate.toString().substring(0, 10),

                        teamMemberId,
                        [
                          InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
                          InterventionStatus.InterventionStatusRealisee.interventionStatusCode,
                          InterventionStatus.InterventionStatusStandBy.interventionStatusCode,
                          InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode
                        ],
                      );
                    }
                  }
                },
                controller: _controller,
                confirmText: "OK",
                selectionMode: DateRangePickerSelectionMode.single,
                monthViewSettings: DateRangePickerMonthViewSettings(
                    weekendDays: <int>[1, 6],
                    dayFormat: "EEE",
                    viewHeaderStyle:
                    DateRangePickerViewHeaderStyle(textStyle: TextStyle(color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold))),
                showNavigationArrow: true,
                headerHeight: 40.h,
                headerStyle: DateRangePickerHeaderStyle(
                    textStyle: TextStyle(color: AppColor.kBlackColor), textAlign: TextAlign.center, backgroundColor: AppColor.kWhiteColor),
                monthCellStyle:
                DateRangePickerMonthCellStyle(textStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColor.kBlackColor, fontSize: 16)),
              )),
          Expanded(
            // flex: 2,
              child: BlocConsumer<TeamMemberInterventionsCubit, TeamMemberInterventionsState>(
                listener: (context, state) {
                  if (state is TeamMemberInterventionsError) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${appLocalizations.translate("an_error_occured")}")));
                  }
                },
                builder: (context, state) {
                  if (state is TeamMemberInterventionsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TeamMemberInterventionsLoaded) {
                    List<teamMemberInterventionRecord.Records?>? _listOfRecords = state.listOfRecords;

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

                            final teamMemberInterventionRecord.Records listItem = _listOfRecords[index]!;

                            return GestureDetector(
                              onTap: () {
                                if (_listOfRecords[index] != null) {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (ctx) => TeamMemberSuccessScreenIndex(
                                        isTodos: (listItem.interventionStatusId == InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode)
                                            ? true
                                            : false,
                                        teamMemberInterventionRecords: listItem,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: getColor(listItem.interventionStatusId),
                                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5.0)],
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: AppRegularText("${listItem.scheduleStart?.substring(11,16)}\n - \n${listItem.scheduleEnd?.substring(11,16)}", fontSize: 12, color: AppColor.kWhiteColor, textAlign: TextAlign.center,),
                                        )),
                                    Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: ((listItem.interventionStatusId == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode) ||
                                                  (listItem.interventionStatusId == InterventionStatus.InterventionStatusStandBy.interventionStatusCode) ||
                                                  (listItem.interventionStatusId == InterventionStatus.InterventionStatusRealisee.interventionStatusCode))
                                                  ? AppColor.kWhiteColor.withOpacity(0.86)
                                                  : AppColor.kWhiteColor,
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), topRight: Radius.circular(5))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  AppBoldText("${listItem.client?.firstname} ${listItem.client?.lastname}", fontSize: 14),
                                                  if(listItem.client?.accNumber!=null) AppBoldText("ACC ${listItem.client?.accNumber}", fontSize: 12)
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Icon(Icons.location_on, color: getColor(listItem.interventionStatusId), size: 12),
                                                  SizedBox(width: 10),
                                                  Flexible(
                                                    child: AppBoldText("${listItem.client?.address} ${listItem.client?.postalCode??''}",
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              if(listItem.client?.market?.title !=null || listItem.client?.technical?.nbFils !=null || listItem.client?.technical?.meterRange !=null )
                                                SizedBox(height: 5),
                                              if(listItem.client?.market?.title !=null || listItem.client?.technical?.nbFils !=null || listItem.client?.technical?.meterRange !=null )
                                                AppBoldText(  "${listItem.client?.market?.title??''}  ${listItem.client?.technical?.nbFils??''}  ${listItem.client?.technical?.meterRange??''}", color: getColor(listItem.interventionStatusId), fontSize: 10)
                                            ]),
                                          ),
                                        )),
                                  ]),
                                ),
                              ),
                            );
                          },
                        ));
                  } else if (state is TeamMemberInterventionsError) {
                    return Center(
                        child: AppRegularText("${appLocalizations.translate("an_error_occured")}")
                    );
                  } else {
                    return Center(
                      child: AppRegularText(appLocalizations.translate("please_select_a_date_range_to_view_data"), textAlign: TextAlign.center),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}