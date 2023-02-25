import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

Future<dynamic> navigateTo({
  required BuildContext context,
  required Widget destination,
}) {
  return Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //timeDilation = 2.0;
        return SharedAxisTransition(
          transitionType: SharedAxisTransitionType.horizontal,
          secondaryAnimation: secondaryAnimation,
          animation: animation,
          //fillColor: AppColorConstant.secondaryAppPrimaryDarkColor,
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 2),
      pageBuilder: (context, animation, secondaryAnimation) {
        return destination;
      },
    ),
  );
}
