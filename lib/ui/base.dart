import 'package:flutter/material.dart';

/// Base view model with common functionality.
class BaseViewModel with ChangeNotifier {
  bool _isBusy = false;
  bool get isBusy => _isBusy;
  void setBusy(bool isBusy) {
    _isBusy = isBusy;
    notifyListeners();
  }
}
