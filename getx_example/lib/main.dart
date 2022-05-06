import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/helper/init_dependency.dart';
import 'my_home_page.dart';
import 'helper/init_controller.dart' as di;

Future<void> main() async {
  /// main 메소드에서 서버나 SharedPreferences 등
  /// 비동기로 데이터를 다룬 다음 runApp 을 실행해야하는 경우 아래 한줄을 반드시 추가
  // WidgetsFlutterBinding.ensureInitialized();
  // await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDep(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
