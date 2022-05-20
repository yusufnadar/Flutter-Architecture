import 'package:flutter_clean_project/constants/local_storage.dart';
import 'package:flutter_clean_project/constants/theme/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetHelper {
  static SnackbarController snackBar(title, message, {backgroundColor,duration}) =>
      Get.snackbar(
        title,
        message,
        backgroundColor: backgroundColor ?? secondColor,
        colorText: whiteColor,
        duration: duration ?? const Duration(seconds: 1)
      );

  static getTheme() {
    return GetStorage().read(themeToken) ?? false;
  }

  static changeTheme() {}
}
