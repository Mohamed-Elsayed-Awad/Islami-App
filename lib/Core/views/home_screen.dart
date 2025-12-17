import 'package:flutter/material.dart';
import 'package:islami_app/Core/constants/app_color.dart';

class HomeScreen extends StatelessWidget {
  static const homeScreen = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.accentColor,
    );
  }
}
