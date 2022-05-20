// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/theme/color.dart';
import 'package:get/get.dart';

class CustomInput extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool? obscureText;
  Widget? suffixIcon;
  TextInputType? keyboardType;

  CustomInput(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.obscureText,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.075,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          fillColor: lightGrayColor,
          filled: true,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.red,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
