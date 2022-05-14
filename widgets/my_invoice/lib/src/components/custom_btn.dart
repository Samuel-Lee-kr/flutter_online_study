import 'package:flutter/material.dart';
import 'package:my_invoice/src/components/custom_text.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/env/dimensions.dart';

class CustomBtn extends StatelessWidget {
  final String label;
  final Function() action;
  Color? color;
  Color? textColor;
  double? width;

  CustomBtn({
    Key? key,
    required this.label,
    required this.action,
    this.color,
    this.textColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: action,
      splashColor: AppColors.primaryColor,
      color: color ?? Colors.white,
      elevation: 0,
      minWidth: width ?? Dimensions.calcH(120),
      child: CustomText(
        text: label.toUpperCase(),
        color: textColor ?? AppColors.primaryDark,
        weight: FontWeight.bold,
        fontSize: Dimensions.calcH(17),
      ),
    );
  }
}
