import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/widgets/board_screen.dart';
import 'package:islami_app/Core/widgets/navigate_on_boarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Widget> listOfScreens = [
    BoardScreen(
      text: "",
      imgNum: "1",
      headline: 'Welcome To Islmi App',
    ),
    BoardScreen(
      text: "We Are Very Excited To Have You In Our Community",
      imgNum: "2",
      headline: 'Welcome To Islmi App',
    ),
    BoardScreen(
      text: "Read, and your Lord is the Most Generous",
      imgNum: "3",
      headline: 'Reading the Quran',
    ),
    BoardScreen(
      text: "Praise the name of your Lord, the Most High",
      imgNum: "4",
      headline: 'Bearish',
    ),
    BoardScreen(
      text:
          "You can listen to the Holy Quran Radio through the application for free and easily",
      imgNum: "5",
      headline: 'Holy Quran Radio',
    ),
  ];

  PageController controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: controller,
                children: listOfScreens,
              ),
            ),
            NavigateOnBoarding(
                currentIndex: currentIndex, controller: controller),
          ],
        ),
      ),
    );
  }
}
