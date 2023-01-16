import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_member/cubit/team_member_interventions_cubit.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecord;
import 'package:imc/TeamLeader/presentation/pages/success_page/team_member/team_member_success_screen_index.dart';

import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_function.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/app_localizations.dart';

class DetailsScreenRealizedWidget extends StatelessWidget {
  DetailsScreenRealizedWidget({
    Key? key,
    required this.listOfRecords,
  }) : super(key: key);

  final List<teamMemberInterventionRecord.Records?>? listOfRecords;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<TeamMemberInterventionsCubit, TeamMemberInterventionsState>(
      builder: (context, state) {
        if (state is TeamMemberInterventionsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TeamMemberInterventionsLoaded) {
          final int listLength = (listOfRecords?.length ?? 0) < 1 ? 1 : listOfRecords!.length;

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: listLength,
            itemBuilder: (context, index) {
              if (listOfRecords == null || listOfRecords!.isEmpty) {
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

              final interventionRecord = listOfRecords![index];
              return InterventionTile(
                tileColor: getColor(interventionRecord?.interventionStatusId),
                interventionRecords: interventionRecord,
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (ctx) => TeamMemberSuccessScreenIndex(isTodos: false, teamMemberInterventionRecords: interventionRecord)));
                },
              );
            },
          );
        }
        else if (state is TeamMemberInterventionsError) {
          return Center(
            child: AppRegularText(
                "${appLocalizations.translate("an_error_occured")}"),
          );
        }
        else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class InterventionTile extends StatelessWidget {
  final Function onTap;
  final Color tileColor;
  final teamMemberInterventionRecord.Records? interventionRecords;
  final bool? isTodos;
  const InterventionTile({Key? key, this.isTodos, required this.onTap, required this.tileColor, required this.interventionRecords}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
        decoration: BoxDecoration(
            color: tileColor.withOpacity(0.85),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5.0)],
            borderRadius: BorderRadius.circular(5)),
        child: Row(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AppRegularText("${interventionRecords?.scheduleStart?.substring(11,16)}\n    -\n${interventionRecords?.scheduleEnd?.substring(11,16)}", fontSize: 13.sp, color: AppColor.kWhiteColor)),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: (isTodos != null && isTodos == true) ? AppColor.kWhiteColor : AppColor.kWhiteColor.withOpacity(0.86),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), topRight: Radius.circular(5))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBoldText("${interventionRecords?.client?.firstname} ${interventionRecords?.client?.lastname}", fontSize: 14.sp),
                        if(interventionRecords?.client?.accNumber!=null)AppBoldText("ACC ${interventionRecords?.client?.accNumber??''}", fontSize: 12.sp)
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: tileColor, size: 12),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: AppBoldText(
                              "${interventionRecords?.client?.address}, ${interventionRecords?.client?.postalCode??''}",
                              fontSize: 12.5.sp),
                        )
                      ],
                    ),
                    if(interventionRecords?.client?.market?.title!=null||interventionRecords?.client?.technical?.nbFils!=null||interventionRecords?.client?.technical?.meterRange!=null)
                      SizedBox(height: 5.h),
                    if(interventionRecords?.client?.market?.title!=null||interventionRecords?.client?.technical?.nbFils!=null||interventionRecords?.client?.technical?.meterRange!=null)
                      AppBoldText("${interventionRecords?.client?.market?.title??''}  ${interventionRecords?.client?.technical?.nbFils??''}  ${interventionRecords?.client?.technical?.meterRange??''}", color: tileColor, fontSize: 11)
                  ]),
                ),
              )),
        ]),
      ),
    );
  }
}