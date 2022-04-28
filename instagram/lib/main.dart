import 'package:counter/src/app.dart';
import 'package:counter/src/binding/init_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // initService();
  runApp(MyApp());
}

// void initService() {
//   Get.put(GetxControllerTest(), permanent: true);
// }

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        )
      ),
      initialBinding: InitBinding(),
      home: const App(),
    );
  }
}

