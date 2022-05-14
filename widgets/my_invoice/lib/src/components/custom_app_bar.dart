import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/components/custom_text.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/env/dimensions.dart';

AppBar customAppBar({
  bool showBackArrow = false,
  List<Widget>? actions,
  required String title,
}) {
  return AppBar(
    // 뒤로가기 버튼 유무 : false == 제거
    automaticallyImplyLeading: showBackArrow,
    leading: (showBackArrow) ? IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: Dimensions.calcH(24),
      ),
      color: AppColors.primaryColor,
      splashRadius: 1,
    ) : null,
    elevation: 0,
    backgroundColor: Colors.white,
    title: CustomText(
      text: title,
      color: AppColors.primaryColor,
      fontSize: Dimensions.calcH(22),
      weight: FontWeight.w700,
    ),
    actions: (actions == null) ? null : actions,
  );
}
