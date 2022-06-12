import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  int screenIndex = 2;

  void changeScreen(int newScreenIndex) {
    screenIndex = newScreenIndex;
    notifyListeners();
  }
}
