import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/widgets/rc_custom_listTile_large.dart';
import 'package:imc/InterventionDetails/presentation/widgets/custom_details_list_tile.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionRecordModel;

class SuccessDetailsWidget extends StatelessWidget {
  final teamLeaderInterventionRecordModel.Records teamLeaderinterventionRecords;
  const SuccessDetailsWidget({Key? key, required this.teamLeaderinterventionRecords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        SizedBox(height: 40),
        Row(
          children: [
            if (teamLeaderinterventionRecords.client?.market?.title != null)
              Expanded(
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.kPrimaryColor),
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: AppBoldText("${teamLeaderinterventionRecords.client?.market?.title}", color: AppColor.kWhiteColor, fontSize: 12)))),
              ),
            SizedBox(width: 10),
            if(teamLeaderinterventionRecords.client?.deployment?.computerAccessible !=null || teamLeaderinterventionRecords.client?.technical?.meterNumber !=null)
              Expanded(
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.kPrimaryColor.withOpacity(.4)),
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: AppBoldText("${teamLeaderinterventionRecords.client?.deployment?.computerAccessible??''} ${teamLeaderinterventionRecords.client?.technical?.meterNumber??''}", color: AppColor.kPrimaryColor, fontSize: 12)))),
              ),
          ],
        ),
        SizedBox(height: 15),
        if (teamLeaderinterventionRecords.client?.address != null) RCCustomListTileLarge(
          title: appLocalizations.translate("address"),
          description: "${teamLeaderinterventionRecords.client?.address}",
        ),
        if (teamLeaderinterventionRecords.client?.pdlNumber != null)  CustomDetailsListTile(title: "PDL", description: "${teamLeaderinterventionRecords.client?.pdlNumber}"),
        if (teamLeaderinterventionRecords.client?.market?.title != null)  CustomDetailsListTile(title: "${teamLeaderinterventionRecords.client?.market?.title}", description: "${teamLeaderinterventionRecords.client?.technical?.meterNumber??''}"),
        if (teamLeaderinterventionRecords.client?.technical?.meterType != null) CustomDetailsListTile(title: appLocalizations.translate("type"), description: "${teamLeaderinterventionRecords.client?.technical?.meterType}"),
        if (teamLeaderinterventionRecords.client?.technical?.contractRate != null)CustomDetailsListTile(title: appLocalizations.translate("pricing"), description: "${teamLeaderinterventionRecords.client?.technical?.contractRate}"),
        if (teamLeaderinterventionRecords.client?.technical?.powerSubscription != null)CustomDetailsListTile(title: appLocalizations.translate("power"), description: "${teamLeaderinterventionRecords.client?.technical?.powerSubscription}"),
        if (teamLeaderinterventionRecords.client?.technical?.nbFils != null)CustomDetailsListTile(title: appLocalizations.translate("number_of_wires"), description: "${teamLeaderinterventionRecords.client?.technical?.nbFils}"),
        if (teamLeaderinterventionRecords.client?.address != null)RCCustomListTileLarge(title: appLocalizations.translate("planner"), description: "${teamLeaderinterventionRecords.client?.address}"),
        if (teamLeaderinterventionRecords.client?.technical?.meterBrand != null)CustomDetailsListTile(title: appLocalizations.translate("customer_file"), description: "${teamLeaderinterventionRecords.client?.technical?.meterBrand} \n ${teamLeaderinterventionRecords.client?.deployment?.contract??''}"),
        if (teamLeaderinterventionRecords.client?.installationInstructions != null)Row(
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
        if (teamLeaderinterventionRecords.client?.installationInstructions != null)Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AppRegularText(
              "${teamLeaderinterventionRecords.client?.installationInstructions}",
              textAlign: TextAlign.start),
        ),
        SizedBox(height: 0.01.sh),
      ]),
    );
  }
}
