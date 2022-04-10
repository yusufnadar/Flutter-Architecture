import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/app.dart';
import 'package:flutter_clean_project/constants/theme/color.dart';

regularFontStyle({Color? color, size}) => TextStyle(
    fontSize: size ?? 15,
    fontWeight: FontWeight.w400,
    color: color ?? blackColor,
    fontFamily: fontName);
