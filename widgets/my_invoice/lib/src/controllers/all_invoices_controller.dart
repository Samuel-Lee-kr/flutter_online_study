import 'package:get/get.dart';
import 'package:my_invoice/src/model/invoice.dart';

class AllInvoiceController extends GetxController {

  final RxList _invoicesList = [].obs;

  get invoicesList => _invoicesList;

  void createNewInvoice(Invoice invoice) => _invoicesList.add(invoice);
}