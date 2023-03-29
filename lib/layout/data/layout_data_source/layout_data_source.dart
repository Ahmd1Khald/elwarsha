import 'package:dio/dio.dart';
import 'package:elwarsha/core/constant/api_consants.dart';
import 'package:elwarsha/core/services/dio_helper.dart';
import 'package:elwarsha/layout/data/model/products_model/products_model.dart';
import 'package:elwarsha/layout/data/model/slider_model/slider_model.dart';
import 'package:elwarsha/layout/domain/entities/products_entities/products_entity.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';
import 'package:elwarsha/layout/domain/usecase/get_slides_usecase.dart';

import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../domain/usecase/get_products_usecase.dart';

abstract class BaseLayoutDataSource {
  Future<SliderEntity> getSlides(SlideParameter parameter);
  Future<ProductEntity> gerProducts(ProductParameter parameter);
}

class LayoutDataSource extends BaseLayoutDataSource {

  @override
  Future<SliderEntity> getSlides(SlideParameter parameter) async {
    try {
      var response = await DioHelper.getData(
        endPoint: ApiConstants.slideEndPoint,
        token: parameter.token,
      );
      return SliderModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data),
        );
      } else {
        throw ServerException(
          errorMessageModel:
          const ErrorMessageModel(message: "Something went wrong"),
        );
      }
    }
  }

  @override
  Future<ProductEntity> gerProducts(ProductParameter parameter) async {
    try{
      var response = await DioHelper.getData(
        endPoint: ApiConstants.productsEndPoint,
        token: parameter.token,
      );
      print(response.data);
      return ProductModel.fromJson(response.data);
    }on DioError catch (error) {
      if (error.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data),
        );
      } else {
        throw ServerException(
          errorMessageModel:
          const ErrorMessageModel(message: "Something went wrong"),
        );
      }
    }
  }
}