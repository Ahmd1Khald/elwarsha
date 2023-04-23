import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../authentication/presentation/screens/login_screen.dart';
import '../../authentication/presentation/screens/onboarding_Screen.dart';
import '../../authentication/presentation/screens/otp_code_screen.dart';
import '../../authentication/presentation/screens/start_splash_screen.dart';
import '../../layout/presentation/screens/layout_screen.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/OnBoardingScreen';
  static const kLayoutScreen = '/LayoutScreen';

  static final router = CacheHelper.getDate(key: 'token') == null
      ? GoRouter(
          routes: [
            GoRoute(
                path: '/',
                builder: (context, state) =>
                    SplashScreen() //const SplashScreen(),
                ),
            GoRoute(
              path: kOnBoardingScreen,
              builder: (context, state) => OnBoardingScreen(),
            ),
            GoRoute(
              path: kLayoutScreen,
              builder: (context, state) => LayoutScreen(),
            ),
          ],
        )
      : GoRouter(
          routes: [
            GoRoute(
                path: '/',
                builder: (context, state) =>
                    LayoutScreen() //const SplashScreen(),
                ),
          ],
        );
}
