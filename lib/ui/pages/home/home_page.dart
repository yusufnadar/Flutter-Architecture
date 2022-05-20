import 'package:flutter/material.dart';
import 'package:flutter_clean_project/logic/controller/user_controller.dart';
import 'package:flutter_clean_project/ui/pages/todo/todo_page.dart';
import 'package:flutter_clean_project/ui/widgets/custom/custom_button.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Get.find<UserController>().user.email!),
            CustomButton(
              text: 'Go Todo',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TodoPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
