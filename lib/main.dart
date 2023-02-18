import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/constant/app_string_constants.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/cache_helper.dart';
import 'core/services/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';
import 'authentication/presentation/screens/login_screen.dart';

void main()async {
  ///Hello Form Kerollos Sameh
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStringConstant.appName,
      home: LoginScreen(),
    );
  }
}
