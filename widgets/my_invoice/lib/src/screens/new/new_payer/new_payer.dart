import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/components/custom_app_bar.dart';
import 'package:my_invoice/src/components/custom_btn.dart';
import 'package:my_invoice/src/components/custom_input.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/constants/app_strings.dart';
import 'package:my_invoice/src/controllers/customer_controller.dart';
import 'package:my_invoice/src/env/dimensions.dart';

class NewPayer extends StatelessWidget {
  const NewPayer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.addPayerTitle,
        showBackArrow: true,
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: GetBuilder<CustomerController>(
              init: CustomerController(),
              builder: (controller) => Container(
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
                            controller: controller.customerNameInputController,
                            label: AppStrings.addPayerName,
                            isRequired: true,
                          ),
                          CustomInput(
                            controller: controller.customerEmailInputController,
                            label: AppStrings.addPayerEmail,
                            isRequired: true,
                            type: TextInputType.emailAddress,
                          ),
                          CustomInput(
                            controller: controller.customerPhoneInputController,
                            label: AppStrings.addPayerPhone,
                            isRequired: true,
                            type: TextInputType.phone,
                          ),
                          CustomInput(
                            controller:
                                controller.customerAddressInputController,
                            label: AppStrings.addPayerAddress,
                            height: Dimensions.calcH(100),
                            isRequired: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.calcH(50),
                    ),
                    CustomBtn(
                      label: AppStrings.saveBtn,
                      action: () {
                        bool isValid = controller.validate();
                        if (isValid) {
                          Get.back();
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
          ),
        ),
      ),
    );
  }
}