import 'package:flutter/material.dart';
import 'package:islami/Core/utils/app_color.dart';
import 'package:islami/Core/utils/app_font.dart';

class SearchFeild extends StatelessWidget {
  const SearchFeild({super.key, this.onChange});
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      cursorColor: AppColor.accentColor,
      style: TextStyle(
        fontFamily: AppFont.jannaLt,
        color: AppColor.accentColor,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        hintText: "Sura Name",
        hintStyle: TextStyle(
          fontFamily: AppFont.jannaLt,
          fontSize: 16,
          fontWeight: AppFont.jannaLtRegular,
          color: AppColor.accentColor,
        ),
        prefixIcon: ImageIcon(
          AssetImage("assets/quranIcon.png"),
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
