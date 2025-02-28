import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../app/injector.dart';
import '../error/exceptions.dart';
import 'api_consumer.dart';
import 'app_interceptor.dart';
import 'status_code.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.interceptors.add(serviceLocator<AppInterceptor>());

    if (kDebugMode) dio.interceptors.add(serviceLocator<LogInterceptor>());
  }

  @override
  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        endPoint,
        queryParameters: query,
      );
      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<Response> post(String endPoint,
      {Map<String, dynamic>? query, Object? body}) async {
    try {
      final response = await dio.post(
        endPoint,
        queryParameters: query,
        data: body,
      );
      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<Response> put(
    String endPoint, {
    Map<String, dynamic>? query,
    Object? body,
  }) async {
    try {
      final response = await dio.put(
        endPoint,
        queryParameters: query,
        data: body,
      );

      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<Response> delete(String endPoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.delete(
        endPoint,
        queryParameters: query,
        data: body,
      );

      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<Response> patch(String endPoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.patch(
        endPoint,
        queryParameters: query,
        data: body,
      );

      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();

      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        throw const CancelRequestException();
      case DioExceptionType.unknown:
        throw const UnknownException();
      case DioExceptionType.badCertificate:
        throw const BadCertificateException();
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
    }
  }
}
