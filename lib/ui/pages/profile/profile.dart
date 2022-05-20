import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/local_storage.dart';
import 'package:flutter_clean_project/constants/route.dart';
import 'package:flutter_clean_project/ui/widgets/custom/custom_button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          text: 'Log out',
          onTap: ()async{
            await GetStorage().remove(userToken);
            Get.offAllNamed(login);
          },
        ),
      ),
    );
  }
}
