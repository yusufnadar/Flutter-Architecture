import 'package:flutter_clean_project/constants/route.dart';
import 'package:flutter_clean_project/ui/pages/auth/login.dart';
import 'package:flutter_clean_project/ui/pages/auth/register.dart';
import 'package:flutter_clean_project/ui/pages/auth/splash.dart';
import 'package:flutter_clean_project/ui/pages/bottom_bar/bottom_bar.dart';
import 'package:flutter_clean_project/ui/pages/todo/todo_page.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(name: splash, page: ()=>const Splash(),transition: Transition.native),
  GetPage(name: todo, page: ()=> const TodoPage(),transition: Transition.native),
  GetPage(name: login, page: ()=> Login(),transition: Transition.native),
  GetPage(name: register, page: ()=> Register(),transition: Transition.native),
  GetPage(name: bottomBar, page: ()=> const BottomBar(),transition: Transition.native),
];
