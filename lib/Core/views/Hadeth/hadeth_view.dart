import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Core/model/hadeth_model.dart';
import 'package:islami/Core/views/Hadeth/screen_of_hadeth.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  @override
  void initState() {
    super.initState();
    loadHadethFiles();
  }

  List<HadethModel> hadethList = [];

  void loadHadethFiles() async {
    for (var i = 1; i <= 50; i++) {
      String hadethContent = await rootBundle.loadString(
        "assets/Hadeeth/h$i.txt",
      );
      List<String> hadethLines = hadethContent.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel = HadethModel(title: title, content: hadethLines);
      hadethList.add(hadethModel);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: hadethList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          ScreenOfHadeth(
            arabicTitle: hadethList[itemIndex].title,
            content: hadethList[itemIndex].content,
            englishTitle: "${itemIndex + 1} Hadeth",
          ),
      options: CarouselOptions(
        viewportFraction: 0.8,
        height: 800,
        aspectRatio: 16 / 9,
        initialPage: 0,
        autoPlay: true,
        enableInfiniteScroll: true,
        reverse: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
