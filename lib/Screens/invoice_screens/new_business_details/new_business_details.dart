import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoiceapp/Components/colors.dart';
import 'package:invoiceapp/Components/strings.dart';
import 'package:invoiceapp/Controller/business_controller.dart';
import 'package:invoiceapp/Screens/invoice_screens/new_invoice.dart';
import 'package:invoiceapp/Screens/shared_widgets/appbar_eng_view.dart';
import 'package:invoiceapp/Screens/shared_widgets/custom_btn.dart';
import 'package:invoiceapp/Screens/shared_widgets/custom_input_eng.dart';
import 'package:invoiceapp/Screens/shared_widgets/custom_text.dart';
import 'package:invoiceapp/env/dimensions.dart';

class NewBusinessScreen extends StatelessWidget {
  var scanResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_eng(
        title: AppStrings.ADD_BUSINESS_TITLE,
        showBackArrow: true,
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: GetBuilder<BusinessController>(
              init: BusinessController(),
              builder: (controller) => Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.calcH(5),
                  horizontal: Dimensions.calcW(15),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: Dimensions.calcH(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetBuilder<InvoiceController>(
                              builder: (controller) => DottedBorder(
                                color: AppColors.kSecondaryColor,
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: (controller.logo != null)
                                      ? InkWell(
                                          onTap: () async {
                                            XFile? file = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (file != null) {
                                              Uint8List imageBytes =
                                                  await file.readAsBytes();
                                              controller
                                                  .setBusinessLogo(imageBytes);
                                            }
                                          },
                                          child: Image.memory(controller.logo!))
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                XFile? file =
                                                    await ImagePicker()
                                                        .pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                if (file != null) {
                                                  Uint8List imageBytes =
                                                      await file.readAsBytes();
                                                  controller.setBusinessLogo(
                                                      imageBytes);
                                                }
                                              },
                                              splashRadius: 20,
                                              icon: Icon(
                                                Icons.add,
                                                color:
                                                    AppColors.kSecondaryColor,
                                                size: 30,
                                              ),
                                            ),
                                            CustomText(
                                              text: "Add display Image",
                                              fontSize: Dimensions.calcH(15),
                                              weight: FontWeight.bold,
                                              color: AppColors.kSecondaryColor,
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            GetBuilder<InvoiceController>(
                              builder: (controller) => DottedBorder(
                                color: AppColors.kSecondaryColor,
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.amber,
                                              onPrimary: Colors.black),
                                          onPressed: scanBarcode,
                                          icon: Icon(Icons.camera_alt_outlined),
                                          label: Text('Start Scan')),
                                      SizedBox(height: 20),
                                      Text(
                                        scanResult == null
                                            ? 'Scan barcode'
                                            : 'Scan result : $scanResult',
                                        style: TextStyle(
                                          fontSize: Dimensions.calcH(15),
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.kSecondaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.calcH(25),
                        ),
                        CustomInput_eng(
                          controller: controller.businessNameInputController,
                          label: AppStrings.ADD_BUSINESS_NAME,
                          isRequired: true,
                        ),
                        CustomInput_eng(
                          controller: controller.businessEmailInputController,
                          label: AppStrings.ADD_BUSINESS_EMAIL,
                          isRequired: true,
                          type: TextInputType.emailAddress,
                        ),
                        CustomInput_eng(
                          controller: controller.businessPhoneInputController,
                          label: AppStrings.ADD_BUSINESS_PHONE,
                          isRequired: true,
                          type: TextInputType.phone,
                        ),
                        CustomInput_eng(
                          controller: controller.businessAddressInputController,
                          label: AppStrings.ADD_BUSINESS_ADDRESS,
                          height: Dimensions.calcH(100),
                          isRequired: true,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: Dimensions.calcH(50),
                    // ),
                    CustomBtn(
                      label: AppStrings.SAVE_BTN,
                      action: () {
                        bool isValid = controller.validate();
                        if (isValid) {
                          Get.back();
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
          ),
        ),
      ),
    );
  }

  Future scanBarcode() async {
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = 'Failed to get platform version';
    }
    // if (!mounted) return;

    // setState(() {
    scanResult?.value = scanResult;
    // });
  }
}
