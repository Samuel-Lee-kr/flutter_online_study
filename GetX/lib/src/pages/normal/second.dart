import 'package:counter/src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("뒤로 이동"),
              onPressed: (){
                //기존 라우터 방식
                // Navigator.of(context).pop();
                Get.back();
              },
            ),
            RaisedButton(
              child: Text("홈 이동"),
              onPressed: (){
                Get.to(Home());
              },
            ),
          ],
        ),
      ),
    );
  }
}
