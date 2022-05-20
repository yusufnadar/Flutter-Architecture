import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/theme/theme.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final MaterialColor? color;
  const CustomButton({Key? key, required this.text, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color ?? primaryColor,
        ),
        width: Get.width,
        height: Get.height*0.075,
        child: Center(
          child: Text(
            text,
            style: regularFontStyle(color: whiteColor,size: 18.0),
          ),
        ),
      ),
    );
  }
}
