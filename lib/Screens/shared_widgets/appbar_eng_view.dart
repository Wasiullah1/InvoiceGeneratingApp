// ignore_for_file: non_constant_identifier_names

import 'package:invoiceapp/Components/colors.dart';
import 'package:invoiceapp/env/dimensions.dart';
import 'package:invoiceapp/screens/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar AppBar_eng({
  bool showBackArrow = false,
  List<Widget>? actions,
  required String title,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: (showBackArrow)
        ? IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: Dimensions.calcH(24),
            ),
            color: AppColors.kPrimaryDark,
            splashRadius: 1,
          )
        : null,
    elevation: 0,
    backgroundColor: AppColors.kSecondaryColor,
    title: CustomText(
      text: title,
      color: AppColors.kPrimaryDark,
      fontSize: Dimensions.calcH(22),
      weight: FontWeight.w700,
    ),
    actions: (actions == null) ? null : actions,
  );
}
