import 'package:flutter_clean_project/constants/theme/theme.dart';
import 'package:get/get.dart';

class GetHelper {
  static snackBar(title, message, {backgroundColor}) => Get.snackbar(
        title,
        message,
        backgroundColor: backgroundColor ?? secondColor,
        colorText: whiteColor,
      );
}
