import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/common_widgets/custom_text.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    Key? key,
    required this.pageControllerVal,
    required this.animateToPage,
    required this.containerColor,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  final PageController pageControllerVal;
  final int animateToPage;

  final Color containerColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageControllerVal.animateToPage(animateToPage, duration: Duration(microseconds: 100), curve: Curves.bounceInOut);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: containerColor),
        child: Center(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h), child: AppBoldText(text, color: textColor)),
        ),
      ),
    );
  }
}