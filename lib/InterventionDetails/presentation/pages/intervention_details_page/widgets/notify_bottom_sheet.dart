import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/common_widgets/custom_sheet_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_icons.dart';

class NotifyBottomSheet extends StatelessWidget {
  final String title;
  final String btnText;
  final Function btnOnPressed;
  const NotifyBottomSheet({required this.title, this.btnText = "Start", required this.btnOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.4.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0)),
      ),
      child: Column(
        children: [
          SizedBox(height: .01.sh),
          Container(
              height: 7,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius:
                  BorderRadius.circular(15))),
          SizedBox(height: .03.sh),
          Image.asset(AppIcons.warning, scale: 3),
          SizedBox(height: .03.sh),
          Padding(
            padding:
            const EdgeInsets.symmetric(
                horizontal: 20),
            child: AppBoldText(
                title,
                fontSize: 18.sp,
                color: Colors.black,
                textAlign: TextAlign.center),
          ),
          Spacer(),
          Padding(
            padding:
            const EdgeInsets.symmetric(
                horizontal: 50),
            child: CustomSheetButton(
              textColor: Colors.white,
              title: btnText,
              color: AppColor.kPrimaryColor,
              onPressed: () {
                btnOnPressed();
              },
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
