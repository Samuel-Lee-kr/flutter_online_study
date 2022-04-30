import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/controller/count_controller_with_getx.dart';

class BindingPage extends GetView<CountControllerWithGetx> {
  const BindingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<CountControllerWithGetx>(
            id: 'first',
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
              // CountControllerWithGetx.to.increase('first');
              controller.increase('first');
            },
          ),
        ],
      ),
    );
  }
}