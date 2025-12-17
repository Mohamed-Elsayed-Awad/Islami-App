import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/tap_info.dart';
import 'package:islami_app/Core/utils/app_assets.dart';
import 'package:islami_app/Core/utils/app_color.dart';

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
                color: AppColor.accentColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
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
      ],
    );
  }
}
