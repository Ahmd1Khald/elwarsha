import 'package:dartz/dartz.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_slides_usecase.dart';

import '../../../core/exceptions/failure.dart';
import '../entities/products_entities/products_entity.dart';

abstract class BaseLayoutRepository{
  Future<Either<Failure,SliderEntity>> getSlides(SlideParameter parameter);
  Future<Either<Failure,ProductEntity>> getProducts(ProductParameter parameter);
}