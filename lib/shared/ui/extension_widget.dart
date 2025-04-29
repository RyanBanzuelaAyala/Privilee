import 'package:flutter/services.dart';

class AppUiHelper {
  static void autoRotateOff() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
