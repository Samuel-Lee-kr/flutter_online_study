import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'getX',
            style: TextStyle(fontSize: 50),
          ),
          GetBuilder<CountControllerWithGetx>(
            id: 'first',
            builder: (controller) {
            return Text(
              '${controller.count}',
              style: TextStyle(fontSize: 30),
            );
          }),
          GetBuilder<CountControllerWithGetx>(
            id: 'second',
            builder: (controller) {
            return Text(
              '${controller.count}',
              style: TextStyle(fontSize: 30),
            );
          }),
          RaisedButton(
            child: Text(
              '+',
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              Get.find<CountControllerWithGetx>().increase('first');
            },
          ),
          RaisedButton(
            child: Text(
              '+',
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              Get.find<CountControllerWithGetx>().increase('second');
            },
          ),
          RaisedButton(
            child: Text(
              '5로 변경',
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              Get.find<CountControllerWithGetx>().putNumber('first', 5);
            },
          ),
          RaisedButton(
            child: Text(
              '5로 변경',
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              Get.find<CountControllerWithGetx>().putNumber('second', 5);
            },
          ),
        ],
      ),
    );
  }
}
