import 'dart:async';

import 'package:elwarsha/authentication/presentation/screens/onboarding_Screen.dart';
import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/core/constant/app_string_constants.dart';
import 'package:flutter/material.dart';

import '../../../core/global/widgets/navigate_to.dart';
import '../components/splash_screen_component/logo_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
          () => navigateTo(destination: OnBoardingScreen(),context: context),
    );
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoLayout(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStringConstant.appTitle, style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    'Be safe with us',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

