import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/home.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${Get.parameters['uid']}'),
            Text('${Get.parameters['name']}'),
            Text('${Get.parameters['age']}'),
            RaisedButton(
              child: Text('뒤로 이동'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
