import 'package:dio/dio.dart';
import '../../../core/constant/api_consants.dart';
import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/dio_helper.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecase/login_usecase.dart';
import '../models/auth_model.dart';


abstract class BaseAuthDataSource {
  Future<AuthEntity> login(LoginParameter parameter);
}

class AuthDataSource extends BaseAuthDataSource {
  @override
  Future<AuthEntity> login(LoginParameter parameter) async {
    try {
      var response = await DioHelper.postData(
        endPoint: ApiConstants.loginEndPoint,
        data: {'phone': parameter.phone,},
      );
      return AuthModel.formJson(response.data);
    } on DioError catch (e) {
      if (e.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
        );
      } else {
        throw ServerException(
          errorMessageModel: const ErrorMessageModel(message: "Something went wrong "),
        );
      }
    }
    //throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
}
