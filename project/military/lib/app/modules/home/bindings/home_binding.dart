import 'package:get/get.dart';

import 'package:military/app/modules/home/controllers/first_tab_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstTabController>(
      () => FirstTabController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
