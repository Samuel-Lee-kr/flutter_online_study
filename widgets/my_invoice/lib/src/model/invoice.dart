import 'package:flutter/services.dart';

import 'package:my_invoice/src/model/business.dart';
import 'package:my_invoice/src/model/customer.dart';
import 'package:my_invoice/src/model/item.dart';

class Invoice {
  String id;
  String date;
  Business from;
  Customer to;
  List<Item> items;
  String paymentInstructions;
  double total;
  ByteData signature;
  
  Invoice({
    required this.id,
    required this.date,
    required this.from,
    required this.to,
    required this.items,
    required this.paymentInstructions,
    required this.total,
    required this.signature,
  });
  
  
}
