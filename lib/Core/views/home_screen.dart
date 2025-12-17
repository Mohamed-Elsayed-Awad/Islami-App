import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/tap_info.dart';
import 'package:islami_app/Core/utils/app_assets.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';

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
      content: QuranScreen(),
    ),
    TapInfo(
        background: AppAssets.background,
        iconPath: AppAssets.hadeethIcon,
        label: 'Hadeth',
        content: Center(
          child: Text(
            'Hadeth',
            style: TextStyle(
                fontFamily: AppFont.appFont,
                color: AppColor.accentColor,
                fontSize: 30,
                fontWeight: AppFont.appFontBold),
          ),
        )),
    TapInfo(
        background: AppAssets.background,
        iconPath: AppAssets.sebhaIcon,
        label: 'Sebha',
        content: Center(
            child: Text(
          'Sebha',
          style: TextStyle(
              fontFamily: AppFont.appFont,
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
              fontFamily: AppFont.appFont,
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
              fontFamily: AppFont.appFont,
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
                TextStyle(
                    color: AppColor.accentColor,
                    fontFamily: AppFont.appFont,
                    fontWeight: AppFont.appFontNormal),
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
              destinations: List.generate(
                listOfScreens.length,
                (index) {
                  return customNavigationDistination(
                    iconPath: listOfScreens[index].iconPath,
                    label: listOfScreens[index].label,
                    isSelected: selectedIndex == index,
                  );
                },
              ),
            ),
          ),
          body: listOfScreens[selectedIndex].content,
        )
      ],
    );
  }
}

customNavigationDistination(
    {required String iconPath,
    required String label,
    required bool isSelected}) {
  return NavigationDestination(
    icon: ImageIcon(AssetImage(iconPath),
        color: isSelected ? AppColor.accentColor : AppColor.secondaryColor),
    label: label,
    selectedIcon: isSelected
        ? ImageIcon(
            AssetImage(iconPath),
            color: AppColor.accentColor,
          )
        : null,
  );
}

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Image.asset(AppAssets.topText),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
                cursorColor: AppColor.accentColor,
                decoration: InputDecoration(
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                      fontFamily: AppFont.appFont,
                      color: AppColor.accentColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColor.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColor.primaryColor),
                    ),
                    prefixIcon: ImageIcon(
                      AssetImage(AppAssets.quranIcon),
                      size: 24,
                    ),
                    prefixIconColor: AppColor.primaryColor)),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
            child: Text(
              "Most Recently",
              style: TextStyle(
                  color: AppColor.accentColor,
                  fontSize: 16,
                  fontFamily: AppFont.appFont,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Al-Anbiya",
                      style: TextStyle(
                          fontFamily: AppFont.appFont,
                          fontWeight: AppFont.appFontBold,
                          color: AppColor.secondaryColor,
                          fontSize: 24),
                    ),
                    Text(
                      "الأنبياء",
                      style: TextStyle(
                          fontFamily: AppFont.appFont,
                          fontWeight: AppFont.appFontSemiBold,
                          color: AppColor.secondaryColor,
                          fontSize: 24),
                    ),
                    Text(
                      "112 Verses",
                      style: TextStyle(
                          fontFamily: AppFont.appFont,
                          fontWeight: AppFont.appFontSemiBold,
                          color: AppColor.secondaryColor,
                          fontSize: 14),
                    ),
                  ],
                ),
                Image.asset("assets/img_most_recent.png")
              ],
            ),
          ),
        )
      ],
    );
  }
}
