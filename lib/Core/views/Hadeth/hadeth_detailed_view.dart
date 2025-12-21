import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class HadethDetailedView extends StatelessWidget {
  const HadethDetailedView(
      {super.key,
      required this.englishTitle,
      required this.arabicTitle,
      required this.content});
  static const String routeName = "DetailedView";
  final String englishTitle;
  final String arabicTitle;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
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
          englishTitle,
          style: TextStyle(
              color: AppColor.primaryColor,
              fontFamily: AppFont.jannaLt,
              fontWeight: AppFont.jannaLtMedium,
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/img_left_corner.png"),
              Text(
                arabicTitle,
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontFamily: AppFont.jannaLt,
                    fontWeight: AppFont.jannaLtMedium,
                    fontSize: 24),
              ),
              Image.asset("assets/img_right_corner.png")
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.7,
                            color: AppColor.primaryColor,
                            fontSize: 20,
                            fontWeight: AppFont.jannaLtMedium,
                            fontFamily: AppFont.jannaLt),
                      )
                    ]),
              ),
            ),
          ),
          Image.asset("assets/img_bottom_decoration.png")
        ],
      ),
    );
  }
}
