import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_get_x/src/controller/dependency_controller.dart';

class GetPut extends StatelessWidget {
  const GetPut({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: RaisedButton(
        onPressed: (){
          Get.find<DependencyController>().increase();
        }),
    );
  }
}