import 'package:get/get.dart';
import 'package:invoiceapp/Screens/invoice_screens/new_invoice.dart';

class NewInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InvoiceController(),
    );
  }
}
