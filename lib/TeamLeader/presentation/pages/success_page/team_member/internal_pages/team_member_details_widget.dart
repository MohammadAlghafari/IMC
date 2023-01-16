import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/widgets/rc_custom_listTile_large.dart';
import 'package:imc/InterventionDetails/presentation/widgets/custom_details_list_tile.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecordModel;

class TeamMemberSuccessDetailsWidget extends StatelessWidget {
  final teamMemberInterventionRecordModel.Records? teamMemberInterventionRecords;
  const TeamMemberSuccessDetailsWidget({Key? key, required this.teamMemberInterventionRecords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        SizedBox(height: 10),
        Row(
          children: [
            if (teamMemberInterventionRecords?.client?.market?.title != null)
              Expanded(
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.kPrimaryColor),
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: AppBoldText("${teamMemberInterventionRecords?.client?.market?.title}", color: AppColor.kWhiteColor, fontSize: 12)))),
              ),
            SizedBox(width: 10),
            if(teamMemberInterventionRecords?.client?.deployment?.computerAccessible !=null || teamMemberInterventionRecords?.client?.technical?.meterNumber !=null)
              Expanded(
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.kPrimaryColor.withOpacity(.4)),
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: AppBoldText('${teamMemberInterventionRecords?.client?.deployment?.computerAccessible??''} ${teamMemberInterventionRecords?.client?.technical?.meterNumber??''}', color: AppColor.kPrimaryColor, fontSize: 12)))),
              ),
          ],
        ),
        SizedBox(height: 15),
        if (teamMemberInterventionRecords?.client?.address != null) RCCustomListTileLarge(
          title: appLocalizations.translate("address"),
          description: "${teamMemberInterventionRecords?.client?.address}",
        ),
        if (teamMemberInterventionRecords?.client?.pdlNumber != null) CustomDetailsListTile(title: "PDL", description: "${teamMemberInterventionRecords?.client?.pdlNumber}"),
        if (teamMemberInterventionRecords?.client?.market?.title != null) CustomDetailsListTile(title:"${teamMemberInterventionRecords?.client?.market?.title}", description: "${teamMemberInterventionRecords?.client?.technical?.meterNumber}"),
        if (teamMemberInterventionRecords?.client?.technical?.meterType != null) CustomDetailsListTile(title: appLocalizations.translate("type"), description: "${teamMemberInterventionRecords?.client?.technical?.meterType}"),
        if (teamMemberInterventionRecords?.client?.technical?.contractRate != null) CustomDetailsListTile(title: appLocalizations.translate("pricing"), description: "${teamMemberInterventionRecords?.client?.technical?.contractRate}"),
        if (teamMemberInterventionRecords?.client?.technical?.powerSubscription != null) CustomDetailsListTile(title: appLocalizations.translate("power"), description: "${teamMemberInterventionRecords?.client?.technical?.powerSubscription}"),
        if (teamMemberInterventionRecords?.client?.technical?.nbFils != null) CustomDetailsListTile(title: appLocalizations.translate("number_of_wires"), description: "${teamMemberInterventionRecords?.client?.technical?.nbFils}"),
        if (teamMemberInterventionRecords?.client?.address != null)RCCustomListTileLarge(title: appLocalizations.translate("planner"), description: "${teamMemberInterventionRecords?.client?.address}"),
        if (teamMemberInterventionRecords?.client?.technical?.meterBrand != null)CustomDetailsListTile(title: appLocalizations.translate("customer_file"), description: "${teamMemberInterventionRecords?.client?.technical?.meterBrand} \n ${teamMemberInterventionRecords?.client?.deployment?.contract??'' }"),

        if( teamMemberInterventionRecords?.client?.installationInstructions!=null) Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBoldText(appLocalizations.translate("last_report"), color: AppColor.kPrimaryColor),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.kPrimaryColor,
              ),
              child: Center(child: AppBoldText("2", color: AppColor.kWhiteColor)),
            )
          ],
        ),
        SizedBox(height: 20),
        if( teamMemberInterventionRecords?.client?.installationInstructions!=null) Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AppRegularText(
              "${teamMemberInterventionRecords?.client?.installationInstructions}",
              textAlign: TextAlign.start),
        ),
        SizedBox(height: 0.01.sh),
      ]),
    );
  }
}