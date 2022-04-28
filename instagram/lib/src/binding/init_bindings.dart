import 'package:counter/src/controller/bottom_nav_controller.dart';
import 'package:get/instance_manager.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {

    //permanent를 true로 함으로서 앱이 실행하는동안 컨트롤러 계속 메모리에 올라감
    Get.put(BottomNavController(), permanent: true);
  }
}