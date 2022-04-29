import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/upload.dart';

enum PageName{
  HOME,
  SEARCH,
  UPLOAD,
  ACTIVITY,
  MYPAGE
}

class BottomNavController extends GetxController{
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}){
    var page = PageName.values[value];

    //페이지 이동
    switch(page){
      case PageName.UPLOAD :
        Get.to(()=>Upload());
        break;
      case PageName.HOME :
      case PageName.SEARCH :
      case PageName.ACTIVITY :
      case PageName.MYPAGE :
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}){
    pageIndex(value);
    if(!hasGesture) return;

    if(!bottomHistory.contains(value)){
      bottomHistory.remove(value);
    }

    bottomHistory.add(value);
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if(bottomHistory.length==1){
      print("exit!");
      return true;
    }else{
      print("go to before page");
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture:false);
      bottomHistory.removeLast();
      return false;
    }
  }
}