import 'package:bloc/bloc.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:elwarsha/core/constant/app_variable_constants.dart';
import 'package:elwarsha/layout/presentation/screens/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/categories screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/orders screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {

  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const OrdersScreen(),
    const MoreScreen(),
  ];

  void changeBottomIndex({required int index}) {
    currentIndex = index;
    emit(LayoutChangeBottomNavBar());
  }

  int activeIndex = 0;

  void changeActiveIndex({required int index}) {
    activeIndex = index;
    emit(AppChangeCarousalActiveIndexState());
  }

}
