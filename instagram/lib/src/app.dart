import 'package:counter/src/components/image_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/bottom_nav_controller.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //파라미터가 위젯하나 칠드런하나 onWillpop의 이벤트 호출
    return WillPopScope(
        child: Obx(
            () => Scaffold(
            appBar: AppBar(),
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                Container(
                  child: Center(child: Text('HOME')),
                ),
                Container(
                  child: Center(child: Text('SEARCH')),
                ),
                Container(
                  child: Center(child: Text('UPLOAD')),
                ),
                Container(
                  child: Center(child: Text('ACTIVITY')),
                ),
                Container(
                  child: Center(child: Text('MYPAGE')),
                ),
              ],
            ),
            bottomNavigationBar:  BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              onTap: controller.changeBottomNav,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.homeOff),
                    activeIcon: ImageData(IconsPath.homeOn),
                    label: 'home'
                ),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.searchOff),
                    activeIcon: ImageData(IconsPath.searchOn),
                    label: 'home'
                ),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.uploadIcon),
                    label: 'home'
                ),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.activeOff),
                    activeIcon: ImageData(IconsPath.activeOn),
                    label: 'home'
                ),
                BottomNavigationBarItem(
                    label: 'home',
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey,
                      ),
                    )
                )
              ],
            ),
          )
        ),
        onWillPop: controller.willPopAction
    );
  }
}
