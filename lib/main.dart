import 'package:flutter/material.dart';
import 'package:flutter_clean_project/config/theme.dart';
import 'package:flutter_clean_project/constants/app.dart';
import 'package:flutter_clean_project/constants/localization.dart';
import 'package:flutter_clean_project/ui/pages/todo/todo_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:()=> GetMaterialApp(
        title: appName,
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: localizationsDelegates,
        home: TodoPage(),
        //initialRoute: '/',
      ),
      designSize: const Size(375,812),
    );
  }
}
