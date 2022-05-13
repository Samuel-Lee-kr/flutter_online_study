import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CountControllerWithGetx extends GetxController {
  
  static CountControllerWithGetx get to => Get.find();
  
  int count = 0;
  
  void increase(String id) {
    count++;
    update([id]);
  }
  
  void putNumber(String id, int value) {
    count = value;
    update([id]);
  }
}