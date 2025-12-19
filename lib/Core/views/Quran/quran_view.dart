import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/sura_model.dart';
import 'package:islami_app/Core/utils/app_assets.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';
import 'package:islami_app/Core/views/Quran/quran_detailed_view.dart';
import 'package:islami_app/Core/widgets/custom_head_text.dart';
import 'package:islami_app/Core/widgets/custom_text_feild.dart';
import 'package:islami_app/Core/widgets/most_recently_sura.dart';
import 'package:islami_app/Core/widgets/sura_item.dart';

class QuranView extends StatefulWidget {
  QuranView({super.key});
  static const String routeName = "QuranView";

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  List<SuraModel> listOFMostRecently = [];

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
        listOFMostRecently.isEmpty
            ? Center(
                child: Text(
                "لا يوجد سور",
                style: TextStyle(
                    fontFamily: AppFont.jannaLt,
                    fontWeight: AppFont.jannaLtBold,
                    fontSize: 24,
                    color: AppColor.primaryColor),
              ))
            : SizedBox(
                height: 140,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MostRecentlySura(
                        suraModel: listOFMostRecently[index]);
                  },
                  itemCount: listOFMostRecently.length,
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
              return GestureDetector(
                onTap: () {
                  bool exist = listOFMostRecently
                      .any((object) => object.suraNumber == index);
                  if (!exist) {
                    listOFMostRecently.insert(
                      0,
                      SuraModel(
                          suraNumber: index,
                          englishName: SuraModel.englishQuranSurahs[index],
                          arabicName: SuraModel.arabicAuranSuras[index],
                          verses: SuraModel.ayaNumber[index]),
                    );
                  }

                  Navigator.of(context)
                      .pushNamed(QuranDetailedView.routeName, arguments: index)
                      .then((index) {
                    if (index == true) {
                      setState(() {});
                    }
                  });
                },
                child: SuraItem(
                    suraModel: SuraModel(
                        suraNumber: index,
                        englishName: SuraModel.englishQuranSurahs[index],
                        arabicName: SuraModel.arabicAuranSuras[index],
                        verses: SuraModel.ayaNumber[index])),
              );
            },
            itemCount: SuraModel.arabicAuranSuras.length,
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
