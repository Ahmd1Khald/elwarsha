import 'package:elwarsha/layout/domain/entities/products_entities/products_entity.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class LayoutChangeBottomNavBar extends LayoutStates {}

class AppChangeCarousalActiveIndexState extends LayoutStates {}

class GetSlidesLoadingState extends LayoutStates {}

class GetSlidesErrorState extends LayoutStates {
  final String errorMessage;

  GetSlidesErrorState({required this.errorMessage});
}

class GetSlidesSuccessState extends LayoutStates {
  final SliderEntity sliders;

  GetSlidesSuccessState({required this.sliders});
}

class GetProductsLoadingState extends LayoutStates {}

class GetProductsErrorState extends LayoutStates {
  final String errorMessage;

  GetProductsErrorState({required this.errorMessage});
}

class GetProductsSuccessState extends LayoutStates {
  final ProductEntity products;

  GetProductsSuccessState({required this.products});
}