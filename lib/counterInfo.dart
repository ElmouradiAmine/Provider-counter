import 'package:flutter/foundation.dart';

class CounterInfo with ChangeNotifier {
  int _counter = 0;

  get counter => _counter;
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }
}
