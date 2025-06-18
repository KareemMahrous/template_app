import 'package:dio/dio.dart';

import '../../core.dart';

class DioExceptionHandler {
  static Failure handle(DioException exception) {
    final response = exception.response;

    // Default fallback message
    String message = "Something went wrong, please try again later";

    // Try to extract a message from response.data
    if (response != null) {
      final data = response.data;

      if (data is Map<String, dynamic> && data.containsKey('message')) {
        message = data['message'] ?? message;
      } else if (data is String) {
        message = data;
      } else if (response.statusMessage != null) {
        message = response.statusMessage!;
      }

      // Handle HTTP status codes
      switch (response.statusCode) {
        case 400:
          return BadRequestFailure(message);
        case 401:
        case 403:
          return UnAuthorizedFailure(message);
        case 404:
          return NotFoundFailure(message);
        case 422:
          return InvalidInputFailure(message);
        case 500:
        case 502:
        case 503:
        case 504:
          return ServerFailure("Server error: $message");
        default:
          return ServerFailure("Unexpected error: $message");
      }
    }

    // Handle other Dio exceptions
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        return NetworkFailure("Connection error: $message");

      case DioExceptionType.badResponse:
        return ServerFailure("Server error: $message");

      default:
        return ServerFailure(message);
    }
  }
}
