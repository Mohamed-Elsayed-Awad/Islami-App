import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/sura_model.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';
import 'package:islami_app/Core/widgets/decorated_head_line_of_detailed_sura.dart';

class QuranDetailedView extends StatelessWidget {
  const QuranDetailedView({super.key});
  static const String routeName = "QuranDetailedView";

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColor.primaryColor,
          ),
        ),
        backgroundColor: AppColor.secondaryColor,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 15, 13, 10)),
        title: Text(
          SuraModel.englishQuranSurahs[index],
          style: TextStyle(
              color: AppColor.primaryColor,
              fontFamily: AppFont.jannaLt,
              fontWeight: AppFont.jannaLtMedium,
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                DecoratedHeadLineOfDetailedSura(index: index),
              ],
            ),
          ),
          Image.asset("assets/img_bottom_decoration.png")
        ],
      ),
    );
  }
}
