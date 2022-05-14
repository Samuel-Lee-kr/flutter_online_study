import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/controllers/invoice_controller.dart';
import 'package:my_invoice/src/model/item.dart';

class ItemsController extends GetxController {
  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  final RxDouble _total = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();

  get itemsList => _itemsList;
  get total => _total;

  bool validate() {
    if (itemNameInputController.text.isEmpty ||
        itemPriceInputController.text.isEmpty ||
        itemQtyInputController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (!itemPriceInputController.text.isNum ||
        !itemQtyInputController.text.isNum) {
      Get.snackbar(
        "Error",
        "Item Price/Qty can only be a number",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      addItem(
        itemName: itemNameInputController.text,
        itemPrice: double.parse(itemPriceInputController.text),
        itemQty: int.parse(itemQtyInputController.text),
      );
      itemNameInputController.clear();
      itemPriceInputController.clear();
      itemQtyInputController.clear();
      update();
      return true;
    }
  }
  
  void addItem(
      {required String itemName,
      required double itemPrice,
      required int itemQty}) {
    _itemsList.add(
      Item(
        name: itemName,
        price: itemPrice,
        qty: itemQty,
      ),
    );
    update();
    calcTotal();
  }

  void removeItem({required Item item}) {
    _itemsList.remove(item);
    update();
    calcTotal();
  }

  void clearItems() {
    _itemsList.clear();
    update();
    calcTotal();
  }

  void calcTotal() => _total.value = _itemsList.fold(
      0, (previousValue, next) => previousValue + (next.price * next.qty));
}