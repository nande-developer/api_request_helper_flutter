import 'dart:io';

import 'package:dio/dio.dart';

/// Base class for all API exceptions
sealed class ApiException implements Exception {
  const ApiException(this.message, [this.statusCode, this.data]);

  /// Message of the exception
  final String message;

  /// Status code of the API request
  final int? statusCode;

  /// Data of the API request
  final dynamic data;

  @override
  String toString() => 'ApiException: $message (statusCode: $statusCode)';
}

/// {@template network_exception}
/// Network connectivity issues
/// {@endtemplate}
final class NetworkException extends ApiException {
  /// {@macro network_exception}
  const NetworkException([
    String message = 'No internet connection',
    dynamic data,
  ]) : super(message, null, data);
}

/// {@template timeout_exception}
/// Request timeout
/// {@endtemplate}
final class TimeoutException extends ApiException {
  /// {@macro timeout_exception}
  const TimeoutException([
    String message = 'Request timeout',
    dynamic data,
  ]) : super(message, 408, data);
}

/// {@template server_exception}
/// Server errors (5xx)
/// {@endtemplate}
final class ServerException extends ApiException {
  /// {@macro server_exception}
  const ServerException([
    super.message = 'Server error occurred',
    int super.statusCode = 500,
    super.data,
  ]);
}

/// {@template bad_request_exception}
/// Bad request (400)
/// {@endtemplate}
final class BadRequestException extends ApiException {
  /// {@macro bad_request_exception}
  const BadRequestException([
    String message = 'Bad request',
    dynamic data,
  ]) : super(message, 400, data);
}

/// {@template unauthorized_exception}
/// Unauthorized (401)
/// {@endtemplate}
final class UnauthorizedException extends ApiException {
  /// {@macro unauthorized_exception}
  const UnauthorizedException([
    String message = 'Unauthorized access',
    dynamic data,
  ]) : super(message, 401, data);
}

/// {@template forbidden_exception}
/// Forbidden (403)
/// {@endtemplate}
final class ForbiddenException extends ApiException {
  /// {@macro forbidden_exception}
  const ForbiddenException([
    String message = 'Access forbidden',
    dynamic data,
  ]) : super(message, 403, data);
}

/// {@template not_found_exception}
/// Not found (404)
/// {@endtemplate}
final class NotFoundException extends ApiException {
  /// {@macro not_found_exception}
  const NotFoundException([
    String message = 'Resource not found',
    dynamic data,
  ]) : super(message, 404, data);
}

/// {@template validation_exception}
/// Validation error (422)
/// {@endtemplate}
final class ValidationException extends ApiException {
  /// {@macro not_found_exception}
  const ValidationException([
    String message = 'Validation failed',
    dynamic data,
  ]) : super(message, 422, data);
}

/// {@template canceled_exception}
/// Request cancelled
/// {@endtemplate}
final class CancelledException extends ApiException {
  /// {@macro canceled_exception}
  const CancelledException([
    String message = 'Request cancelled',
    dynamic data,
  ]) : super(message, null, data);
}

/// {@template unknown_exception}
/// Unknown error
/// {@endtemplate}
final class UnknownException extends ApiException {
  /// {@macro unknown_exception}
  const UnknownException([
    super.message = 'An unknown error occurred',
    super.statusCode,
    super.data,
  ]);
}

/// Extension to convert DioException to ApiException
extension DioExceptionX on DioException {
  /// Function to convert DioException to ApiException
  ApiException toApiException() {
    final data = response?.data;
    final statusCode = response?.statusCode;
    final errorMessage = _extractErrorMessage(data);

    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(errorMessage ?? message ?? '', data);

      case DioExceptionType.badResponse:
        return _mapStatusCodeToException(statusCode, errorMessage, data);

      case DioExceptionType.cancel:
        return CancelledException(errorMessage ?? 'Request cancelled', data);

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        final isContainsNetwork =
            message?.toLowerCase().contains('network') ?? false;

        final isContainsConnection =
            message?.toLowerCase().contains('connection') ?? false;

        if (error is SocketException ||
            isContainsNetwork ||
            isContainsConnection) {
          return NetworkException(errorMessage ?? message ?? '', data);
        }
        return UnknownException(
          errorMessage ?? message ?? '',
          statusCode,
          data,
        );

      case DioExceptionType.badCertificate:
        return const ForbiddenException('SSL certificate verification failed');
    }
  }

  ApiException _mapStatusCodeToException(
    int? statusCode,
    String? message,
    dynamic data,
  ) {
    switch (statusCode) {
      case 400:
        return BadRequestException(message ?? '', data);
      case 401:
        return UnauthorizedException(message ?? '', data);
      case 403:
        return ForbiddenException(message ?? '', data);
      case 404:
        return NotFoundException(message ?? '', data);
      case 422:
        return ValidationException(message ?? '', data);
      case != null && >= 500 && < 600:
        return ServerException(message ?? '', statusCode, data);
      default:
        return UnknownException(message ?? '', statusCode, data);
    }
  }

  String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;

    if (data is Map<String, dynamic>) {
      // Try common error message keys
      return data['message'] as String? ??
          data['error'] as String? ??
          data['msg'] as String? ??
          data['detail'] as String?;
    }

    if (data is String) return data;

    return null;
  }
}
