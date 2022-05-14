import 'package:get/get.dart';
import 'package:my_invoice/src/controllers/invoice_controller.dart';

class NewInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvoiceController());
  }
}
