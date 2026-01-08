import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/views/Time/azkar_widget.dart';
import 'package:islami/Core/views/Time/date_of_the_day.dart';
import 'package:islami/Core/views/Time/next_pray.dart';
import 'package:islami/Core/views/Time/pray_list.dart';
import 'package:islami/Core/widgets/custom_head_text.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * (300 / 850),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/gold_decoration.png"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(40),
              color: AppColor.timeColor,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DateOfTheDay(),
                ),
                PrayList(),
                NextPray(),
                SizedBox(height: 8),
              ],
            ),
          ),
          SizedBox(height: 12),
          CustomHeadText(text: "Azkar"),
          SizedBox(height: 8),

          Expanded(
            child: Row(
              children: [
                AzkarWidget(
                  imgPath: 'assets/Evening.png',
                  azkarTitle: 'Evening Azkar',
                ),
                SizedBox(width: 20),
                AzkarWidget(
                  imgPath: 'assets/Morning.png',
                  azkarTitle: 'Morning Azkar',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
