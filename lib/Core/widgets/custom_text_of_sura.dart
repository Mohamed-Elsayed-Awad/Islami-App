import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class CustomTextOfSura extends StatelessWidget {
  const CustomTextOfSura(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize});
  final String text;
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFont.jannaLt,
        color: color,
        fontSize: fontSize,
        fontWeight: AppFont.jannaLtBold,
      ),
    );
  }
}
