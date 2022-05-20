import 'package:flutter_clean_project/logic/controller/auth_controller.dart';
import 'package:flutter_clean_project/logic/controller/user_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController());
  }
}
