import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/controllers/invoice_controller.dart';
import 'package:my_invoice/src/model/customer.dart';

class CustomerController extends GetxController {
  
  Customer? customer;
  TextEditingController customerNameInputController = TextEditingController();
  TextEditingController customerEmailInputController = TextEditingController();
  TextEditingController customerPhoneInputController = TextEditingController();
  TextEditingController customerAddressInputController = TextEditingController();

  bool validate() {
    if (customerNameInputController.text.isEmpty ||
        customerEmailInputController.text.isEmpty ||
        customerPhoneInputController.text.isEmpty ||
        customerAddressInputController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      customer = Customer(
          address: customerAddressInputController.text,
          email: customerEmailInputController.text,
          name: customerNameInputController.text,
          phone: customerPhoneInputController.text);
      return true;
    }
  }

  @override
  void onClose() {
    if (customer != null) {
      customerAddressInputController.clear();
      customerEmailInputController.clear();
      customerNameInputController.clear();
      customerPhoneInputController.clear();
      Get.find<InvoiceController>().setCustomer(customer!);
    }
    super.onClose();
  }
}
