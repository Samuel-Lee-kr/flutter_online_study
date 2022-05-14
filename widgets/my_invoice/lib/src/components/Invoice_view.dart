import 'package:flutter/material.dart';
import 'package:my_invoice/src/components/custom_text.dart';
import 'package:my_invoice/src/env/dimensions.dart';
import 'package:my_invoice/src/model/invoice.dart';
import 'package:my_invoice/src/utils/functions.dart';
import 'package:my_invoice/src/utils/pdf_invoice_api.dart';

class InvoiceView extends StatelessWidget {
  Invoice invoice;

  InvoiceView({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => Functions.saveInvoice(
        name: 'invoice-${invoice.id}.pdf',
        fileBytes: await PdfInvoiceApi.generate(invoice),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(20), horizontal: Dimensions.calcW(8)),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(5), horizontal: Dimensions.calcW(8)),
        height: Dimensions.calcH(100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    makeRow(
                        text: 'Invoice ID #${invoice.id}',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    makeRow(
                        text: '${invoice.to.name}',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.withOpacity(0.4)),
                    makeRow(
                        text: '${invoice.date}',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.withOpacity(0.4)),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Row makeRow(
      {required String text,
      required double fontSize,
      required FontWeight fontWeight,
      required Color color}) {
    return Row(
      children: [
        Expanded(
            child: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
              text: text,
              align: TextAlign.left,
              fontSize: Dimensions.calcH(fontSize),
              weight: fontWeight,
              color: color),
        ))
      ],
    );
  }
}
