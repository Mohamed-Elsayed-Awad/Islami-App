import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/sura_model.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/widgets/custom_text_of_sura.dart';
import 'package:islami_app/Core/widgets/custom_text_of_verse.dart';

class MostRecentlySura extends StatelessWidget {
  const MostRecentlySura({
    super.key,
    required this.suraModel,
  });
  final SuraModel suraModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.primaryColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextOfSura(
                  text: suraModel.englishName,
                  color: AppColor.secondaryColor,
                  fontSize: 24,
                ),
                CustomTextOfSura(
                  text: suraModel.arabicName,
                  color: AppColor.secondaryColor,
                  fontSize: 24,
                ),
                CustomTextOfVerse(
                    text: suraModel.verses,
                    fontSize: 14,
                    color: AppColor.secondaryColor)
              ],
            ),
            Image.asset("assets/img_most_recent.png"),
          ],
        ),
      ),
    );
  }
}
