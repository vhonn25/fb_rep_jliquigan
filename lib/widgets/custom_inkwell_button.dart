import 'package:facebook_application/widgets/constants.dart';
import 'package:facebook_application/widgets/customfont.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInkwellButton extends StatelessWidget {
  final onTap;
  final double height;
  final double width;
  final double fontSize;
  final String buttonName;
  final Icon icon;
  FontWeight fontWeight;
  Color bgColor;
  Color fontColor;

  CustomInkwellButton(
      {super.key,
      required this.onTap,
      required this.height,
      required this.width,
      this.buttonName = '',
      this.bgColor = FB_PURPLE_PRIMARY,
      this.fontColor = Colors.white,
      this.fontSize = 1,
      this.icon = const Icon(null),
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        splashColor: FB_PURPLE_WHITE,
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: buttonName == ''
                ? icon
                : Customfont(
                    text: buttonName, fontSize: fontSize, color: fontColor),
          ),
        ),
      ),
    );
  }
}
