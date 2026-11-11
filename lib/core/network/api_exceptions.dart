class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  const ApiException({
    required this.message,
    this.statusCode,
    this.details,
  });

  @override
  String toString() => 'ApiException(statusCode: $statusCode, message: $message)';
}

class NetworkException extends ApiException {
  const NetworkException({super.message = 'Please check your internet connection and try again.'})
      : super(statusCode: 0);
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({super.message = 'Session expired. Please log in again.'})
      : super(statusCode: 401);
}

class ForbiddenException extends ApiException {
  const ForbiddenException({super.message = 'You do not have permission to access this resource.'})
      : super(statusCode: 403);
}

class NotFoundException extends ApiException {
  const NotFoundException({super.message = 'Requested resource not found.'})
      : super(statusCode: 404);
}

class ServerException extends ApiException {
  const ServerException({super.message = 'Internal server error. Please try again later.', super.statusCode = 500});
}

class TimeoutException extends ApiException {
  const TimeoutException({super.message = 'Request timed out. Please try again.'})
      : super(statusCode: 408);
}
