import 'package:flutter/material.dart';

class Customfont extends StatelessWidget {
  const Customfont(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.fontFamily = 'Frutiger',
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.left,
      this.letterSpacing = 0,
      this.fontStyle = FontStyle.normal});

  final String text;
  final double fontSize, letterSpacing;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final FontStyle fontStyle;

  static var titleStyle;

  static var subtitleStyle;

  static var bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing),
    );
  }
}
