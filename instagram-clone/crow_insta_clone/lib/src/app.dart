import 'package:crow_insta_clone/src/components/image_data.dart';
import 'package:crow_insta_clone/src/controller/bottom_nav_controller.dart';
import 'package:crow_insta_clone/src/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // callback?
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              Container(
                child: const Home(),
              ),
              Container(
                child: Center(child: Text('search')),
              ),
              Container(
                child: Center(child: Text('upload')),
              ),
              Container(
                child: Center(child: Text('activity')),
              ),
              Container(
                child: Center(child: Text('mypage')),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                  icon: ImageData(icon: IconsPath.homeOff),
                  activeIcon: ImageData(icon: IconsPath.homeOn),
                  label: "home"),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconsPath.searchOff),
                activeIcon: ImageData(icon: IconsPath.searchOn),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconsPath.uploadIcon),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconsPath.activeOff),
                activeIcon: ImageData(icon: IconsPath.activeOn),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: "home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
