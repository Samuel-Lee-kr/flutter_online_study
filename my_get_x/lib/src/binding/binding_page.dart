import 'package:get/get.dart';
import 'package:my_get_x/src/controller/count_controller_with_getx.dart';

class BindingPageBinding implements Bindings {
  
  @override
  void dependencies() {
     Get.put(CountControllerWithGetx());
  }
  
}