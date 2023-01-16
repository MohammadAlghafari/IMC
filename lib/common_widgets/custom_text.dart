import 'package:flutter/material.dart';

class AppRegularText extends StatelessWidget {
  final String text, fontFamily;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int maxLines;
  final FontStyle fontStyle;
  AppRegularText(this.text,
      {this.fontSize = 14,
      this.color,
      this.fontWeight = FontWeight.w300,
      this.fontFamily = 'Regular',
      this.letterSpacing,
      this.textDecoration = TextDecoration.none,
      this.textAlign = TextAlign.start,
      this.height = 1.4,
      this.maxLines = 100,
      this.fontStyle = FontStyle.normal});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        // overflow: TextOverflow.ellipsis,
        style: TextStyle(
            height: height,
            color: color,
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            decoration: textDecoration));
  }
}

class AppBoldText extends StatelessWidget {
  final String text, fontFamily;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int maxLines;
  final FontStyle fontStyle;
  AppBoldText(this.text,
      {this.fontSize = 14,
      this.color,
      this.fontWeight = FontWeight.bold,
      this.fontFamily = 'Bold',
      this.letterSpacing,
      this.textDecoration = TextDecoration.none,
      this.textAlign = TextAlign.start,
      this.height = 1.4,
      this.maxLines = 100,
      this.fontStyle = FontStyle.normal});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            height: height,
            color: color,
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            decoration: textDecoration));
  }
}
