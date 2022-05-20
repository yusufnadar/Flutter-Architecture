// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_project/constants/enums.dart';
import 'package:flutter_clean_project/constants/navigators.dart';

import '../../../constants/theme/theme.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  TabItem? currentTab = TabItem.HOME;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (navigatorIndex.length == 1 && navigatorIndex.contains(0)) {
          // ilk sekmedeysen ve sadece ilk sekme kaldıysa if kısmı çalışır
          // sekmeden farklı sayfaya gittiysen goBack false döner
          var goBack =
              !await navigatorKeys[currentTab]!.currentState!.maybePop();
          if (goBack) {
            SystemNavigator.pop();
          }
        } else if(navigatorIndex.length == 1) {
          // arkada ilk sekme hariç tek sekme açık kalırsa geri tuşuna
          // basına ilk sekmeye döndürüyoruz
          //  currentTab = navigatorKeys.keys.;
          var goBack =
          !await navigatorKeys[currentTab]!.currentState!.maybePop();
          print(currentTab);
          print(goBack);
          if(goBack){
            setState(() {
              currentIndex = 0;
              navigatorIndex = [0];
              currentTab = TabItem.HOME;
            });
          }
        } else {
          // [0,3,2] örnek liste böyleyse geri yaptığında listedeki son elemanı çıkarıp o sayfaya gidiyor
          var goBack =
              !await navigatorKeys[currentTab]!.currentState!.maybePop();
          if (goBack) {
            navigatorIndex.removeLast();
            setState(() {
              currentIndex = navigatorIndex.last;
            });
          }
        }
        return Future.value(false);
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: navigatorList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: primaryColor,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          unselectedItemColor: grayColor,
          onTap: (index) {
            setState(() {
              if (navigatorIndex.contains(index)) {
                navigatorIndex.remove(index);
                navigatorIndex.add(index);
              } else {
                navigatorIndex.add(index);
              }
              // eğer bir sekme içerisindeyken yine aynı sekmeye tıklarsan
              // o sekmenin bulunduğu ilk sayfaya gitsin
              if (currentIndex == index) {
                navigatorKeys[currentTab]?.currentState?.popUntil(
                      (route) => route.isFirst,
                    );
              } else {
                // eğer bir sekme içerisindeyken başka sekmeye tıklarsan
                // currentTabi ve currentIndexi degisir
                var newTabItem = TabItem.values[index];
                currentTab = newTabItem;
                currentIndex = index;
              }
            });
            // uygulama ilk açıldığında tüm navigatorların aynı anda
            // yüklenmemesi için o sekmeye gidince navigatorı listeye
            // ekleyip listeyi de bodyde döndürüyoruz
            if (!navigatorList.contains(allNavigators[currentIndex])) {
              if (currentIndex != 0) {
                navigatorList.add(allNavigators[currentIndex]);
              }
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
