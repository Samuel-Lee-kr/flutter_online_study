import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/message_popup.dart';
import '../pages/upload.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value); // 여기가 문제
    }
    // if (bottomHistory.contains(value)) {
    //   bottomHistory.remove(value);
    // }
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: '시스템',
          message: '종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: (){
            Get.back();
          },
        ),
      );
      return true;
    } else {
      // bottomHistory.removeAt(bottomHistory.length - 1); // index가 0부터 시작하니깐 -1
      bottomHistory.removeLast(); // 마지막 추가된 리스트요소를 삭제
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
