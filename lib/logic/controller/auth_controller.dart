import 'package:flutter_clean_project/constants/api.dart';
import 'package:flutter_clean_project/logic/base/controller.dart';
import 'package:flutter_clean_project/logic/base/method.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with BaseController {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool isLoading) => _isLoading.value = isLoading;

  changeLoading(isLoading){
    _isLoading.value = isLoading;
  }

  Future login({required email, required password}) async {
    try{
      changeLoading(true);
      var user = await Method()
          .setEndPoint(EndPoints.login)
          .setBody({'email': email, 'password': password}).method('post');
      await checkUserAndNavigate(user);
    }catch(e){
      await checkErrorAndShow(e);
    }finally{
      changeLoading(false);
    }
  }

  Future register({required email, required password, required name}) async {
    try{
      changeLoading(true);
      var user = await Method()
          .setEndPoint(EndPoints.register)
          .setBody({'email': email, 'password': password,'name':name}).method('post');
      await checkUserAndNavigate(user);
    }catch(e){
      await checkErrorAndShow(e);
    }finally{
      changeLoading(false);
    }
  }
}
