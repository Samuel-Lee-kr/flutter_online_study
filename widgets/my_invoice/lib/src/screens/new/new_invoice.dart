import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/components/custom_app_bar.dart';
import 'package:my_invoice/src/components/custom_btn.dart';
import 'package:my_invoice/src/components/option_view.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/constants/app_strings.dart';
import 'package:my_invoice/src/controllers/all_invoices_controller.dart';
import 'package:my_invoice/src/controllers/invoice_controller.dart';
import 'package:my_invoice/src/model/invoice.dart';
import 'package:my_invoice/src/screens/new/payment_instructions/payment_instructions.dart';
import 'package:my_invoice/src/utils/functions.dart';

class NewInvoice extends StatelessWidget {
  const NewInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: customAppBar(
        title: AppStrings.newInvoicePageTitle,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (scroll) {
              scroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<InvoiceController>(
                init: InvoiceController(),
                builder: (controller) {
                  if (controller.id == '0') {
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    controller.id = id;
                  }
                  return Column(
                    children: [
                      OptionView(
                        onTap: () {},
                        title: AppStrings.newInvoiceTitle + controller.id,
                        subTitle: AppStrings.newInvoiceSubtitle +
                            Functions.formatDate(
                              DateTime.now(),
                            ),
                        showArrow: false,
                      ),
                      OptionView(
                        onTap: () {
                          Get.toNamed("/add_business");
                        },
                        title: AppStrings.newInvoiceBusiness,
                        subTitle: AppStrings.newInvoiceBusinessSubtitle,
                        leading: const Icon(Icons.business),
                        isComplete:
                            (controller.business != null) ? true : false,
                        showArrow: (controller.business != null) ? false : true,
                      ),
                      OptionView(
                        onTap: () {
                          Get.toNamed("/add_payer");
                        },
                        title: AppStrings.newInvoicePayer,
                        subTitle: AppStrings.newInvoicePayerSubtitle,
                        leading: const Icon(Icons.person_add),
                        isComplete:
                            (controller.customer != null) ? true : false,
                        showArrow: (controller.customer != null) ? false : true,
                      ),
                      OptionView(
                        onTap: () {
                          Get.toNamed("/add_items");
                        },
                        title: AppStrings.newInvoiceItems,
                        subTitle: (controller.itemsList.isEmpty)
                            ? AppStrings.newInvoiceItems
                            : "${controller.itemsList.length} have been added",
                        leading: const Icon(Icons.add_box_outlined),
                      ),
                      OptionView(
                        onTap: () {
                          if (controller.paymentInstructions == null) {
                            Get.defaultDialog(
                              title: AppStrings.addPaymentInstructionsTitle,
                              content: PaymentInstructions(),
                            );
                          }
                        },
                        title: AppStrings.newInvoicePayment,
                        subTitle: AppStrings.newInvoicePaymentSubtitle,
                        leading: const Icon(Icons.add_card),
                        isComplete: (controller.paymentInstructions != null)
                            ? true
                            : false,
                        showArrow: (controller.paymentInstructions != null)
                            ? false
                            : true,
                      ),
                      OptionView(
                        onTap: () {
                          Get.toNamed("/sign_invoice");
                        },
                        title: AppStrings.newInvoiceSignature,
                        subTitle: AppStrings.newInvoiceSignatureSubtitle,
                        leading: const Icon(Icons.price_check),
                        isComplete:
                            (controller.signature != null) ? true : false,
                        showArrow:
                            (controller.signature != null) ? false : true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // CustomBtn(
                          //   label: AppStrings.previewBtn,
                          //   action: () {
                          //     if (controller.business != null &&
                          //         controller.customer != null &&
                          //         controller.signature != null &&
                          //         controller.paymentInstructions != null &&
                          //         controller.itemsList.isNotEmpty) {
                          //       Invoice invoice =
                          //           controller.generatePreviceInvoice();
                          //       Get.toNamed("/preview",
                          //           arguments: {"invoice": invoice});
                          //     } else {
                          //       Get.snackbar("Error",
                          //           "Please enter all the required fields!",
                          //           snackPosition: SnackPosition.BOTTOM);
                          //     }
                          //   },
                          // ),
                          // SizedBox(
                          //   width: Dimensions.calcW(20),
                          // ),
                          CustomBtn(
                            label: AppStrings.saveBtn,
                            color: AppColors.primaryColor,
                            textColor: Colors.white,
                            action: () {
                              if (controller.business != null &&
                                  controller.customer != null &&
                                  controller.signature != null &&
                                  controller.paymentInstructions != null) {
                                Invoice invoice =
                                    controller.generatePreviewInvice();
                                Get.find<AllInvoiceController>()
                                    .createNewInvoice(invoice);
                                Get.back();
                              } else {
                                Get.snackbar("Error",
                                    "Please enter all the required fields!",
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            )),
      ),
    );
  }
}
