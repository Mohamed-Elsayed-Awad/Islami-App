import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class CustomTextOfSura extends StatelessWidget {
  const CustomTextOfSura({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFont.jannaLt,
        color: AppColor.secondaryColor,
        fontSize: 24,
        fontWeight: AppFont.jannaLtBold,
      ),
    );
  }
}
