import 'package:flutter/material.dart';
import 'package:islami/Core/model/sura_model.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_text_style.dart';
import 'package:islami/Core/views/Quran/quran_detailed_view.dart';
import 'package:islami/Core/utils/shared_most_recently.dart';
import 'package:islami/Core/widgets/custom_head_text.dart';
import 'package:islami/Core/widgets/search_feild.dart';
import 'package:islami/Core/widgets/most_recently_sura.dart';
import 'package:islami/Core/widgets/sura_item.dart';
import 'package:islami/main.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});
  static const String routeName = "QuranView";

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> with RouteAware {
  List<SuraModel> listOFMostRecently = [];
  List<SuraModel> filteredList = [];
  @override
  void initState() {
    super.initState();
    filteredList = SuraModel.suraList;
    addMostRecently();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    addMostRecently();
  }

  void addMostRecently() {
    listOFMostRecently = SharedMostRecently.getSuraList()
        .map(
          (e) => SuraModel(
            suraNumber: e,
            englishName: SuraModel.englishQuranSurahs[e],
            arabicName: SuraModel.arabicAuranSuras[e],
            verses: SuraModel.ayaNumber[e],
          ),
        )
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SearchFeild(
            onChange: (text) {
              if (text.isEmpty) {
                filteredList = SuraModel.suraList;
              }
              filteredList = SuraModel.suraList.where((sura) {
                return sura.englishName.toLowerCase().contains(
                      text.toLowerCase(),
                    ) ||
                    sura.arabicName.contains(text);
              }).toList();
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
          child: CustomHeadText(text: "Most Recently"),
        ),
        listOFMostRecently.isEmpty
            ? Center(
                child: Text(
                  "لا يوجد سور",
                  style: AppTextStyle.bold24PrimaryColor,
                ),
              )
            : SizedBox(
                height: 140,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          QuranDetailedView.routeName,
                          arguments: listOFMostRecently[index].suraNumber,
                        );
                        // .then((onValue) {
                        SharedMostRecently.saveSuraList(
                          listOFMostRecently[index].suraNumber,
                        );
                        //   if (onValue == true) {
                        //     addMostRecently();
                        //   }
                        // });
                      },
                      child: MostRecentlySura(
                        suraModel: listOFMostRecently[index],
                      ),
                    );
                  },
                  itemCount: listOFMostRecently.length,
                ),
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomHeadText(text: "Sura List"),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    QuranDetailedView.routeName,
                    arguments: filteredList[index].suraNumber,
                  );

                  SharedMostRecently.saveSuraList(
                    filteredList[index].suraNumber,
                  );
                  // .then((set) {
                  //   if (set == true) {
                  //     addMostRecently();
                  //   }
                  // });
                },
                child: SuraItem(suraModel: filteredList[index]),
              );
            },
            itemCount: filteredList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                indent: 64,
                endIndent: 50,
                color: AppColor.accentColor,
              );
            },
          ),
        ),
      ],
    );
  }
}
