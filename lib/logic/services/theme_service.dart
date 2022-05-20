import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/local_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  static bool isSavedDarkMode() {
    return GetStorage().read(themeToken) ?? false;
  }

  static ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  static void saveThemeMode(bool value) async {
    await GetStorage().write(themeToken, value);
  }

  static void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}
