import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/sura_model.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class DecoratedHeadLineOfDetailedSura extends StatelessWidget {
  const DecoratedHeadLineOfDetailedSura({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/img_left_corner.png"),
        Text(
          SuraModel.arabicAuranSuras[index],
          style: TextStyle(
              color: AppColor.primaryColor,
              fontFamily: AppFont.jannaLt,
              fontWeight: AppFont.jannaLtMedium,
              fontSize: 24),
        ),
        Image.asset("assets/img_right_corner.png")
      ],
    );
  }
}
