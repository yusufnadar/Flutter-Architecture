import 'package:flutter_clean_project/constants/api.dart';
import 'package:flutter_clean_project/logic/base/method.dart';
import 'package:flutter_clean_project/logic/base/controller.dart';
import 'package:flutter_clean_project/logic/models/todo_model.dart';
import 'package:get/get.dart';

class TodoController extends GetxController with BaseController {
  List<TodoModel> todoList = <TodoModel>[].obs;

  Future<List<TodoModel>?> index() => handleWithSomething(() async {
        var result = await Method().setEndPoint(EndPoints.todos).method('get');
        if (result.isNotEmpty) {
          todoList =
              List<TodoModel>.from(result.map((e) => TodoModel.fromJson(e)));
          update();
        }
      });

  Future store(TodoModel todo) => handleWithSomething(
        () async => await Method()
            .setEndPoint(EndPoints.todos)
            .setBody(todo.toJson())
            .method('post'),
      );

  Future upToDate(TodoModel todo, id) => handleWithSomething(
        () async => await Method()
            .setEndPoint(EndPoints.todos + '/$id')
            .setBody(todo.toJson())
            .method('put'),
      );

  Future delete(id) async => handleWithSomething(
        () async => await Method()
            .setEndPoint(EndPoints.todos + '/$id')
            .method('delete'),
      );
}
