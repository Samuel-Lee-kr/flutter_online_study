import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/home.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Named page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('뒤로 이동'),
              onPressed: () {
                Get.back();
              },
            ),
             RaisedButton(
              child: Text('홈 이동'),
              onPressed: () {
                Get.offAllNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
