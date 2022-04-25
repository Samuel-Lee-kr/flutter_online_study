import 'package:counter/src/pages/named/first.dart';
import 'package:counter/src/pages/named/second.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/home.dart';
import 'src/pages/next.dart';
import 'src/pages/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      // routes: {
      //   "/" : (context) => Home(),
      //   "/first" : (context) => FirstNamedPage(),
      //   "/second" : (context) => SecondNamedPage()
      // },
      getPages: [
        GetPage(name: "/",
            page: () => Home(),
            transition: Transition.zoom),
        GetPage(name: "/first",
            page: () => FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(name: "/second",
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(name: "/next",
            page: () => NextPage(),
            transition: Transition.zoom),
        GetPage(name: "/user/:uid",
            page: () => UserPage(),
            transition: Transition.zoom),
      ],
    );
  }
}

