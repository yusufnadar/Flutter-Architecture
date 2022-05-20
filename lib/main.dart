import 'package:flutter/material.dart';
import 'package:flutter_clean_project/bindings/bindings.dart';
import 'package:flutter_clean_project/config/routes.dart';
import 'package:flutter_clean_project/config/theme.dart';
import 'package:flutter_clean_project/constants/app.dart';
import 'package:flutter_clean_project/constants/localization.dart';
import 'package:flutter_clean_project/constants/route.dart';
import 'package:flutter_clean_project/logic/services/theme_service.dart';
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
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: appName,
        initialBinding: Binding(),
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeService.getThemeMode(),
        getPages: pages,
        localizationsDelegates: localizationsDelegates,
        initialRoute: splash,
      ),
    );
  }
}


