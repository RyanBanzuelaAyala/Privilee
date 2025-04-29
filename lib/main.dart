import 'package:TApp/application/global/global.dart';
import 'package:TApp/presentation/app/venue/venue_page.dart';
import 'package:TApp/presentation/splash/splash_page.dart';
import 'package:TApp/presentation/splash/splash_vm.dart';
import 'package:TApp/router/router.dart';
import 'package:TApp/shared/ui/extension_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dart:ui' as ui;

import 'package:provider/provider.dart';

void main() => Global.init().then((e) async {
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
      };

      WidgetsFlutterBinding.ensureInitialized();

      runApp(const TApp());
      AppUiHelper.autoRotateOff();
    });

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TApp extends StatelessWidget {
  const TApp({super.key});

  @override
  Widget build(BuildContext context) {
    RenderErrorBox.backgroundColor = Colors.transparent;
    RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashVM()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale("en")],
        theme: ThemeData(
          fontFamily: 'Muli',
          colorScheme: ColorScheme.light(
            primary: createMaterialColor(const Color(0xff111827)),
          ),
          useMaterial3: true,
          primarySwatch: createMaterialColor(const Color(0xff111827)),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: const WidgetStatePropertyAll(Colors.grey),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        onGenerateRoute: RouterApp.onGenerateRouter,
        routes: {
          '/venuePage': (context) => const VenuePage(),
        },
        home: const Scaffold(
          body: SafeArea(child: SplashPage()),
        ),
      ),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
