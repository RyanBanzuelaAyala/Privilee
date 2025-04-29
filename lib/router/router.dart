import 'package:TApp/presentation/app/venue/venue_page.dart';
import 'package:TApp/presentation/app/intro/intro_page.dart';
import 'package:TApp/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

const String splashPages = "SplashPage";
const String introPages = "IntroPage";
const String venuePages = "VenuePage";

class RouterApp {
  static RouteFactory onGenerateRouter = (RouteSettings settings) {
    switch (settings.name) {
      case splashPages:
        return _generateMaterialRoute(const SplashPage());
      case introPages:
        return _generateMaterialRoute(const IntroPage());
      case venuePages:
        return _generateMaterialRoute(const VenuePage());
      default:
        return _generateMaterialRoute(const IntroPage());
    }
  };
}

PageTransition _generateMaterialRoute(Widget screen) {
  return PageTransition(child: screen, type: PageTransitionType.fade);
}
