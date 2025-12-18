import 'package:flutter/material.dart';

class TapInfo {
  final String iconPath;
  final String label;
  final String background;
  final Widget content;

  TapInfo(
      {required this.iconPath,
      required this.label,
      required this.background,
      required this.content});
}
