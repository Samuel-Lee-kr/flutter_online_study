import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/pages/dependencies/dependency_manage_page.dart';
import 'package:my_get_x/src/pages/normal/first.dart';
import 'package:my_get_x/src/pages/reactive_state_manage_page.dart';
import 'package:my_get_x/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('일반적인 라우트'),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_) => FirstPage()));
                Get.to(FirstPage());
              },
            ),
            RaisedButton(
              child: Text('named 라우트'),
              onPressed: () {
                // Navigator.of(context).pushNamed('/first');
                Get.toNamed('/first');
              },
            ),
            RaisedButton(
              child: Text('argument 전달'),
              onPressed: () {
                Get.toNamed('/next', arguments: 'samuel');
              },
            ),

            RaisedButton(
              child: Text('동적 url'),
              onPressed: () {
                Get.toNamed('/user/28357?name=samuellee&age=29');
              },
            ),

            RaisedButton(
              child: Text('단순 상태 관리'),
              onPressed: () {
                Get.to(SimpleStateManagePage());
              },
            ),

            RaisedButton(
              child: Text('반응형 상태 관리'),
              onPressed: () {
                Get.to(ReactiveStateManagePage());
              },
            ),
             RaisedButton(
              child: Text('의존성 관리'),
              onPressed: () {
                Get.to(DependencyManagePage());
              },
            ),

            RaisedButton(
              child: Text('바인딩 관리'),
              onPressed: () {
                Get.toNamed('/binding');
              },
            ),
          ],
        ),
      ),
    );
  }
}
