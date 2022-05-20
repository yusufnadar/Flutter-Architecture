import 'package:flutter_clean_project/constants/local_storage.dart';
import 'package:flutter_clean_project/constants/route.dart';
import 'package:flutter_clean_project/constants/theme/color.dart';
import 'package:flutter_clean_project/logic/controller/auth_controller.dart';
import 'package:flutter_clean_project/logic/controller/user_controller.dart';
import 'package:flutter_clean_project/utils/helpers/get_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

mixin BaseController {
  handleWithSomething(func) {
    try {
      Get.find<AuthController>().isLoading = true;
      func();
    } catch (e) {
      GetHelper.snackBar('Hata', e.toString(), backgroundColor: errorColor);
    } finally {
      Get.find<AuthController>().isLoading = false;
    }
  }

  Future checkUserAndNavigate(user) async {
    if (user['token'] != null) {
      await GetStorage().write(userToken, user['token']);
      var isUser = await Get.find<UserController>().getUser();
      if (isUser != null) {
        Future.delayed(const Duration(seconds: 1))
            .then((value) => Get.find<AuthController>().isLoading = false);
        await Get.offAllNamed(bottomBar);
      }
    }
  }

  Future checkErrorAndShow(error) async {
    var errorTitle = error.toString().split('/')[0];
    var errorDescription = error.toString().split('/')[1];
    GetHelper.snackBar(errorTitle, errorDescription,backgroundColor: errorColor);
  }
}
