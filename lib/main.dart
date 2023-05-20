import 'package:bloc/bloc.dart';
import 'package:elwarsha/authentication/presentation/screens/start_splash_screen.dart';
import 'package:elwarsha/core/constant/app_router.dart';
import 'package:elwarsha/core/global/theme/dark_theme.dart';
import 'package:elwarsha/layout/presentation/screens/layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constant/app_string_constants.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/cache_helper.dart';
import 'core/services/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  ServiceLocator.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getDarkThemeData(),
        title: AppStringConstant.appTitle,
        home: SplashScreen(),
      ),
    );
  }
}
