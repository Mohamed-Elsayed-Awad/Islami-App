import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/sura_model.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';
import 'package:islami_app/Core/widgets/custom_text_of_sura.dart';
import 'package:islami_app/Core/widgets/custom_text_of_verse.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({
    super.key,
    required this.suraModel,
  });
  final SuraModel suraModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/img_sur_number_frame.png",
                    ),
                    Text(
                      "${suraModel.suraNumber + 1}",
                      style: TextStyle(
                          color: AppColor.accentColor,
                          fontFamily: AppFont.jannaLt,
                          fontSize: 14,
                          fontWeight: AppFont.jannaLtBold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextOfSura(
                      text: suraModel.englishName,
                      color: AppColor.accentColor,
                      fontSize: 20,
                    ),
                    CustomTextOfVerse(
                        text: "${suraModel.verses} Verses",
                        fontSize: 14,
                        color: AppColor.accentColor)
                  ],
                ),
              ],
            ),
            CustomTextOfSura(
              text: suraModel.arabicName,
              color: AppColor.accentColor,
              fontSize: 20,
            )
          ],
        ),
      ),
    );
  }
}
