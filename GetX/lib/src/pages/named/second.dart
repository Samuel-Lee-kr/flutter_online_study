import 'package:counter/src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Named Page"),),
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
                //라우트 히스토리 삭제 후 홈으로 이동
                Get.offAllNamed("/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
