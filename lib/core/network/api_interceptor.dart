import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';
import '../services/secure_storage_service.dart';
import 'api_exceptions.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SecureStorageService.to.getAuthToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Accept'] = 'application/json';
    if (options.data is! FormData) {
      options.headers['Content-Type'] = 'application/json';
    }

    if (kDebugMode) {
      debugPrint('[DIO Request] ${options.method} -> ${options.uri}');
      if (options.data != null && options.data is! FormData) {
        debugPrint('[DIO Body] ${options.data}');
      }
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('[DIO Response] [${response.statusCode}] <- ${response.requestOptions.uri}');
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('[DIO Error] [${err.response?.statusCode}] <- ${err.requestOptions.uri}: ${err.message}');
    }

    if (err.response?.statusCode == 401) {
      AuthService.to.logout();
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: const UnauthorizedException(),
          type: err.type,
          response: err.response,
        ),
      );
    }

    final mappedException = _mapDioErrorToApiException(err);
    return handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: mappedException,
        type: err.type,
        response: err.response,
      ),
    );
  }

  ApiException _mapDioErrorToApiException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        return const NetworkException();

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final responseData = err.response?.data;
        String errorMessage = 'Server error occurred.';

        if (responseData is Map<String, dynamic>) {
          errorMessage = responseData['message']?.toString() ??
              responseData['error']?.toString() ??
              errorMessage;
        }

        if (statusCode == 401) return UnauthorizedException(message: errorMessage);
        if (statusCode == 403) return ForbiddenException(message: errorMessage);
        if (statusCode == 404) return NotFoundException(message: errorMessage);

        return ServerException(message: errorMessage, statusCode: statusCode);

      case DioExceptionType.cancel:
        return const ApiException(message: 'Request was cancelled.');

      case DioExceptionType.badCertificate:
        return const ApiException(message: 'Security validation failed: Bad SSL certificate.');

      case DioExceptionType.unknown:
      default:
        return NetworkException(message: err.message ?? 'An unexpected network error occurred.');
    }
  }
}

