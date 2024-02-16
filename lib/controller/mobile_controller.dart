import 'package:flutter/material.dart';

class ControllerMobile extends ChangeNotifier {
  bool _isBusy = false;
  bool get isBusy => _isBusy;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
