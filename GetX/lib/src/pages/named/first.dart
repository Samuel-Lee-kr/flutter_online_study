import 'package:counter/src/pages/normal/second.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Named Page"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("다음페이지 이동"),
              onPressed: (){
                //세컨드 페이지로 이동하고 뒤로가기 버튼 클릭시 홈으로 이동
                Get.offNamed("/second");
              },
            ),
          ],
        ),
      ),
    );
  }
}
