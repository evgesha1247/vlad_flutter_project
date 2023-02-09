import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  var currentIndexPage = 0;

  setScreen(int index) {
    currentIndexPage = index;
    notifyListeners();
  }
}
