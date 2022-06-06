import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SecondTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondTabView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SecondTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
