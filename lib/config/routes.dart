import 'package:flutter_clean_project/constants/route.dart';
import 'package:flutter_clean_project/ui/pages/auth/splash.dart';
import 'package:flutter_clean_project/ui/pages/todo/todo_page.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(name: splash, page: ()=>const Splash()),
  GetPage(name: splash, page: ()=> const TodoPage()),
];
