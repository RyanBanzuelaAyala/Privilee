// ignore_for_file: non_constant_identifier_names

import 'package:TApp/presentation/splash/splash_vm.dart';
import 'package:TApp/router/router.dart';
import 'package:flutter/material.dart';

splash_page_animation(BuildContext context, SplashVM model) {
  return TweenAnimationBuilder(
    tween: Tween<Offset>(
        begin: Offset(model.startPos, 0), end: Offset(model.endPos, 0)),
    duration: const Duration(seconds: 1),
    curve: model.curve,
    builder: (context, offset, child) {
      return FractionalTranslation(
        translation: offset,
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: child,
          ),
        ),
      );
    },
    child: splash_page_image(),
    onEnd: () {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          model.curve = model.curve == Curves.elasticOut
              ? Curves.elasticIn
              : Curves.elasticOut;
          if (model.startPos == -1) {
            model.end_animation();

            Future.delayed(
              const Duration(milliseconds: 500),
              () {
                Future.delayed(const Duration(seconds: 1), () async {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, introPages);
                });
              },
            );
          }
        },
      );
    },
  );
}

splash_page_image() {
  return Image.asset(
    'assets/privilee.png',
    width: 150,
  );
}
