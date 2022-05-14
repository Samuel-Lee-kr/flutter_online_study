import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_invoice/src/constants/app_link.dart';
import 'package:my_invoice/src/constants/app_routing.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 모든 스케폴드의 배경색을 하얀색으로
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: AppLink.intro,
      getPages: AppRouting.routes,
    ));
}