import 'package:flutter_clean_project/constants/api.dart';
import 'package:flutter_clean_project/constants/local_storage.dart';
import 'package:flutter_clean_project/constants/theme/color.dart';
import 'package:flutter_clean_project/logic/base/controller.dart';
import 'package:flutter_clean_project/logic/base/method.dart';
import 'package:flutter_clean_project/logic/models/user_model.dart';
import 'package:flutter_clean_project/utils/helpers/get_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController with BaseController {
  final Rx<UserModel> _user = UserModel().obs;

  UserModel get user => _user.value;

  set user(UserModel user) => _user.value = user;

  Future getUser() async {
    try {
      var user = await Method()
          .setEndPoint(EndPoints.getUser)
          .method('get', token: GetStorage().read(userToken));
      this.user = UserModel.fromJson(user);
      return this.user;
    } catch (e) {
      GetHelper.snackBar('Hata', e.toString(),backgroundColor: errorColor);
    }
  }
}
