import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_invoice/src/components/custom_app_bar.dart';
import 'package:my_invoice/src/components/custom_btn.dart';
import 'package:my_invoice/src/components/custom_input.dart';
import 'package:my_invoice/src/components/custom_rich_text.dart';
import 'package:my_invoice/src/components/custom_table_row.dart';
import 'package:my_invoice/src/components/custom_text.dart';
import 'package:my_invoice/src/constants/app_colors.dart';
import 'package:my_invoice/src/constants/app_strings.dart';
import 'package:my_invoice/src/controllers/items_controller.dart';
import 'package:my_invoice/src/env/dimensions.dart';

class AddItem extends GetView<ItemsController> {
  const AddItem({ Key? key }) : super(key: key);

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
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: Dimensions.calcH(5),
                horizontal: Dimensions.calcW(15),
              ),
              child: Obx(() {
                return Column(
                  children: [
                    if (controller.itemsList.isNotEmpty)
                      Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: <Widget>[
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const CustomText(
                                      text: AppStrings.addItemsName),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const CustomText(
                                      text: AppStrings.addItemsPrice),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const CustomText(
                                      text: AppStrings.addItemsQty),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const CustomText(
                                      text: AppStrings.addItemsActions),
                                ),
                              ),
                            ],
                          ),
                          ...controller.itemsList
                              .map((itemx) => customTableRow(
                                    item: itemx,
                                  ))
                              .toList(),
                        ],
                      )
                    else
                      const Center(
                        child: Text("You did not add any item yet!"),
                      ),
                    if (controller.itemsList.isNotEmpty)
                      SizedBox(
                        height: Dimensions.calcH(25),
                      ),
                    if (controller.itemsList.isNotEmpty) const Divider(),
                    if (controller.itemsList.isNotEmpty)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomRichText(
                          text: "${AppStrings.total} : \$",
                          children: [
                            TextSpan(
                                text:
                                    "${controller.total.value.toStringAsFixed(2)}")
                          ],
                        ),
                      ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: AppStrings.addItemsDialogTitle,
            content: SizedBox(
              height: 200,
              child: SingleChildScrollView (
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Divider(),
                    CustomInput(
                      label: "Item name",
                      controller: controller.itemNameInputController,
                    ),
                    CustomInput(
                        label: AppStrings.addItemsPrice,
                        controller: controller.itemPriceInputController,
                        type: TextInputType.number),
                    CustomInput(
                      label: AppStrings.addItemsQty,
                      controller: controller.itemQtyInputController,
                      type: TextInputType.number,
                    ),
                    CustomBtn(
                      label: AppStrings.addBtn,
                      action: () {
                        bool isValid = controller.validate();
                        if (isValid) {
                          Get.close(1);
                        }
                      },
                      color: AppColors.primaryColor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.secondaryColor,
          size: 35,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}