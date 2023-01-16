import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_grip_case_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/reporting_a_grip_case_page.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/common_widgets/custom_sheet_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class InterventionHelpDetailsBottomSheet extends StatelessWidget {
  final Records? interventionRecords;
  final bool? isRc;
  final bool isForceGrip;
  const InterventionHelpDetailsBottomSheet({Key? key, this.interventionRecords, required this.isForceGrip, this.isRc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Container(
      height: 0.8.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: .03.sh),
            Container(height: 7, width: 100, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(15))),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black12,
                  )),
            ),
            Center(child: AppBoldText(appLocalizations.translate("help_center"), color: AppColor.kBlackColor, fontSize: 18.sp)),
            SizedBox(height: 0.02.sh),
            Expanded(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: AppRegularText(appLocalizations.translate("force_grip_sheet_notice"), color: AppColor.kAlertColor))),
            SizedBox(height: .03.sh),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomSheetButton(
                  title: appLocalizations.translate("force_case_grip"),
                  textColor: AppColor.kWhiteColor,
                  color: AppColor.kCaseColor,
                  onPressed: () {
                    if (isRc != null && isRc == true) {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                        return ReportingRCGripCasePage(isForceGrip: isForceGrip, interventionRecord: interventionRecords!);
                      }));
                    } else {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                        return ReportingAGripCasePage(isForceGrip: isForceGrip, interventionRecord: interventionRecords!);
                      }));
                    }
                  }),
            ),
            SizedBox(height: .03.sh)
          ],
        ),
      ),
    );
  }
}