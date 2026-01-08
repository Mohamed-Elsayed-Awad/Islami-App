import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_font.dart';
import 'package:islami/Core/views/Hadeth/hadeth_detailed_view.dart';

class ScreenOfHadeth extends StatelessWidget {
  const ScreenOfHadeth({
    super.key,
    required this.arabicTitle,
    required this.content,
    required this.englishTitle,
  });
  final String arabicTitle;
  final List<String> content;
  final String englishTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HadethDetailedView(
                  englishTitle: englishTitle,
                  arabicTitle: arabicTitle,
                  content: content.join(),
                );
              },
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/img_left_corner.png",
                        scale: 1.5,
                        color: AppColor.secondaryColor,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          arabicTitle,
                          style: TextStyle(
                            color: AppColor.secondaryColor,
                            fontSize: 22,
                            fontFamily: AppFont.jannaLt,
                            fontWeight: AppFont.jannaLtBold,
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Image.asset(
                        scale: 1.5,
                        "assets/img_right_corner.png",
                        color: AppColor.secondaryColor,
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/HadithCardBackGround 1.png", scale: 1.03),
                Image.asset(
                  "assets/img_bottom_decoration.png",
                  color: AppColor.secondaryColor,
                ),
              ],
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0, right: 16, left: 16),
                child: Text(
                  content.join(),
                  maxLines: null,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: AppColor.secondaryColor,
                    fontSize: 18,
                    fontFamily: AppFont.jannaLt,
                    fontWeight: AppFont.jannaLtBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
