import 'package:flutter/material.dart';

class BaseVM extends ChangeNotifier {
  bool isInitLoaded = false;

  set setInitLoad(bool stats) {
    isInitLoaded = stats;
    notifyListeners();
  }

  bool isPageLoading = true;

  set setInitPage(bool stats) {
    isPageLoading = stats;
    notifyListeners();
  }

  bool isloading = false;

  set setLoading(bool value) {
    isloading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
