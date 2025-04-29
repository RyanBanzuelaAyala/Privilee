import 'package:flutter/material.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
