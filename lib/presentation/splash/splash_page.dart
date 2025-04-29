import 'package:TApp/presentation/splash/splash_page_widget.dart';
import 'package:TApp/presentation/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashVM>(
        create: (context) => SplashVM(),
        child: Consumer<SplashVM>(
          builder: (BuildContext context, model, Widget? child) {
            return splash_page_animation(context, model);
          },
        ));
  }
}
