import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class CustomTextOfVerse extends StatelessWidget {
  const CustomTextOfVerse({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });
  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: AppFont.jannaLt,
          color: color,
          fontSize: fontSize,
          fontWeight: AppFont.jannaLtBold),
    );
  }
}
