import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/pages/normal/second.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Named page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('다음 페이지 이동'),
              onPressed: () {
                Get.toNamed('/second');
                // Get.offNamed('/second'); // 자기자신을 지우면서 이동
              },
            ),
          ],
        ),
      ),
    );
  }
}
