import 'package:flutter/material.dart';
import 'package:selecteat_app/view/screens/home_screen.dart';

class NavigationController extends ChangeNotifier {
  int screenIndex = 2;

  void changeScreen(int newScreenIndex) {
    screenIndex = newScreenIndex;
    notifyListeners();
  }
}
