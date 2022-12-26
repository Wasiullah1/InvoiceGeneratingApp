import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Screens/invoice_screens/new_invoice.dart';
import 'package:invoiceapp/Models/business_model.dart';

class BusinessController extends GetxController {
  Business? business;
  RxString scanResult = "".obs;
  TextEditingController businessNameInputController = TextEditingController();
  TextEditingController businessEmailInputController = TextEditingController();
  TextEditingController businessPhoneInputController = TextEditingController();
  TextEditingController businessAddressInputController =
      TextEditingController();

  // validate input
  bool validate() {
    if (businessNameInputController.text.isEmpty ||
        businessEmailInputController.text.isEmpty ||
        businessPhoneInputController.text.isEmpty ||
        businessAddressInputController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      business = Business(
        name: businessNameInputController.text,
        address: businessAddressInputController.text,
        phone: businessPhoneInputController.text,
        email: businessEmailInputController.text,
        logo: Get.find<InvoiceController>().logo,
      );
      return true;
    }
  }

  void onClose() {
    if (business != null) {
      businessNameInputController.clear();
      businessEmailInputController.clear();
      businessPhoneInputController.clear();
      businessAddressInputController.clear();
      Get.find<InvoiceController>().setBusiness(business!);
    }
    super.onClose();
  }
  // logo controller
  // upload logo
}
