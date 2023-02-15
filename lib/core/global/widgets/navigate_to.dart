import 'package:flutter/material.dart';

Future<dynamic> navigateTo(BuildContext context, Widget screen) {
  return Navigator.push(
    context,
    PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, animationTime, child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeIn);
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.center,
            child: child,
          );
        },
        pageBuilder: (context, animation, animationTime) {
          return screen;
        }),
  );
}