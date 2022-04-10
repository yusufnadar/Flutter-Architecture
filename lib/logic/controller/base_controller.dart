import 'package:get/get.dart';

mixin BaseController {
  handleWithSomething(func) {
    try {
      return func();
    } catch (e) {
      Get.snackbar('Hata', e.toString());
      rethrow;
    }
  }
}
