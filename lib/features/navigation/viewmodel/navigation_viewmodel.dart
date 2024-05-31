import 'package:flutter/cupertino.dart';

class NavigationViewmodel extends ChangeNotifier {
  int _pageIndex = 2;

  int get pageIndex => _pageIndex;

  set pageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}
