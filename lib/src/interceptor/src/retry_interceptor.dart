import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// {@template retry_interceptor}
/// Interceptor for retrying failed requests with exponential backoff
///
/// Features:
/// - Configurable retry count
/// - Exponential backoff with jitter
/// - Retry only on specific HTTP methods and status codes
/// - Network error handling
/// {@endtemplate}
class RetryInterceptor extends Interceptor {
  /// {@macro retry_interceptor}
  RetryInterceptor({
    required this.maxRetries,
    required this.retryDelay,
    required this.retryableHttpMethods,
    required this.retryableStatusCodes,
  });

  /// Maximum number of retry attempts
  final int maxRetries;

  /// Initial delay between retries
  final Duration retryDelay;

  /// HTTP methods that should be retried
  final Set<String> retryableHttpMethods;

  /// Status codes that should trigger a retry
  final Set<int> retryableStatusCodes;

  /// Random number generator for jitter
  final _random = Random();

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final shouldRetry = _shouldRetry(err);
    final retryCount = err.requestOptions.extra['retry_count'] as int? ?? 0;

    if (!shouldRetry || retryCount >= maxRetries) {
      return handler.next(err);
    }

    final nextRetryCount = retryCount + 1;
    final delay = _calculateDelay(nextRetryCount);

    debugPrint(
      '🔄 Retrying request (attempt $nextRetryCount/$maxRetries) '
      'after ${delay.inMilliseconds}ms: ${err.requestOptions.uri}',
    );

    // Wait before retrying
    await Future<void>.delayed(delay);

    try {
      // Update retry count
      err.requestOptions.extra['retry_count'] = nextRetryCount;

      // Create a new Dio instance to retry
      final dio = Dio();
      final response = await dio.fetch<dynamic>(err.requestOptions);

      return handler.resolve(response);
    } on Exception catch (e) {
      // If retry fails, pass the original error to the next interceptor
      if (e is DioException) {
        return handler.next(e);
      }
      return handler.next(err);
    }
  }

  bool _shouldRetry(DioException err) {
    // Don't retry if explicitly marked as non-retryable
    if (err.requestOptions.extra['no_retry'] == true) {
      return false;
    }

    // Check if HTTP method is retryable
    final method = err.requestOptions.method.toUpperCase();
    if (!retryableHttpMethods.contains(method)) {
      return false;
    }

    // Retry on network errors
    if (_isNetworkError(err)) {
      return true;
    }

    // Retry on timeout
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return true;
    }

    // Retry on specific status codes
    final statusCode = err.response?.statusCode;
    if (statusCode != null && retryableStatusCodes.contains(statusCode)) {
      return true;
    }

    return false;
  }

  bool _isNetworkError(DioException err) {
    return err.type == DioExceptionType.connectionError ||
        err.error is SocketException ||
        err.error is HttpException;
  }

  Duration _calculateDelay(int retryCount) {
    // Exponential backoff: delay * 2^(retryCount - 1)
    final exponentialDelay = retryDelay.inMilliseconds * pow(2, retryCount - 1);

    // Add jitter (±25% randomness) to prevent thundering herd
    final jitter = exponentialDelay * 0.25 * (_random.nextDouble() * 2 - 1);
    final totalDelay = exponentialDelay + jitter;

    // Cap at 30 seconds
    return Duration(
      milliseconds: min(totalDelay.toInt(), 30000),
    );
  }
}

/// Extension to mark requests as non-retryable
extension RequestOptionsX on RequestOptions {
  /// Marks this request as non-retryable
  void noRetry() {
    extra['no_retry'] = true;
  }

  /// Checks if this request is marked as non-retryable
  bool get isNonRetryable => extra['no_retry'] == true;
}
