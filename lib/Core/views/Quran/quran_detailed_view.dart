import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Core/model/sura_model.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';
import 'package:islami_app/Core/widgets/decorated_head_line_of_detailed_sura.dart';

class QuranDetailedView extends StatefulWidget {
  const QuranDetailedView({super.key});
  static const String routeName = "QuranDetailedView";

  @override
  State<QuranDetailedView> createState() => _QuranDetailedViewState();
}

class _QuranDetailedViewState extends State<QuranDetailedView> {
  List<String> fileContent = [];
  late int index;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    index = ModalRoute.of(context)!.settings.arguments as int;
    loadFile();
  }

  Future<void> loadFile() async {
    final data = await rootBundle.loadString("assets/Suras/${index + 1}.txt");
    setState(() {
      fileContent = data.split("\n");
    });
  }

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedHeadLineOfDetailedSura(index: index),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: fileContent.map((line) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2), // ← اتحكم في المسافة
                    child: Text(
                      line,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.5, // ← ده الأهم
                        color: AppColor.primaryColor,
                        fontFamily: AppFont.jannaLt,
                        fontWeight: AppFont.jannaLtMedium,
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )),
          Image.asset("assets/img_bottom_decoration.png")
        ],
      ),
    );
  }
}
