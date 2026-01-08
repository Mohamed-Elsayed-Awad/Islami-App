import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_font.dart';
import 'package:islami/Core/utils/shared_sebha.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  List<String> tasbeh = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا اله الا الله",
  ];

  int counter = SharedSebha.getCounter();
  double angle = 0;
  int tasbehIndex = SharedSebha.getTasbeha();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          counter++;
          if (counter == 33) {
            counter = 0;
            tasbehIndex++;
          }
          if (tasbehIndex == tasbeh.length) {
            tasbehIndex = 0;
          }
          angle += 0.3;
          SharedSebha.saveTasbeha(tasbehIndex);
          SharedSebha.saveCounter(counter);
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: TextStyle(
              color: AppColor.accentColor,
              fontFamily: AppFont.jannaLt,
              fontSize: 36,
              fontWeight: AppFont.jannaLtBold,
            ),
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Image.asset("assets/top.png"),
                  Transform.rotate(
                    alignment: Alignment.center,
                    angle: angle,
                    child: Image.asset("assets/Sebha.png", fit: BoxFit.fill),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Text(
                    tasbeh[SharedSebha.getTasbeha()],
                    style: TextStyle(
                      color: AppColor.accentColor,
                      fontSize: 36,
                      fontWeight: AppFont.jannaLtBold,
                      fontFamily: AppFont.jannaLt,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "${SharedSebha.getCounter()}",
                    style: TextStyle(
                      color: AppColor.accentColor,
                      fontFamily: AppFont.jannaLt,
                      fontWeight: AppFont.jannaLtBold,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
