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
        padding: EdgeInsets.all(16),
        width: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextOfSura(
                  text: suraModel.englishName,
                  color: AppColor.secondaryColor,
                  fontSize: 20,
                ),
                CustomTextOfSura(
                  text: suraModel.arabicName,
                  color: AppColor.secondaryColor,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextOfVerse(
                    text: "${suraModel.verses} Verses",
                    fontSize: 12,
                    color: AppColor.secondaryColor)
              ],
            ),
            Image.asset(
              "assets/img_most_recent.png",
              scale: 1.3,
            ),
          ],
        ),
      ),
    );
  }
}
