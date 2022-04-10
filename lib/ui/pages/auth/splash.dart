import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.offAndToNamed(todo);
  }
}


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return const Scaffold(
      body: Center(
        child: Text('Gidicek'),
      ),
    );
  }
}
