import 'package:dio/dio.dart';

import '../constant/api_consants.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    // dio.options.headers = {
    //   'lang': ApiConstants.englishLanguage,
    //   'Content-Type': ApiConstants.contentType,
    //   'Authorization': token,
    // };
    return await dio.post(endPoint, data: data, queryParameters: query);
  }
}
