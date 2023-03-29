import 'package:bloc/bloc.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:elwarsha/core/constant/app_variable_constants.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/presentation/screens/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../authentication/domain/entities/auth_entity.dart';
import '../../../domain/usecase/get_slides_usecase.dart';
import '../../screens/categories screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/orders screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  final GetSlidesUserCase getSlides;
  final GetProductUseCase getProductsUseCase;
  LayoutCubit(this.getSlides, this.getProductsUseCase) : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
     HomeScreen(),
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

  void getSliders({required String token}) async {
    emit(GetSlidesLoadingState());
    SlideParameter parameter = SlideParameter(
      token: token,
    );
    var result = await getSlides(parameter);
    result.fold(
          (l) => emit(GetSlidesErrorState(errorMessage: l.message)),
          (r) => emit(GetSlidesSuccessState(sliders: r)),
    );
  }

  void getProducts({required String token}) async {
    emit(GetProductsLoadingState());
    ProductParameter parameter = ProductParameter(
      token: token,
    );
    var result = await getProductsUseCase(parameter);
    result.fold(
          (l) => emit(GetProductsErrorState(errorMessage: l.message)),
          (r) => emit(GetProductsSuccessState(products: r)),
    );
  }
}
