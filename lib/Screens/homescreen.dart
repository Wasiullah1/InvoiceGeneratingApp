import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Screens/drawer.dart';
import 'package:invoiceapp/Screens/invoice_english_view.dart';
import 'package:invoiceapp/Screens/shared_widgets/custom_text.dart';
import 'package:invoiceapp/env/dimensions.dart';
import 'package:invoiceapp/Controller/invoices_controller.dart';

import '../Components/colors.dart';
import '../Components/strings.dart';
import 'shared_widgets/appbar_eng_view.dart';

class HomeScreen extends GetView<AllInvoiceController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AllInvoiceController());
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar_eng(
          title: "",
          actions: [
            IconButton(
              onPressed: () {
                Get.to(MyDrawer());
              },
              icon: SvgPicture.asset(
                "assets/icons/profile.svg",
                color: AppColors.kPrimaryDark,
              ),
            ),
            SizedBox(
              width: 70,
            ),
            Center(child: Image.asset("assets/images/elegance1.png")),
            SizedBox(
              width: 65,
            ),
            InkWell(
              onTap: () {
                Get.toNamed("/new");
              },
              splashColor: AppColors.kSecondaryColor,
              customBorder: const CircleBorder(),
              child: SvgPicture.asset(
                "assets/icons/new_invoice.svg",
                height: Dimensions.calcH(25),
                color: AppColors.kPrimaryDark,
              ),
            ),
            SizedBox(
              width: Dimensions.calcW(15),
            ),

            // InkWell(
            //   onTap: () {},
            //   splashColor: AppColors.kSecondaryColor,
            //   customBorder: const CircleBorder(),
            //   child: SvgPicture.asset(
            //     "assets/icons/settings.svg",
            //     height: Dimensions.calcH(30),
            //     color: AppColors.kPrimaryDark,
            //   ),
            // ),
            // SizedBox(
            //   width: Dimensions.calcW(8),
            // ),
          ],
        ),
        // drawer: const MyDrawer(),
        body: Obx(() {
          if (controller.invoicesList.isEmpty) {
            return Center(
              child: CustomText(
                text: AppStrings.HOME_NO_INVOICES,
                color: Colors.black,
                fontSize: Dimensions.calcH(20),
                weight: FontWeight.w600,
              ),
            );
          } else {
            return Column(
              children: [
                ...controller.invoicesList
                    .map((invoice) => InvoiceView_eng(
                          invoice: invoice,
                        ))
                    .toList()
              ],
            );
          }
        }));
  }
}
