import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Components/colors.dart';
import 'package:invoiceapp/Components/strings.dart';
import 'package:invoiceapp/Screens/invoice_screens/new_invoice.dart';
import 'package:invoiceapp/Screens/shared_widgets/custom_btn.dart';
import 'package:invoiceapp/Screens/shared_widgets/custom_input_eng.dart';
import 'package:invoiceapp/env/dimensions.dart';

class PaymentInstructions extends GetView<InvoiceController> {
  PaymentInstructions({Key? key}) : super(key: key);
  final TextEditingController _paymentInstInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (scroll) {
        scroll.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(5),
            horizontal: Dimensions.calcW(15),
          ),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    CustomInput_eng(
                      controller: _paymentInstInputController,
                      label: AppStrings.ADD_PAYMENT_INSTRUCTIONS_LABEL,
                      height: Dimensions.calcH(100),
                      isRequired: true,
                    ),
                  ],
                ),
              ),
              CustomBtn(
                label: AppStrings.SAVE_BTN,
                action: () {
                  if (_paymentInstInputController.text.isEmpty ||
                      _paymentInstInputController.text.length < 5) {
                    Get.snackbar(
                        "Error", "Please check your entries and try again!",
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    controller.setPaymentInstructions(
                        _paymentInstInputController.text);
                    Get.close(1);
                  }
                },
                color: AppColors.kSecondaryColor,
                textColor: Colors.white,
                width: Dimensions.calcW(150),
              )
            ],
          ),
        ),
      ),
    );
  }
}
