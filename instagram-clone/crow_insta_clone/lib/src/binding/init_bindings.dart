import 'package:crow_insta_clone/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomNavController(), permanent: true);
  }
}