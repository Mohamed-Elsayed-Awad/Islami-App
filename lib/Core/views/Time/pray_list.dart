import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/Core/model/pray_time.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_text_style.dart';

class PrayList extends StatelessWidget {
  PrayList({super.key});
  final List<PrayTime> prayTimes = [
    PrayTime(name: "Fajr", time: "05:10", period: "Am"),
    PrayTime(name: "Sunrise", time: "06:35", period: "Am"),
    PrayTime(name: "Dhuhr", time: "12:05", period: "Pm"),
    PrayTime(name: "Asr", time: "04:30", period: "Pm"),
    PrayTime(name: "Maghrib", time: "06:02", period: "Pm"),
    PrayTime(name: "Isha", time: "07:25", period: "Pm"),
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: prayTimes.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            width: 104,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: AlignmentGeometry.topLeft,
                end: AlignmentGeometry.bottomRight,
                colors: [AppColor.secondaryColor, AppColor.primaryColor],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  prayTimes[itemIndex].name,
                  style: AppTextStyle.bold16PrimaryColor,
                ),
                Text(
                  prayTimes[itemIndex].time,
                  style: AppTextStyle.bold32AccentColor,
                ),
                Text(
                  prayTimes[itemIndex].period,
                  style: AppTextStyle.bold16PrimaryColor,
                ),
              ],
            ),
          ),
      options: CarouselOptions(
        viewportFraction: 0.3,
        height: 130,
        aspectRatio: 16 / 9,
        initialPage: 0,
        // autoPlay: true,
        enableInfiniteScroll: true,
        reverse: false,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enlargeFactor: 0.22,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
