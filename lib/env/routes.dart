import 'package:get/get.dart';
import 'package:invoiceapp/Screens/homebinding.dart';
import 'package:invoiceapp/Screens/homescreen.dart';

import 'package:invoiceapp/Screens/invoice_screens/new_invoicebinding.dart';
import 'package:invoiceapp/Screens/invoice_screens/new_invoicescreen.dart';
import 'package:invoiceapp/Screens/splashscreen.dart';
import 'package:invoiceapp/env/links.dart';

import '../Screens/invoice_screens/invoice_preview/invoice_preview_screen.dart';
import '../Screens/invoice_screens/new_business_details/new_business_details.dart';
import '../Screens/invoice_screens/new_items/add_item.dart';
import '../Screens/invoice_screens/new_items/items_binding.dart';
import '../Screens/invoice_screens/new_payer_details/new_payer_details.dart';
import '../Screens/invoice_screens/sign_invoice/sign_invoice.dart';

class AppRouting {
  static final ROUTES = [
    GetPage(
      name: AppLinks.SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: AppLinks.HOME,
        page: () => const HomeScreen(),
        transition: Transition.circularReveal,
        binding: HomeBinding()),
    GetPage(
      name: AppLinks.NEW_INVOICE,
      page: () => const NewInvoiceScreen(),
      transition: Transition.fadeIn,
      binding: NewInvoiceBinding(),
    ),
    GetPage(
      name: AppLinks.NEW_BUSINESS,
      page: () => NewBusinessScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppLinks.NEW_PAYER,
      page: () => const NewPayerScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppLinks.NEW_ITEM,
      page: () => const NewItemScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: ItemsBidning(),
    ),
    GetPage(
      name: AppLinks.SIGNATURE,
      page: () => const SignatureScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    // GetPage(
    //   name: AppLinks.BARCODE,
    //   page: () => const BarcodeScan(),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    GetPage(
      name: AppLinks.PREVIEW,
      page: () => InvoicePreviewScreen(),
    ),
  ];
}
