import 'package:bonedetect/core/dio_helper/model/error_model.dart';
import 'package:dio/dio.dart';

class DioExceptionHandler {
  static String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "Request was cancelled";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout";
      case DioExceptionType.sendTimeout:
        return "Send timeout";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout";
      case DioExceptionType.connectionError:
        return "Connection error";
      case DioExceptionType.badResponse:
        {
          final response = error.response;

          if (response != null && response.data != null) {
            try {
              if (response.data is Map<String, dynamic>) {
                final errorModel =
                    ErrorModel.fromJson(response.data as Map<String, dynamic>);
                if (errorModel.hasMessages) {
                  return errorModel.toString();
                }
              }
              if (response.data is String) {
                return response.data as String;
              }
            } catch (_) {
              if (response.data is String) {
                return response.data as String;
              }
            }

            switch (response.statusCode) {
              case 400:
                return "Bad request";
              case 401:
                return "Unauthorized";
              case 403:
                return "Forbidden";
              case 404:
                return "Not found";
              case 405:
                return "Method not allowed";
              case 408:
                return "Request timeout";
              case 500:
                return "Internal server error";
              case 502:
                return "Bad gateway";
              case 503:
                return "Service unavailable";
              case 504:
                return "Gateway timeout";
              default:
                return "Unknown error";
            }
          }
          return "Bad response error: ${error.message}";
        }
      case DioExceptionType.unknown:
        return "Unexpected error: ${error.message}";
      default:
        return "Something went wrong";
    }
  }
}
