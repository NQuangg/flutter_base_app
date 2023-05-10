import 'package:dio/dio.dart';

import '../../../res/constants.dart';
import '../utils/log_util.dart';
import '../utils/preference_util.dart';

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await PreferenceUtil.getString(Constants.token);
    LogUtil.debug('Authorization accessToken = $accessToken');

    options.headers.addAll(
      <String, String>{
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json; charset=UTF-8',
        'Accept-Language': 'vi',
      },
    );

    LogUtil.debug(
      'onRequest: ${options.uri}\n'
      'data=${options.data}\n'
      'method=${options.method}\n'
      'headers=${options.headers}\n'
      'queryParameters=${options.queryParameters}',
    );
    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    LogUtil.debug('onRequest: ${response.realUri}');
    LogUtil.debug('onResponse: $response');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    LogUtil.error(
      'onError: $err\n'
      'Response: ${err.response}',
    );
    return super.onError(err, handler);
  }
}
