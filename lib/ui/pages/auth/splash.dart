import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/images.dart';
import 'package:flutter_clean_project/constants/local_storage.dart';
import 'package:flutter_clean_project/constants/route.dart';
import 'package:flutter_clean_project/logic/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    String? token = GetStorage().read(userToken);
    if (token != null) {
      Get.find<UserController>().getUser().then((value) {
        Future.delayed(const Duration(seconds: 2)).then(
          (value) => Get.offAndToNamed(bottomBar),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 2))
          .then((value) => Get.offAndToNamed(login));
    }
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            logo,
            height: Get.height * 0.2,
          ),
        ),
      ),
    );
  }
}
