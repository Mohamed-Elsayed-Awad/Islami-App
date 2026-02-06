import 'package:flutter/material.dart';
import 'package:islami/Core/views/Hadeth/shared_hadeth.dart';
import 'package:islami/Core/views/Quran/quran_detailed_view.dart';
import 'package:islami/Core/views/Quran/quran_view.dart';
import 'package:islami/Core/utils/shared_most_recently.dart';
import 'package:islami/Core/utils/shared_sebha.dart';
import 'package:islami/Core/views/home_screen.dart';
import 'package:islami/Core/views/onboarding_screen.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedSebha.init();
  await SharedHadeth.init();
  await SharedMostRecently.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: OnboardingScreen.routeName,
      navigatorObservers: [routeObserver],
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        QuranDetailedView.routeName: (_) => QuranDetailedView(),
        QuranView.routeName: (_) => QuranView(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
