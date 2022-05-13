import 'package:flutter/widgets.dart';

class CountControllerWithProvider extends ChangeNotifier {
  int count = 0;

  void increase() {
    count++;
    notifyListeners();
  }
}