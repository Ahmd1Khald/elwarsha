import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/layout/data/layout_data_source/layout_data_source.dart';
import 'package:elwarsha/layout/domain/base_repository/layout_base_repository.dart';
import 'package:elwarsha/layout/domain/entities/products_entities/products_entity.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_profile_data_usecase.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../domain/usecase/get_slides_usecase.dart';

class LayoutRepository extends BaseLayoutRepository{
  final BaseLayoutDataSource baseLayoutDataSource;

  LayoutRepository(this.baseLayoutDataSource);

  @override
  Future<Either<Failure, SliderEntity>> getSlides(SlideParameter parameter) async{
    try{
      var result = await baseLayoutDataSource.getSlides(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProducts(ProductParameter parameter) async{
    try{
      var result = await baseLayoutDataSource.gerProducts(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfileData(ProfileParameter parameter) async {
    try{
      var result = await baseLayoutDataSource.gerProfile(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}