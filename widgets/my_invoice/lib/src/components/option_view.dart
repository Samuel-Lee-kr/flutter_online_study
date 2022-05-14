import 'package:flutter/material.dart';
import 'package:my_invoice/src/components/custom_text.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/env/dimensions.dart';

class OptionView extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? optionalText;
  final Widget? leading;
  final bool showArrow;
  final bool isComplete;
  final Function() onTap;

  const OptionView(
      {Key? key,
      required this.title,
      this.subTitle,
      this.optionalText,
      this.leading,
      this.showArrow = true,
      this.isComplete = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (!showArrow || isComplete) ? null : onTap,
      splashColor: AppColors.primaryLight,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(8), horizontal: Dimensions.calcW(8)),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(5), horizontal: Dimensions.calcW(8)),
        height: Dimensions.calcH(100),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            (leading != null)
                ? Container(
                    margin: EdgeInsets.only(right: Dimensions.calcW(15)),
                    padding: EdgeInsets.all(Dimensions.calcH(10)),
                    width: 55,
                    child: leading,
                  )
                : const Text(""),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: title,
                                align: TextAlign.center,
                                fontSize: Dimensions.calcH(19),
                                weight: FontWeight.bold,
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.calcH(5),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: subTitle ?? "",
                            align: TextAlign.left,
                            fontSize: Dimensions.calcH(17),
                            weight: FontWeight.w600,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                   Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: optionalText ?? "",
                            align: TextAlign.left,
                            fontSize: Dimensions.calcH(17),
                            weight: FontWeight.w600,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            (showArrow)
                ? const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_right, size: 30,),
                    ),
                  )
                : const Text(""),
            (isComplete && !showArrow)
                ? const Expanded(
                    child: Icon(Icons.check_circle, size: 30,)
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
