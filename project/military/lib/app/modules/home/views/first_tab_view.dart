import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FirstTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstTabView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FirstTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
