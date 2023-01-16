import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/widgets/rc_custom_listTile_large.dart';
import 'package:imc/InterventionDetails/presentation/widgets/custom_details_list_tile.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_models/intervention_record_model.dart';

class CustomerDetailsWidget extends StatefulWidget {
  final Records interventionRecord;
  const CustomerDetailsWidget({Key? key, required this.interventionRecord}) : super(key: key);

  @override
  State<CustomerDetailsWidget> createState() => _CustomerDetailsWidgetState();
}

class _CustomerDetailsWidgetState extends State<CustomerDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Row(
            children: [
              if (widget.interventionRecord.client?.market?.title != null)
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.kPrimaryColor),
                      child: Center(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              child: AppBoldText("${widget.interventionRecord.client?.market?.title}", color: AppColor.kWhiteColor, fontSize: 12)))),
                ),
              SizedBox(width: 10),
              if(widget.interventionRecord.client?.deployment?.computerAccessible !=null || widget.interventionRecord.client?.technical?.meterNumber !=null)
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.kPrimaryColor.withOpacity(.4)),
                      child: Center(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              child: AppBoldText(
                                  "${widget.interventionRecord.client?.deployment?.computerAccessible??''} ${widget.interventionRecord.client?.technical?.meterNumber??''}",
                                  color: AppColor.kPrimaryColor,
                                  fontSize: 12)))),
                ),
            ],
          ),
          SizedBox(height: 15),
          RCCustomListTileLarge(
            title: appLocalizations.translate("address"),
            description: "${widget.interventionRecord.client?.address}, ${widget.interventionRecord.client?.postalCode??''}",
          ),
          if (widget.interventionRecord.client?.pdlNumber != null)
            CustomDetailsListTile(title: "PDL", description: "${widget.interventionRecord.client?.pdlNumber}"),
          if (widget.interventionRecord.client?.market?.title != null)
            CustomDetailsListTile(
                title: "${widget.interventionRecord.client?.market?.title}", description: "${widget.interventionRecord.client?.technical?.meterNumber}"),
          if (widget.interventionRecord.client?.technical?.meterType != null)
            CustomDetailsListTile(title: appLocalizations.translate("type"), description: "${widget.interventionRecord.client?.technical?.meterType}"),
          if (widget.interventionRecord.client?.technical?.contractRate != null)
            CustomDetailsListTile(
                title: appLocalizations.translate("pricing"), description: "${widget.interventionRecord.client?.technical?.contractRate}"),
          if (widget.interventionRecord.client?.technical?.powerSubscription != null)
            CustomDetailsListTile(
                title: appLocalizations.translate("power"), description: "${widget.interventionRecord.client?.technical?.powerSubscription}"),
          if (widget.interventionRecord.client?.technical?.nbFils != null)
            CustomDetailsListTile(
                title: appLocalizations.translate("number_of_wires"), description: "${widget.interventionRecord.client?.technical?.nbFils}"),
          RCCustomListTileLarge(title: appLocalizations.translate("planner"), description: "${widget.interventionRecord.client?.address}"),
          if(widget.interventionRecord.client?.technical?.nbFils!=null|| widget.interventionRecord.client?.deployment?.contract!=null)
            CustomDetailsListTile(title: appLocalizations.translate("customer_file"),
                description: "${widget.interventionRecord.client?.technical?.nbFils??''} \n ${ widget.interventionRecord.client?.deployment?.contract??''}"),
          SizedBox(height: 20),
          if(widget.interventionRecord.client?.installationInstructions!=null)Row(
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
          if(widget.interventionRecord.client?.installationInstructions!=null)Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppRegularText("${widget.interventionRecord.client?.installationInstructions}", textAlign: TextAlign.start),
          ),
          SizedBox(height: 0.1.sh),
        ]),
      ),
    );
  }
}