import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/components/custom_btn.dart';
import 'package:my_invoice/src/components/custom_input.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/constants/app_strings.dart';
import 'package:my_invoice/src/controllers/invoice_controller.dart';
import 'package:my_invoice/src/env/dimensions.dart';

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
                    CustomInput(
                      controller: _paymentInstInputController,
                      label: AppStrings.addPaymentInstructionsLabel,
                      height: Dimensions.calcH(100),
                      isRequired: true,
                    ),
                  ],
                ),
              ),
              CustomBtn(
                label: AppStrings.saveBtn,
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
                color: AppColors.primaryColor,
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