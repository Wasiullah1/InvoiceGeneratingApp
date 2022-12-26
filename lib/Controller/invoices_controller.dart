import 'package:get/get.dart';
import 'package:invoiceapp/Models/invoice_model.dart';

class AllInvoiceController extends GetxController {
  final RxList _invoicesList = [].obs;

  get invoicesList => _invoicesList;
  // get invoicesList => _invoicesList;
  // get all invoices
  // creeate new invoice
  void createNewInvoice(Invoice invoice) => _invoicesList.add(invoice);
  // download inovice
  // delete invoice
}
