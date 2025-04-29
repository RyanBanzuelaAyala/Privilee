import 'package:TApp/shared/extension/base_widget.dart';
import 'package:flutter/material.dart';

class SplashVM extends BaseVM {
  double startPos = -1.0;
  double endPos = 0.0;
  Curve curve = Curves.elasticOut;

  end_animation() {
    startPos = 0.0;
    endPos = 1.0;
    notifyListeners();
  }
}
