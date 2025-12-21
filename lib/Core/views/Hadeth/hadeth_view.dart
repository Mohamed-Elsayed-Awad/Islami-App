import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';
import 'package:islami_app/Core/views/Hadeth/hadeth_detailed_view.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<String> hadethLines = [];
  String title = "";
  String content = "";

  int selectedIndex = 0;
  Future<void> getHadethLines() async {
    final data =
        await rootBundle.loadString("assets/Hadeeth/h${selectedIndex + 1}.txt");
    hadethLines = data.split("\n");

    setState(() {
      content = hadethLines.sublist(1).join("\n");
      title = hadethLines[0];
    });
  }

  @override
  void initState() {
    super.initState();
    getHadethLines();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: 50,
            onPageChanged: (index) {
              selectedIndex = index;
              getHadethLines();
            },
            itemBuilder: (BuildContext context, int index) {
              return ScreenOfHadeth(
                arabicTitle: title,
                content: content,
                englishTitle: "Hadith ${selectedIndex + 1}",
              );
            },
          ),
        ),
      ],
    );
  }
}

class ScreenOfHadeth extends StatelessWidget {
  const ScreenOfHadeth(
      {super.key,
      required this.arabicTitle,
      required this.content,
      required this.englishTitle});
  final String arabicTitle;
  final String content;
  final String englishTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return HadethDetailedView(
                  englishTitle: englishTitle,
                  arabicTitle: arabicTitle,
                  content: content);
            },
          ));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
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
                        scale: 1.3,
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
                              fontWeight: AppFont.jannaLtBold),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Image.asset(
                        scale: 1.3,
                        "assets/img_right_corner.png",
                        color: AppColor.secondaryColor,
                      )
                    ],
                  ),
                ),
                Image.asset(
                  "assets/HadithCardBackGround 1.png",
                  scale: 1.03,
                ),
                Image.asset(
                  "assets/img_bottom_decoration.png",
                  color: AppColor.secondaryColor,
                )
              ],
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0, right: 16, left: 16),
                child: Text(
                  content,
                  maxLines: null,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontSize: 18,
                      fontFamily: AppFont.jannaLt,
                      fontWeight: AppFont.jannaLtBold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
