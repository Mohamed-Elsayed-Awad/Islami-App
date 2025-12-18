import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class CustomHeadText extends StatelessWidget {
  const CustomHeadText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: AppColor.accentColor,
          fontFamily: AppFont.jannaLt,
          fontWeight: AppFont.jannaLtBold),
    );
  }
}
