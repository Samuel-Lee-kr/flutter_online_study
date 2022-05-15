import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/components/Invoice_view.dart';
import 'package:my_invoice/src/components/custom_app_bar.dart';
import 'package:my_invoice/src/components/custom_text.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/constants/app_strings.dart';
import 'package:my_invoice/src/controllers/all_invoices_controller.dart';
import 'package:my_invoice/src/env/dimensions.dart';

class Home extends GetView<AllInvoiceController> {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: customAppBar(
          title: AppStrings.homeTitle,
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed('/new');
              },
              splashColor: AppColors.secondaryColor,
              customBorder: const CircleBorder(),
              child: Icon(
                Icons.newspaper,
                size: Dimensions.calcH(25),
                color: AppColors.primaryDark,
              ),
            )
          ],
      ),
      body: Obx(() {
        if(controller.invoicesList.isEmpty) {
          return Center(
            child: CustomText(
              text: AppStrings.homeNoInvoices,
              color: Colors.black,
              fontSize: Dimensions.calcH(20),
              weight: FontWeight.w600,
            ),
          );
        }else {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...controller.invoicesList.map((invoice) => 
                    InvoiceView(invoice: invoice)
                ).toList(),
              ],
            ),
          );
        }
      }),
    );
  }
}