import 'package:flutter/material.dart';
import 'package:islami/Core/model/audio_model.dart';
import 'package:islami/Core/views/Radio/audio_list.dart';

class RadioAndRecitersTabs extends StatelessWidget {
  const RadioAndRecitersTabs({
    super.key,
    required this.radioList,
    required this.recitersList,
  });
  final List<RadioModel> radioList;
  final List<RecitersModel> recitersList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          AudioList(audioList: radioList),
          AudioList(audioList: recitersList),
        ],
      ),
    );
  }
}
