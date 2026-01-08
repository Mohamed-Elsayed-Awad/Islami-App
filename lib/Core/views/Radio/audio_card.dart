import 'package:flutter/material.dart';
import 'package:islami/Core/model/audio_model.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_text_style.dart';
import 'package:islami/Core/views/Radio/play_audio.dart';

class AudioCard extends StatelessWidget {
  const AudioCard({super.key, required this.audioModel});
  final AudioModel audioModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * (140 / 850),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bgMosque.png"),
          alignment: AlignmentGeometry.bottomCenter,
        ),
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(audioModel.name, style: AppTextStyle.bold20SecondryColor),
          PlayAudio(),
        ],
      ),
    );
  }
}
