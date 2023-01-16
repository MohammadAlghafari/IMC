import 'package:flutter/material.dart';
import 'package:imc/common_widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String icon;
  final double height;
  final Color? color;
  final Color? textColor;
  final double borderRadius;
  final onPressed;

  const CustomButton(
      {this.title = '',
      this.onPressed,
      this.icon = '',
      this.height = 45,
      this.borderRadius = 16.0,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, height),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: onPressed,
        child: AppBoldText(
          title,
          fontSize: 15,
          fontFamily: 'Bold',
          color: textColor,
        ));
  }
}
