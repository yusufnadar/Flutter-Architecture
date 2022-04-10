import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/theme/theme.dart';
import 'package:get/get.dart';

class DatePickButton extends StatelessWidget {
  final String? title;
  final ValueChanged<DateTime>? onDateTimeChanged;

  const DatePickButton({Key? key, this.title, this.onDateTimeChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var dateNow = DateTime.now();
        var pickerDate = await showDatePicker(
          context: context,
          locale: const Locale('tr', 'TR'),
          initialDate: dateNow,
          firstDate: dateNow,
          lastDate: DateTime(2030),
        );
        if (pickerDate != null) {
          onDateTimeChanged!(pickerDate);
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: Get.height*0.07,
        margin: EdgeInsets.symmetric(horizontal: Get.width*0.2),
        width: Get.width,
        decoration: BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Text(title!,style: regularFontStyle(color: whiteColor),),
      ),
    );
  }
}
