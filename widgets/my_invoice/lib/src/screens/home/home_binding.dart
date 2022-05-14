import 'package:get/get.dart';
import 'package:my_invoice/src/controllers/all_invoices_controller.dart';

class HomeBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put(AllInvoiceController(), permanent: true);
  }
  
}