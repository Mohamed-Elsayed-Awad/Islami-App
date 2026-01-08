import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_text_style.dart';

class DateOfTheDay extends StatelessWidget {
  const DateOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        SizedBox(
          width: 60,
          child: Text("16 July, 2024", style: AppTextStyle.bold16PrimaryColor),
        ),
        Column(
          children: [
            Text("Pray Time", style: AppTextStyle.bold20SecondryColor),
            Text("Tuesday", style: AppTextStyle.bold20TimeColor),
          ],
        ),
        SizedBox(
          width: 65,
          child: Text(
            textAlign: TextAlign.right,
            "09 Muh, 1446",
            style: AppTextStyle.bold16PrimaryColor,
          ),
        ),
      ],
    );
  }
}
