import 'package:dio/dio.dart';

import '../model/response/base_response.dart';
import '../utils/log_util.dart';
import 'http_interceptor.dart';
import 'http_method.dart';

class ApiProvider {
  ApiProvider({required this.baseUrl}) {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(minutes: 1)
      ..options.receiveTimeout = const Duration(minutes: 1)
      ..interceptors.add(HttpLogInterceptor());
  }

  late final Dio _dio;
  final String baseUrl;

  Future<BaseResponse?> callApi({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? param,
    dynamic data,
  }) async {
    Response? apiResponse;

    try {
      switch (method) {
        case HttpMethod.GET:
          apiResponse = await _dio.get(
            path,
            queryParameters: param,
          );
          break;

        case HttpMethod.POST:
          apiResponse = await _dio.post(
            path,
            queryParameters: param,
            data: data,
          );
          break;

        case HttpMethod.PUT:
          apiResponse = await _dio.put(
            path,
            queryParameters: param,
            data: data,
          );
          break;

        case HttpMethod.DELETE:
          apiResponse = await _dio.delete(
            path,
            queryParameters: param,
            data: data,
          );
          break;

        default:
          break;
      }

      if (apiResponse != null &&
          apiResponse.statusCode == 200 &&
          apiResponse.data != null) {
        final baseResponse = BaseResponse.fromJson(apiResponse.data);
        return baseResponse;
      }
    } catch (e) {
      LogUtil.error('RestProvider callApi ERROR: $e');
    }

    return null;
  }
}
