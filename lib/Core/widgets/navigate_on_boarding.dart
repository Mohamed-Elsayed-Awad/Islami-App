import 'package:flutter/material.dart';
import 'package:islami_app/Core/views/home_screen.dart';
import 'package:islami_app/Core/widgets/back_next_button.dart';
import 'package:islami_app/Core/widgets/custom_indicator.dart';

class NavigateOnBoarding extends StatelessWidget {
  const NavigateOnBoarding({
    super.key,
    required this.currentIndex,
    required this.controller,
  });

  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              } else {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              }
            },
            text: "Next")
      ],
    );
  }
}
