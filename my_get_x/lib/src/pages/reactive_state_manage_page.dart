import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/controller/count_controller_with_reactive.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());
    return Scaffold(
      appBar: AppBar(
        title: Text('반응형 상태 관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'getX',
              style: TextStyle(fontSize: 50),
            ),
            Obx(() => Text(
                  '${Get.find<CountControllerWithReactive>().count.value}',
                  style: TextStyle(fontSize: 30),
                )),
            RaisedButton(
              child: Text(
                '+',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Get.find<CountControllerWithReactive>().increase();
              },
            ),
            RaisedButton(
              child: Text(
                '5로 변경',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Get.find<CountControllerWithReactive>().putNumber(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}
