import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/theme/theme.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final Function? onTap;
  final MaterialColor? color;
  const CustomButton({Key? key, required this.title, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
      child: GestureDetector(
        onTap: onTap!(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color ?? primaryColor,
          ),
          width: Get.width,
          height: Get.height * 0.065,
          child: Center(
            child: Text(
              title,
              style: regularFontStyle(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
