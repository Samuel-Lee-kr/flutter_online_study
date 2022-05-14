import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/components/custom_btn.dart';
import 'package:my_invoice/src/components/custom_text.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/constants/app_link.dart';
import 'package:my_invoice/src/constants/app_strings.dart';
import 'package:my_invoice/src/env/dimensions.dart';

class Intro extends StatelessWidget {
  const Intro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   'test',
            //   height: Dimensions.calcH(120),
            //   color: Colors.white,
            // ),
            SizedBox(
              height: Dimensions.calcH(15),
            ),
            CustomText(
              text: AppStrings.appName,
              color: Colors.white,
              weight: FontWeight.bold,
              fontSize: Dimensions.calcH(25),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomText(
              text: AppStrings.appDescription,
              color: Colors.white,
              weight: FontWeight.w600,
              fontSize: Dimensions.calcH(18),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomBtn(
              label: AppStrings.startBtn,
              action: () {
                Get.offAndToNamed(AppLink.home);
              }
            ),
          ],
        ),
      ),
    );
  }
}