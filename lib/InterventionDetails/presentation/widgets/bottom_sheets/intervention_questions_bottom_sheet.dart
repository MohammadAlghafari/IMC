import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class InterventionQuestionBottomSheet extends StatelessWidget {
  final String sheetTitle;
  final Function onYesPressed;
  final Function onNoPressed;
  const InterventionQuestionBottomSheet({Key? key, required this.sheetTitle, required this.onYesPressed, required this.onNoPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBoldText(
            sheetTitle,
            fontSize: 18.sp,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CommonRoundedButton(color: AppColor.kSuccessColor, textColor: Colors.white, btnText: appLocalizations.translate("yes"), onPressed: onYesPressed),
              ),
              SizedBox(
                width: 0.03.sw,
              ),
              Expanded(
                child: CommonRoundedButton(btnText:appLocalizations.translate("no"), textColor: Colors.white, color: AppColor.kCaseColor, onPressed: onNoPressed),
              ),
            ],
          )
        ],
      ),
    );
  }
}
