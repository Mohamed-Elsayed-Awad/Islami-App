import 'package:flutter/material.dart';
import 'package:islami_app/Core/constants/app_color.dart';
import 'package:islami_app/Core/widgets/back_next_button.dart';
import 'package:islami_app/Core/widgets/board_screen.dart';
import 'package:islami_app/Core/widgets/custom_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                    visible: currentIndex > 0,
                    maintainState: true,
                    maintainSize: true,
                    maintainAnimation: true,
                    child: BackNextButton(
                        onPressed: () {
                          if (currentIndex > 0) {
                            controller.previousPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          }
                        },
                        text: "Back")),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIndicator(isActive: currentIndex == 0),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIndicator(isActive: currentIndex == 1),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIndicator(isActive: currentIndex == 2),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIndicator(isActive: currentIndex == 3),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIndicator(isActive: currentIndex == 4),
                  ],
                ),
                BackNextButton(
                    onPressed: () {
                      if (currentIndex < 4) {
                        controller.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeIn);
                      }
                    },
                    text: "Next")
              ],
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
