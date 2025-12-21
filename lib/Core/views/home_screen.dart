import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/tap_info.dart';
import 'package:islami_app/Core/utils/app_assets.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/views/Hadeth/hadeth_view.dart';
import 'package:islami_app/Core/views/Quran/quran_view.dart';

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
        content: HadethView()),
    TapInfo(
        background: AppAssets.background,
        iconPath: AppAssets.sebhaIcon,
        label: 'Sebha',
        content: Center(
            child: Text(
          'Sebha',
          style: TextStyle(
              color: AppColor.accentColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ))),
    TapInfo(
        background: AppAssets.background,
        iconPath: AppAssets.radioIcon,
        label: 'Radio',
        content: Center(
            child: Text(
          'Radio',
          style: TextStyle(
              color: AppColor.accentColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ))),
    TapInfo(
        background: AppAssets.background,
        iconPath: AppAssets.timeIcon,
        label: 'Time',
        content: Center(
            child: Text(
          'Time',
          style: TextStyle(
              color: AppColor.accentColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ))),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              listOfScreens[selectedIndex].background,
              fit: BoxFit.fill,
            ),
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
                indicatorColor:
                    AppColor.secondaryColor.withAlpha((0.6 * 255).toInt()),
                overlayColor: WidgetStatePropertyAll(AppColor.primaryColor),
                backgroundColor: AppColor.primaryColor,
                destinations: listOfScreens.map(
                  (screen) {
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
                  },
                ).toList(),
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
            ))
      ],
    );
  }
}
