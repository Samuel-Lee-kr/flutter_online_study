import 'package:counter/src/pages/simple_state_manage_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/normal/first.dart';
import 'pages/reactive_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("라우트 관리 홈"),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("GetX 라우트"),
                onPressed: (){
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_) => FirstPage()));
                  Get.to(FirstPage());
                }),
            RaisedButton(
                child: Text("Named 라우트"),
                onPressed: (){
                  Get.toNamed("/first");
                }),
            RaisedButton(
                child: Text("Argument 전달"),
                onPressed: (){
                  //Argument 전달 스트링, 인트 , Map , 객체 등 전달 가능
                  Get.toNamed("/next", arguments: User(name: "준호", age: 34));
                }),
            RaisedButton(
                child: Text("동적 Url"),
                onPressed: (){
                  //Parameter 전달
                  Get.toNamed("/user/12345?name=준호&age=34");
                }),
            RaisedButton(
                child: Text("단순상태관리"),
                onPressed: (){
                  //Parameter 전달
                  Get.to(SimpleStateManagePage());
                }),
            RaisedButton(
                child: Text("반응형상태관리"),
                onPressed: (){
                  //Parameter 전달
                  Get.to(ReactiveStateManagePage());
                })
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}
