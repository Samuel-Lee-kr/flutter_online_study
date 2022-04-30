import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/binding/binding_page.dart';
import 'package:my_get_x/src/controller/count_controller_with_getx.dart';
import 'package:my_get_x/src/controller/dependency_controller.dart';
import 'package:my_get_x/src/home.dart';
import 'package:my_get_x/src/pages/binding.dart';
import 'package:my_get_x/src/pages/dependencies/get_put.dart';
import 'package:my_get_x/src/pages/next.dart';
import 'package:my_get_x/src/pages/named/first.dart';
import 'package:my_get_x/src/pages/named/second.dart';
import 'package:my_get_x/src/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: "/",
      // routes: {
      //   "/": (context) => Home(),
      //   "/first": (context) => FirstNamedPage(),
      //   "/second": (context) => SecondNamedPage(),
      // },

      getPages: [
        GetPage(name: '/', page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: '/first',
            page: () => FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/second',
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/next', page: () => NextPage(), transition: Transition.zoom),
        GetPage(
            name: '/user/:uid',
            page: () => UserPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/binding',
            page: () => BindingPage(),
            binding: BindingPageBinding()),
      ],
    );
  }
}
