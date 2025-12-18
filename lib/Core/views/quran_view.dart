import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/sura_model.dart';
import 'package:islami_app/Core/utils/app_assets.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/widgets/custom_head_text.dart';
import 'package:islami_app/Core/widgets/custom_text_feild.dart';
import 'package:islami_app/Core/widgets/most_recently_sura.dart';
import 'package:islami_app/Core/widgets/sura_item.dart';

class QuranView extends StatelessWidget {
  QuranView({super.key});
  List<SuraModel> listOfSura = [
    SuraModel(
      suraNumber: '1',
      englishName: 'Al-Fatiha',
      arabicName: 'الفاتحة',
      verses: '7 Verses',
    ),
  ];
  List<SuraModel> listOFMostRecently = [
    SuraModel(
      suraNumber: '1',
      englishName: 'Al-Fatiha',
      arabicName: 'الفاتحة',
      verses: '7 Verses',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            width: 200,
            height: 200,
            AppAssets.topText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomTextFeild(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
          child: CustomHeadText(
            text: "Most Recently",
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MostRecentlySura(suraModel: listOFMostRecently[0]);
            },
            itemCount: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomHeadText(text: "Sura List"),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return SuraItem(suraModel: listOfSura[0]);
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                indent: 64,
                endIndent: 50,
                color: AppColor.accentColor,
              );
            },
          ),
        ),
      ],
    );
  }
}
