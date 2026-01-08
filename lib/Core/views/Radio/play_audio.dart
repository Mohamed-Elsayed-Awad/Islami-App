import 'package:flutter/material.dart';

class PlayAudio extends StatelessWidget {
  const PlayAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        SizedBox(width: 55),
        ImageIcon(AssetImage("assets/Polygon 2.png"), size: 44),
        SizedBox(width: 20),
        ImageIcon(AssetImage("assets/Volume High.png"), size: 30),
      ],
    );
  }
}
