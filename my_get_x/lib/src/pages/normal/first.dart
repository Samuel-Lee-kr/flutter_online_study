import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/pages/normal/second.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('다음 페이지 이동'),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_) => FirstPage()));
                Get.to(SecondPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
