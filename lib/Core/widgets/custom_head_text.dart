import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_text_style.dart';

class CustomHeadText extends StatelessWidget {
  const CustomHeadText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.bold20AccentColor);
  }
}
