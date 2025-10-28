// This class hold the app data and logic
import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count; //getter

  void increment() {
    _count++;
    notifyListeners(); //notifies widgets to rebuild
  }
}
