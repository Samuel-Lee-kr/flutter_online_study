import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_invoice/src/components/custom_app_bar.dart';
import 'package:my_invoice/src/components/custom_btn.dart';
import 'package:my_invoice/src/components/custom_input.dart';
import 'package:my_invoice/src/components/custom_text.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/constants/app_strings.dart';
import 'package:my_invoice/src/controllers/business_controller.dart';
import 'package:my_invoice/src/controllers/invoice_controller.dart';
import 'package:my_invoice/src/env/dimensions.dart';

class NewBusiness extends StatelessWidget {
  const NewBusiness({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.addBusinessTitle,
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
                        CustomInput(
                          controller: controller.businessNameInputController,
                          label: AppStrings.addBusinessName,
                          isRequired: true,
                        ),
                        CustomInput(
                          controller: controller.businessEmailInputController,
                          label: AppStrings.addBusinessEmail,
                          isRequired: true,
                          type: TextInputType.emailAddress,
                        ),
                        CustomInput(
                          controller: controller.businessPhoneInputController,
                          label: AppStrings.addBusinessPhone,
                          isRequired: true,
                          type: TextInputType.phone,
                        ),
                        CustomInput(
                          controller: controller.businessAddressInputController,
                          label: AppStrings.addBusinessAddress,
                          height: Dimensions.calcH(100),
                          isRequired: true,
                        ),
                      ],
                    ),
                    GetBuilder<InvoiceController>(
                      builder: (controller) => DottedBorder(
                        color: AppColors.primaryLight,
                        child: SizedBox(
                          height: 150,
                          width: 200,
                          child: (controller.logo != null)
                              ? InkWell(
                                  onTap: () async {
                                    XFile? file = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (file != null) {
                                      Uint8List imageBytes =
                                          await file.readAsBytes();
                                      controller.setBusinessLogo(imageBytes);
                                    }
                                  },
                                  child: Image.memory(controller.logo!))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        XFile? file = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        if (file != null) {
                                          Uint8List imageBytes =
                                              await file.readAsBytes();
                                          controller
                                              .setBusinessLogo(imageBytes);
                                        }
                                      },
                                      splashRadius: 20,
                                      icon: const Icon(
                                        Icons.add,
                                        color: AppColors.primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                    CustomText(
                                      text: "Add your logo",
                                      fontSize: Dimensions.calcH(15),
                                      weight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    )
                                  ],
                                ),
                        ),
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