import 'package:counter/src/controller/count_controller_with_getx.dart';
import 'package:counter/src/controller/count_controller_with_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'state/with_getx.dart';
import 'state/with_provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetx());
    return Scaffold(
      appBar: AppBar(title: Text("단순상태관리"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Expanded(
             child: WithGetX(),
           ),
           Expanded(
             child: ChangeNotifierProvider<CountControllerWithProvider>(
               create: (_) => CountControllerWithProvider(),
               child: WithProvider(),
             ),
           )
          ],
        ),
      ),
    );
  }
}
