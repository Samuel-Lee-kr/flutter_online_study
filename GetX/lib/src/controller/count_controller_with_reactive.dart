import 'package:get/get.dart';

enum NUM {
  FIRST, SECOND
}

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}

class CountControllerWithReactive extends GetxController{
  RxInt count = 0.obs;
  // RxDouble double = 0.0.obs;
  // RxString value = "".obs;
  Rx<NUM> nums = NUM.FIRST.obs; //enum타입 선언방법
  Rx<User> user = User(name: "준호", age: 34).obs; //class타입 선언방법
  RxList list = [].obs;

  void increase(){
    count ++;
  }

  void putNumber(int value){
    count(value);
  }

  @override
  void onInit() {
    //ever는 매번 값이 변경될때마다 호출
    ever(count, (_) => print("매번호출"));
    //once는 최초 값이 변경될때 한번 호출
    once(count, (_) => print("매번호출"));
    //debounce는 마지막 변경에 한번만 호출
    //time으로 1초있다가 호출
    debounce(count, (_) => print("매번호출"), time: Duration(seconds: 1));
    //interval는 변경되고 있는동안 호출
    //time으로 1초마다 호출
    interval(count, (_) => print("변경되고 있는동안 1초마다 호출"), time: Duration(seconds: 1));
    super.onInit();
  }
}