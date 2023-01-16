import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSheetButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textColor;
  final onPressed;

  const CustomSheetButton(
      {this.title = '', this.onPressed, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: AppBoldText(title,
              color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
