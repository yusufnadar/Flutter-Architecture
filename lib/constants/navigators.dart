import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/enums.dart';
import 'package:flutter_clean_project/ui/pages/home/home_page.dart';
import 'package:flutter_clean_project/ui/pages/profile/profile.dart';

var allNavigators = <Widget>[
  Navigator(
    key: navigatorKeys[TabItem.HOME],
    onGenerateRoute: (settings) {
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    },
  ),
  Navigator(
    key: navigatorKeys[TabItem.PROFILE],
    onGenerateRoute: (settings) {
      return MaterialPageRoute(
        builder: (context) => const Profile(),
      );
    },
  )
];

var navigatorList = <Widget>[
  Navigator(
    key: navigatorKeys[TabItem.HOME],
    onGenerateRoute: (settings) {
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    },
  )
];

var navigatorIndex = [
  0
];

var navigatorKeys = {
  TabItem.HOME: GlobalKey<NavigatorState>(),
  TabItem.PROFILE: GlobalKey<NavigatorState>(),
};
