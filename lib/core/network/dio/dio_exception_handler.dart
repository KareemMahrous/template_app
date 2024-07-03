import 'package:dio/dio.dart';

import '../errors/failure.dart';


class DioExceptionHandler {
  static Failure handle(DioException exception) {
    final String message = exception.response?.statusMessage ??
        "Something went wrong, please try again later";
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerFailure(message);
      case DioExceptionType.sendTimeout:
        throw ServerFailure(message);
      case DioExceptionType.receiveTimeout:
        throw ServerFailure(message);
      case DioExceptionType.badCertificate:
        throw ServerFailure(message);
      case DioExceptionType.cancel:
        throw ServerFailure(message);
      case DioExceptionType.badResponse:
        throw ServerFailure(message);
      case DioExceptionType.connectionError:
        throw ServerFailure(message);
      default:
        throw ServerFailure(message);
    }
  }
}
