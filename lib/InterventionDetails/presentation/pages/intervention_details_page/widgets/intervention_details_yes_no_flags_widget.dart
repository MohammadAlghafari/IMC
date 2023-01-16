import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class InterventionDetailsYesNoFlagWidget extends StatefulWidget {
  final String title;
  final bool? value;
  final Function(bool value)? onButtonPressed;
  final String? yesButtonText;
  final String? noButtonText;
  const InterventionDetailsYesNoFlagWidget(
      {Key? key, required this.title, this.value, this.onButtonPressed, this.yesButtonText, this.noButtonText})
      : super(key: key);

  @override
  State<InterventionDetailsYesNoFlagWidget> createState() => _InterventionDetailsYesNoFlagWidgetState();
}

class _InterventionDetailsYesNoFlagWidgetState extends State<InterventionDetailsYesNoFlagWidget> {
  bool? value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.022.sh),
      child: Column(
        children: [
          AppBoldText(
            widget.title,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: CommonRoundedButton(
                  btnText: widget.yesButtonText ?? appLocalizations.translate("yes"),
                  textColor: value == true ? AppColor.kWhiteColor : Colors.grey,
                  color: value == true ? AppColor.kSuccessColor : Colors.black12,
                  onPressed: () {
                    setState(() => value = true);
                    if (widget.onButtonPressed != null) {
                      widget.onButtonPressed!(true);
                    }
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: CommonRoundedButton(
                  btnText: widget.noButtonText ?? appLocalizations.translate("no"),
                  textColor: value == false ? AppColor.kWhiteColor : Colors.grey,
                  color: value == false ? AppColor.kCaseColor : Colors.black12,
                  onPressed: () {
                    setState(() => value = false);
                    if (widget.onButtonPressed != null) {
                      widget.onButtonPressed!(false);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
