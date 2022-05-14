import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/components/custom_app_bar.dart';
import 'package:my_invoice/src/components/custom_btn.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/constants/app_strings.dart';
import 'package:my_invoice/src/controllers/invoice_controller.dart';
import 'package:my_invoice/src/env/dimensions.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

class SignatureInvoice extends GetView<InvoiceController> {
  const SignatureInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
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
            child: Column(
              children: [
                Container(
                  height: Get.size.height * 0.45,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SfSignaturePad(
                    key: _signaturePadKey,
                    minimumStrokeWidth: 2,
                    maximumStrokeWidth: 4,
                    strokeColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: Dimensions.calcH(20),
                ),
                CustomBtn(
                  label: AppStrings.saveBtn,
                  action: () async {
                    ui.Image image =
                        await _signaturePadKey.currentState!.toImage();
                    final pngBytes =
                        await image.toByteData(format: ui.ImageByteFormat.png);
                    controller.setSignature(pngBytes!);
                    Get.back();
                  },
                  color: AppColors.primaryColor,
                  textColor: Colors.white,
                ),
                CustomBtn(
                  label: AppStrings.clearBtn,
                  action: () async {
                    _signaturePadKey.currentState!.clear();
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ],
            )
            ),
      ),
    );
  }
}
