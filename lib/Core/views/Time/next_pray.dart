import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_text_style.dart';

class NextPray extends StatelessWidget {
  const NextPray({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(),
        Text("Next Pray - 02:32", style: AppTextStyle.bold16TimeColor),
        ImageIcon(AssetImage("assets/Volume Slash.png")),
      ],
    );
  }
}
