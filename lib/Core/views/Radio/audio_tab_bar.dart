import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_text_style.dart';

class AudioTabBar extends StatelessWidget {
  const AudioTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColor.primaryColor,
      labelColor: AppColor.secondaryColor,
      unselectedLabelColor: AppColor.accentColor,
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyle.bold16PrimaryColor,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.primaryColor,
      ),
      tabs: [
        Tab(text: "Radio"),
        Tab(text: "Reciters"),
      ],
    );
  }
}
