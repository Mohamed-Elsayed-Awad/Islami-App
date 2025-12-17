import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class BackNextButton extends StatelessWidget {
  const BackNextButton(
      {super.key, required this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: WidgetStateProperty.all(
            Colors.transparent,
          ),
          overlayColor: WidgetStatePropertyAll(Colors.transparent)),
      child: Text(
        text,
        style: TextStyle(
            color: AppColor.primaryColor,
            fontFamily: AppFont.appFont,
            fontWeight: AppFont.appFontBold),
      ),
    );
  }
}
