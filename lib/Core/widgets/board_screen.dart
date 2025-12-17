import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen(
      {super.key,
      required this.text,
      required this.imgNum,
      required this.headline});
  final String text;
  final String headline;
  final String imgNum;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset("assets/topText.png"),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Image.asset(
              "assets/$imgNum.png",
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            headline,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 24,
                fontFamily: AppFont.appFont,
                fontWeight: AppFont.appFontNormal),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            text,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 20,
                fontFamily: AppFont.appFont,
                fontWeight: AppFont.appFontNormal),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
