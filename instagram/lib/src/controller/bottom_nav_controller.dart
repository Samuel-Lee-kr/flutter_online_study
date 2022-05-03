import 'dart:io';

import 'package:counter/src/components/message_popup.dart';
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
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> serachPageNavigationKey = GlobalKey<NavigatorState>();
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

    //히스토리 관리를 위해 List안에 페이지 index가 있으면 지우고 추가한다.(중복방지 => 밀어내기)
    // if(bottomHistory.contains(value)){
    //   bottomHistory.remove(value);
    // }
    //
    // bottomHistory.add(value);
    // print(bottomHistory);

    if(bottomHistory.last != value){
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopAction() async {
    //히스토리 적재된 페이지가 없을경우 뒤로가기 누르면 앱 종료 팝업을 띄운다.
    if(bottomHistory.length==1){
      showDialog(context: Get.context!
          ,builder: (context) => MessagePopup(
              title: '시스템',
              message: '종료하시겠습니까',
              okCallback: (){exit(0);},
              cancelCallback: Get.back,
          ));
      return true;
    }else{

      var page = PageName.values[bottomHistory.last];
      if(page == PageName.SEARCH){
        var value = await serachPageNavigationKey.currentState!.maybePop(); //팝이 있는지 체크(boolean타입으로 반환)
        if(value) return false;
      }

      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture:false);
      return false;
    }
  }
}