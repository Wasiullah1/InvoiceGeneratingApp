// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:invoiceapp/Models/invoice_model.dart';

import 'package:invoiceapp/Screens/shared_widgets/custom_text.dart';
import 'package:invoiceapp/Utils/function.dart';
import 'package:invoiceapp/env/dimensions.dart';

import 'invoice_screens/invoice_preview/pdf_ai.dart';

class InvoiceView_eng extends StatelessWidget {
  Invoice invoice;
  InvoiceView_eng({
    required this.invoice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => Functions.saveInvoice(
        name: "invoice-${invoice.id}.pdf",
        fileBytes: await PdfInvoiceApi.generate(invoice),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(15), horizontal: Dimensions.calcW(8)),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(4), horizontal: Dimensions.calcW(8)),
        height: Dimensions.calcH(135),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 6,
                ),
                Expanded(child: Image.memory(invoice.logo)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "Vin#${invoice.id}",
                                align: TextAlign.left,
                                fontSize: Dimensions.calcH(21),
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "Dealer name ${invoice.to.name}",
                                align: TextAlign.left,
                                fontSize: Dimensions.calcH(16),
                                weight: FontWeight.w600,
                                color: Colors.grey.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "${invoice.items}",
                                align: TextAlign.left,
                                fontSize: Dimensions.calcH(18),
                                weight: FontWeight.w600,
                                color: Colors.grey.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.download,
                        size: Dimensions.calcH(30),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.calendar_month),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: invoice.date,
                      align: TextAlign.left,
                      fontSize: Dimensions.calcH(15),
                      weight: FontWeight.w600,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Invoice#${invoice.id}",
                      align: TextAlign.left,
                      fontSize: Dimensions.calcH(14),
                      weight: FontWeight.w600,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
