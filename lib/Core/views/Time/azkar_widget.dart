import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_text_style.dart';

class AzkarWidget extends StatelessWidget {
  const AzkarWidget({
    super.key,
    required this.imgPath,
    required this.azkarTitle,
  });
  final String imgPath;
  final String azkarTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColor.primaryColor,
          ),
        ),
        child: Column(
          children: [
            Image.asset(imgPath),
            Text(azkarTitle, style: AppTextStyle.bold20AccentColor),
          ],
        ),
      ),
    );
  }
}
