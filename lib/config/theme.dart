import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/app.dart';
import 'package:flutter_clean_project/constants/theme/theme.dart';

class Themes {
  static var darkTheme = ThemeData();

  static var lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: regularFontStyle(color: whiteColor, size: 22.0),
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    fontFamily: fontName,
    scaffoldBackgroundColor: whiteColor,
  );
}
