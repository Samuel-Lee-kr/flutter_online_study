import 'package:get/get.dart';
import 'package:my_invoice/src/controllers/items_controller.dart';

class ItemsBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsController());
  }
}