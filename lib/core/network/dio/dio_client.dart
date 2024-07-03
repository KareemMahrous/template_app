import 'package:dio/dio.dart';

import 'base_dio.dart';
import 'dio_exception_handler.dart';

class DioClient extends BaseDio {
  final Dio _dio;
  final BaseOptions _options;
  final List<Interceptor> _interceptors;
  DioClient({
    required BaseOptions options,
    required Dio dio,
    List<Interceptor> interceptors = const [],
  })  : _interceptors = interceptors,
        _options = options,
        _dio = dio {
    _dio.options = _options;
    for (final interceptor in _interceptors) {
      _dio.interceptors.add(interceptor);
    }
  }

  @override
  Future<Response<dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response<dynamic> response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (exception) {
      throw DioExceptionHandler.handle(exception);
    }
  }

  @override
  Future<Response<dynamic>> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response<dynamic> response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (exception) {
      throw DioExceptionHandler.handle(exception);
    }
  }

  @override
  Future<Response<dynamic>> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response<dynamic> response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (exception) {
      throw DioExceptionHandler.handle(exception);
    }
  }

  @override
  Future<Response<dynamic>> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response<dynamic> response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (exception) {
      throw DioExceptionHandler.handle(exception);
    }
  }
}
