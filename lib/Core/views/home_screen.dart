import 'package:flutter/material.dart';
import 'package:islami/Core/model/tap_info.dart';
import 'package:islami/Core/utils/app_assets.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_text_style.dart';
import 'package:islami/Core/views/Hadeth/hadeth_view.dart';
import 'package:islami/Core/views/Quran/quran_view.dart';
import 'package:islami/Core/views/Radio/radio_view.dart';
import 'package:islami/Core/views/Sebha/sebha_view.dart';
import 'package:islami/Core/views/Time/time_view.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<TapInfo> listOfScreens = [
    TapInfo(
      background: AppAssets.background,
      iconPath: AppAssets.quranIcon,
      label: 'Quran',
      content: QuranView(),
    ),
    TapInfo(
      background: AppAssets.hadethBackground,
      iconPath: AppAssets.hadeethIcon,
      label: 'Hadeth',
      content: HadethView(),
    ),
    TapInfo(
      background: AppAssets.sebhaBackground,
      iconPath: AppAssets.sebhaIcon,
      label: 'Sebha',
      content: SebhaView(),
    ),
    TapInfo(
      background: AppAssets.radioBackground,
      iconPath: AppAssets.radioIcon,
      label: 'Radio',
      content: RadioView(),
    ),
    TapInfo(
      background: AppAssets.timeBackground,
      iconPath: AppAssets.timeIcon,
      label: 'Time',
      content: TimeView(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            listOfScreens[selectedIndex].background,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStatePropertyAll(
                TextStyle(color: AppColor.accentColor),
              ),
            ),
            child: NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedIndex: selectedIndex,
              indicatorColor: AppColor.secondaryColor.withAlpha(
                (0.6 * 255).toInt(),
              ),
              overlayColor: WidgetStatePropertyAll(AppColor.primaryColor),
              backgroundColor: AppColor.primaryColor,
              destinations: listOfScreens.map((screen) {
                int index = listOfScreens.indexOf(screen);
                return NavigationDestination(
                  icon: ImageIcon(
                    AssetImage(screen.iconPath),
                    color: index == selectedIndex
                        ? AppColor.accentColor
                        : AppColor.secondaryColor,
                  ),
                  label: screen.label,
                );
              }).toList(),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    width: 200,
                    height: 120,
                    AppAssets.topText,
                  ),
                ),
                Expanded(child: listOfScreens[selectedIndex].content),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
