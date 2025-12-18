import 'package:flutter/material.dart';
import 'package:islami_app/Core/utils/app_color.dart';
import 'package:islami_app/Core/utils/app_font.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColor.accentColor,
      style: TextStyle(
        fontFamily: AppFont.jannaLt,
        color: AppColor.accentColor,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          ),
        ),
        hintText: "Sura Name",
        hintStyle: TextStyle(
            fontFamily: AppFont.jannaLt,
            fontSize: 16,
            fontWeight: AppFont.jannaLtRegular,
            color: AppColor.accentColor),
        prefixIcon: ImageIcon(
          AssetImage("assets/quranIcon.png"),
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
