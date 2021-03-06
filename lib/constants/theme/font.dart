import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/app.dart';
import 'package:flutter_clean_project/constants/theme/color.dart';

regularFontStyle({Color? color,double? size}) => TextStyle(
      fontSize: size ?? 14,
      fontWeight: FontWeight.w400,
      color: color ?? blackColor,
      fontFamily: fontName,
    );

mediumFontStyle({Color? color, double? size}) => TextStyle(
  fontSize: size ?? 14,
  fontWeight: FontWeight.w500,
  color: color ?? blackColor,
  fontFamily: fontName,
);
