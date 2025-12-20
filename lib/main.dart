import 'package:flutter/material.dart';
import 'package:islami_app/Core/views/Quran/quran_detailed_view.dart';
import 'package:islami_app/Core/views/Quran/quran_view.dart';
import 'package:islami_app/Core/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        QuranDetailedView.routeName: (_) => QuranDetailedView(),
        QuranView.routeName: (_) => QuranView(),
      },
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
