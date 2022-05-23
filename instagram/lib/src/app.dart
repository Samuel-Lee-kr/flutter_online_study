import 'package:counter/src/components/image_data.dart';
import 'package:counter/src/pages/active_history.dart';
import 'package:counter/src/pages/home.dart';
import 'package:counter/src/pages/mypage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/bottom_nav_controller.dart';
import 'pages/search.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //파라미터가 위젯하나 칠드런하나 onWillpop의 이벤트 호출
    return WillPopScope(
        child: Obx(
            () => Scaffold(
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                const Home(),
                Navigator(
                  key: controller.serachPageNavigationKey,
                  onGenerateRoute: (routeSetting){
                    return MaterialPageRoute(builder: (context) => const Search());
                  },
                ),
                Container(),
                const ActiveHistory(),
                const MyPage()
              ],
            ),
            bottomNavigationBar:  BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,                  //라벨 안보여주기
              showUnselectedLabels: false,               //라벨 안보여주기
              currentIndex: controller.pageIndex.value,  //현재페이지 보여줌
              onTap: controller.changeBottomNav,        //바텀네비게이터 터치시 화면 전환
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
                    label: 'search'
                ),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.uploadIcon),
                    label: 'upload'
                ),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.activeOff),
                    activeIcon: ImageData(IconsPath.activeOn),
                    label: 'active'
                ),
                BottomNavigationBarItem(
                    label: 'mypage',
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
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
