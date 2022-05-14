import 'package:flutter/material.dart';
import 'package:my_invoice/src/components/custom_rich_text.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/env/dimensions.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String label;
  final bool isRequired;
  final double? height;

  const CustomInput(
      {Key? key,
      required this.controller,
      this.type,
      required this.label,
      this.isRequired = false,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.calcH(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            text: label,
            children: (isRequired)
                ? [
                    const TextSpan(
                      text: " *",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ]
                : [],
          ),
          SizedBox(
            height: Dimensions.calcH(8),
          ),
          Container(
            color: AppColors.secondaryColor,
            height: height,
            margin: EdgeInsets.only(
              right: Dimensions.calcW(50),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: type,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: AppColors.secondaryColor,
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}