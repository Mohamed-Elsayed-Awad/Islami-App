import 'package:flutter/material.dart';
import 'package:islami/Core/model/audio_model.dart';
import 'package:islami/Core/views/Radio/audio_card.dart';

class AudioList extends StatelessWidget {
  const AudioList({super.key, required this.audioList});
  final List<AudioModel> audioList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: audioList.length,
      itemBuilder: (context, index) {
        return AudioCard(audioModel: audioList[index]);
      },
    );
  }
}
