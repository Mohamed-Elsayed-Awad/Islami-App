import 'package:flutter/material.dart';
import 'package:islami_app/Core/model/sura_model.dart';
import 'package:islami_app/Core/model/tap_info.dart';
import 'package:islami_app/Core/utils/app_assets.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';
import 'package:islami_app/Core/widgets/custom_head_text.dart';
import 'package:islami_app/Core/widgets/custom_text_of_sura.dart';
import 'package:islami_app/Core/widgets/custom_text_of_verse.dart';

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
  QuranScreen({super.key});
  List<SuraItem> listOfSura = [
    SuraItem(
      suraModel: SuraModel(
        suraNumber: '1',
        englishName: 'Al-Fatiha',
        arabicName: 'الفاتحة',
        verses: '7 Verses',
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Image.asset(
            width: 200,
            height: 200,
            AppAssets.topText,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              cursorColor: AppColor.accentColor,
              style: TextStyle(
                fontFamily: AppFont.jannaLt,
                color: AppColor.accentColor,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
                hintText: "Sura Name",
                hintStyle: TextStyle(
                    fontFamily: AppFont.jannaLt,
                    fontSize: 16,
                    fontWeight: AppFont.jannaLtRegular,
                    color: AppColor.accentColor),
                prefixIcon: ImageIcon(
                  AssetImage("assets/quranIcon.png"),
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
            child: CustomHeadText(
              text: "Most Recently",
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MostRecentlySura(
                  englsihName: 'Al-Anbiya',
                  arabicName: 'الأنبياء',
                  verses: '112 Verses',
                );
              },
              itemCount: 5,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomHeadText(text: "Sura List"),
          ),
        ),
        SliverList.separated(
          itemBuilder: (context, index) {
            return listOfSura[0];
          },
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              indent: 64,
              endIndent: 50,
              color: AppColor.accentColor,
            );
          },
        ),
      ],
    );
  }
}

class SuraItem extends StatelessWidget {
  const SuraItem({
    super.key,
    required this.suraModel,
  });
  final SuraModel suraModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/img_sur_number_frame.png",
                  ),
                  Text(
                    suraModel.suraNumber,
                    style: TextStyle(
                        color: AppColor.accentColor,
                        fontFamily: AppFont.jannaLt,
                        fontSize: 14,
                        fontWeight: AppFont.jannaLtBold),
                  ),
                ],
              ),
              SizedBox(
                width: 24,
              ),
              Column(
                children: [
                  CustomTextOfSura(
                    text: suraModel.englishName,
                    color: AppColor.accentColor,
                    fontSize: 20,
                  ),
                  CustomTextOfVerse(
                      text: suraModel.verses,
                      fontSize: 14,
                      color: AppColor.accentColor)
                ],
              ),
            ],
          ),
          CustomTextOfSura(
            text: suraModel.arabicName,
            color: AppColor.accentColor,
            fontSize: 20,
          )
        ],
      ),
    );
  }
}

class MostRecentlySura extends StatelessWidget {
  const MostRecentlySura({
    super.key,
    required this.englsihName,
    required this.arabicName,
    required this.verses,
  });
  final String englsihName;
  final String arabicName;
  final String verses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.primaryColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextOfSura(
                  text: englsihName,
                  color: AppColor.secondaryColor,
                  fontSize: 24,
                ),
                CustomTextOfSura(
                  text: arabicName,
                  color: AppColor.secondaryColor,
                  fontSize: 24,
                ),
                CustomTextOfVerse(
                    text: verses, fontSize: 14, color: AppColor.secondaryColor)
              ],
            ),
            Image.asset("assets/img_most_recent.png"),
          ],
        ),
      ),
    );
  }
}
