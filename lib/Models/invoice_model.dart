import 'package:flutter/services.dart';
import 'package:invoiceapp/Models/business_model.dart';
import 'package:invoiceapp/Models/customer_model.dart';
import 'package:invoiceapp/Models/item_model.dart';

class Invoice {
  String id;
  String date;
  Business from;
  Customer to;
  List<Item> items;
  String paymentInstructions;
  double total;
  Uint8List logo;
  ByteData signature;
  Invoice(
      {required this.id,
      required this.date,
      required this.from,
      required this.to,
      required this.items,
      required this.paymentInstructions,
      required this.total,
      required this.logo,
      required this.signature});
}
