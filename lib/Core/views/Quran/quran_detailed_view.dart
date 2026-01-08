import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Core/model/sura_model.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_text_style.dart';
import 'package:islami/Core/utils/shared_most_recently.dart';
import 'package:islami/Core/widgets/decorated_head_line_of_detailed_sura.dart';

class QuranDetailedView extends StatefulWidget {
  const QuranDetailedView({super.key});
  static const String routeName = "QuranDetailedView";

  @override
  State<QuranDetailedView> createState() => _QuranDetailedViewState();
}

class _QuranDetailedViewState extends State<QuranDetailedView> {
  List<String> fileContent = [];
  late int index;
  String content = "";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    index = ModalRoute.of(context)!.settings.arguments as int;
    SharedMostRecently.saveSuraList(index);
    loadFile();
  }

  Future<void> loadFile() async {
    final data = await rootBundle.loadString("assets/Suras/${index + 1}.txt");
    fileContent = data.split("\n");

    for (var i = 0; i < fileContent.length; i++) {
      if (fileContent[i] == " ") {
        continue;
      } else {
        content += " ${fileContent[i]} [${i + 1}]";
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor.withOpacity(1),
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColor.primaryColor),
        ),
        backgroundColor: AppColor.secondaryColor,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 15, 13, 10)),
        title: Text(
          SuraModel.englishQuranSurahs[index],
          style: AppTextStyle.bold20PrimaryColor,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          DecoratedHeadLineOfDetailedSura(index: index),
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
                      style: AppTextStyle.bold20PrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Image.asset("assets/img_bottom_decoration.png"),
        ],
      ),
    );
  }
}
