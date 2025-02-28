import 'package:climax/core/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'end_point.dart';
import 'status_code.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    var queryParameters = options.queryParameters;
    queryParameters['appid'] = kDotEnv.env['API_KEY'];
    queryParameters['lang'] = 'en';
    queryParameters['units'] = 'metric';

    options
      ..baseUrl = EndPoint.baseUrl
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internetServerError;
      }
      ..sendTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..headers = {}
      ..queryParameters = queryParameters;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
