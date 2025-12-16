import 'package:flutter/material.dart';
import 'package:islami_app/Core/constants/app_color.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? AppColor.primaryColor : Colors.grey),
      width: isActive ? 18 : 7,
      height: 7,
    );
  }
}
