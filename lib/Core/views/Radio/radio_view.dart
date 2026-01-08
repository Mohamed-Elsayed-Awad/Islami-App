import 'package:flutter/material.dart';
import 'package:islami/Core/model/audio_model.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/views/Radio/audio_tab_bar.dart';
import 'package:islami/Core/views/Radio/radio_and_reciters_tabs.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              color: AppColor.secondaryColor.withOpacity(0.7),
              child: AudioTabBar(),
            ),
            SizedBox(height: 16),
            RadioAndRecitersTabs(
              radioList: RadioModel.radioList,
              recitersList: RecitersModel.recitersList,
            ),
          ],
        ),
      ),
    );
  }
}
