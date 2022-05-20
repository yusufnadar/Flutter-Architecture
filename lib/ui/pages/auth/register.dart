import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/images.dart';
import 'package:flutter_clean_project/constants/route.dart';
import 'package:flutter_clean_project/constants/theme/color.dart';
import 'package:flutter_clean_project/logic/controller/auth_controller.dart';
import 'package:flutter_clean_project/logic/models/user_model.dart';
import 'package:flutter_clean_project/ui/widgets/auth/already_account.dart';
import 'package:flutter_clean_project/ui/widgets/custom/custom_button.dart';
import 'package:flutter_clean_project/ui/widgets/custom/custom_input.dart';
import 'package:flutter_clean_project/ui/widgets/custom/custom_loading.dart';
import 'package:flutter_clean_project/utils/helpers/sized_box.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RxBool _obscure = true.obs;

  bool get obscure => _obscure.value;

  set obscure(bool obscure) => _obscure.value = obscure;
}

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<AuthController>(
          builder: (controller){
            if(controller.isLoading){
              return const CustomLoading();
            }else{
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: SizedBox(
                  height: Get.height - MediaQuery.of(context).viewPadding.top,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(logo, height: Get.height * 0.15),
                      Container(
                        margin: EdgeInsets.only(
                          top: Get.height * 0.1,
                          bottom: Get.height * 0.02,
                        ),
                        child: CustomInput(
                          controller: emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      CustomInput(
                        controller: nameController,
                        hintText: 'Ad-Soyad',
                      ),
                      sizedBox2,
                      GetX<RegisterController>(
                        init: RegisterController(),
                        builder: (controller)=>
                        CustomInput(
                          controller: passwordController,
                          hintText: 'Şifre',
                          obscureText: controller.obscure,
                          suffixIcon: GestureDetector(
                            onTap: () => controller.obscure = !controller.obscure,
                            child: Icon(
                              Icons.remove_red_eye,
                              color:
                              controller.obscure != true ? primaryColor : grayColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: Get.height * 0.02,
                          bottom: Get.height * 0.04,
                        ),
                        child: AlreadyAccount(
                          onTap: () => Get.offAndToNamed(login),
                          text: 'Hesabınız var mı?',
                          subtext: 'Giriş Yapın',
                        ),
                      ),
                      CustomButton(
                          text: 'Üye Ol',
                          onTap: (){
                            Get.find<AuthController>().register(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text
                            );
                          }//Get.offAndToNamed(bottomBar),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        ),
      ),
    );
  }
}
