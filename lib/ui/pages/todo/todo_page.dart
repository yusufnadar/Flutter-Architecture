// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_clean_project/logic/controller/todo_controller.dart';
import 'package:flutter_clean_project/logic/models/todo_model.dart';
import 'package:flutter_clean_project/ui/widgets/custom/custom_button.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/sized_box.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Index',
              onTap: () => todoController.index(),
            ),
            GetBuilder<TodoController>(
              builder: (c) => ListView.builder(
                shrinkWrap: true,
                itemCount: todoController.todoList.isNotEmpty
                    ? 3
                    : todoController.todoList.length,
                itemBuilder: (context, index) =>
                    Text(c.todoList[index].title.toString()),
              ),
            ),
            sizedBox3,
            CustomButton(
              text: 'Store',
              onTap: () {
                var todo = TodoModel(
                    userId: '1', title: 'Başlık', completed: true, id: '101');
                todoController.store(todo).then((value) => print(value));
              },
            ),
            sizedBox3,
            CustomButton(
                text: 'Update',
                onTap: () {
                  var todo = TodoModel(
                      userId: '', title: 'Başlık', completed: true, id: '10');
                  todoController.upToDate(todo, 3).then(
                        (value) => print(value),
                      );
                }),
            sizedBox3,
            CustomButton(
              text: 'Delete',
              onTap: () => todoController.delete(3).then(
                    (value) => print(value),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
