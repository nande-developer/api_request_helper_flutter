import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// {@template logging_interceptor}
/// Interceptor for logging HTTP requests and responses
///
/// Features:
/// - Pretty-printed JSON responses
/// - Request/response timing
/// - Redacts sensitive data (tokens, passwords)
/// - Configurable log levels
/// - Error logging with stack traces
/// {@endtemplate}
class LoggingInterceptor extends Interceptor {
  /// {@macro logging_interceptor}
  LoggingInterceptor({
    this.logLevel = LogLevel.body,
    this.redactedHeaders = const {'authorization', 'cookie', 'set-cookie'},
    this.redactedFields = const {'password', 'token', 'secret', 'api_key'},
  });

  /// Log level for requests/responses
  final LogLevel logLevel;

  /// Headers to redact in logs
  final Set<String> redactedHeaders;

  /// JSON fields to redact in logs
  final Set<String> redactedFields;

  // static const _divider =
  //     '─────────────────────────────────────────────────────────';
  static const _requestPrefix = '┌───── Request';
  static const _responsePrefix = '┌───── Response';
  static const _errorPrefix = '┌───── Error';
  static const _endPrefix = '└─────';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (logLevel == LogLevel.none) {
      return handler.next(options);
    }

    final startTime = DateTime.now();
    options.extra['start_time'] = startTime;

    _logRequest(options);
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (logLevel == LogLevel.none) {
      return handler.next(response);
    }

    _logResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (logLevel == LogLevel.none) {
      return handler.next(err);
    }

    _logError(err);
    handler.next(err);
  }

  void _logRequest(RequestOptions options) {
    debugPrint(_requestPrefix);
    debugPrint('│ ${options.method} ${options.uri}');

    if (logLevel.index >= LogLevel.headers.index) {
      _logHeaders(options.headers);
    }

    if (logLevel.index >= LogLevel.body.index) {
      _logRequestBody(options.data);
    }

    debugPrint(_endPrefix);
  }

  void _logResponse(Response<dynamic> response) {
    final startTime = response.requestOptions.extra['start_time'] as DateTime?;
    final duration = startTime != null
        ? DateTime.now().difference(startTime).inMilliseconds
        : null;

    debugPrint(_responsePrefix);
    debugPrint('│ ${response.statusCode} ${response.requestOptions.uri}');

    if (duration != null) {
      debugPrint('│ Duration: ${duration}ms');
    }

    if (logLevel.index >= LogLevel.headers.index) {
      _logHeaders(response.headers.map);
    }

    if (logLevel.index >= LogLevel.body.index) {
      _logResponseBody(response.data);
    }

    debugPrint(_endPrefix);
  }

  void _logError(DioException err) {
    debugPrint(_errorPrefix);
    debugPrint('│ ${err.type.name}');
    debugPrint('│ ${err.requestOptions.method} ${err.requestOptions.uri}');
    debugPrint('│ Message: ${err.message}');

    if (err.response != null) {
      debugPrint('│ Status: ${err.response?.statusCode}');

      if (logLevel.index >= LogLevel.body.index) {
        _logResponseBody(err.response?.data);
      }
    }

    if (logLevel.index >= LogLevel.body.index) {
      debugPrint('│ Stack trace:');
      final stackLines = err.stackTrace.toString().split('\n');
      for (final line in stackLines.take(5)) {
        debugPrint('│   $line');
      }
    }

    debugPrint(_endPrefix);
  }

  void _logHeaders(Map<String, dynamic> headers) {
    if (headers.isEmpty) return;

    debugPrint('│ Headers:');
    headers.forEach((key, value) {
      final displayValue = _shouldRedactHeader(key) ? '***' : value;
      debugPrint('│   $key: $displayValue');
    });
  }

  void _logRequestBody(dynamic data) {
    if (data == null) return;

    debugPrint('│ Body:');

    if (data is Map || data is List) {
      _logJson(data);
    } else if (data is FormData) {
      _logFormData(data);
    } else {
      debugPrint('│   $data');
    }
  }

  void _logResponseBody(dynamic data) {
    if (data == null) return;

    debugPrint('│ Body:');

    try {
      if (data is Map || data is List) {
        _logJson(data);
        return;
      }

      if (data is! String) {
        debugPrint('│   $data');
        return;
      }

      try {
        final jsonData = jsonDecode(data);
        _logJson(jsonData);
      } on Exception catch (_) {
        // Not JSON, log as string
        final lines = data.split('\n');
        for (final line in lines.take(10)) {
          debugPrint('│   $line');
        }
        if (lines.length > 10) {
          debugPrint('│   ... (${lines.length - 10} more lines)');
        }
      }
    } on Exception catch (e) {
      debugPrint('│   Failed to parse body: $e');
    }
  }

  void _logJson(dynamic json) {
    try {
      final redactedJson = _redactSensitiveData(json);
      const encoder = JsonEncoder.withIndent('  ');
      final prettyJson = encoder.convert(redactedJson);
      final lines = prettyJson.split('\n');

      // Limit to 50 lines
      for (final line in lines.take(50)) {
        debugPrint('│   $line');
      }

      if (lines.length > 50) {
        debugPrint('│   ... (${lines.length - 50} more lines)');
      }
    } on Exception catch (e) {
      debugPrint('│   Failed to format JSON: $e');
    }
  }

  void _logFormData(FormData formData) {
    debugPrint('│   Fields:');
    for (final field in formData.fields) {
      final value = _shouldRedactField(field.key) ? '***' : field.value;
      debugPrint('│     ${field.key}: $value');
    }

    if (formData.files.isNotEmpty) {
      debugPrint('│   Files:');
      for (final file in formData.files) {
        debugPrint('│     ${file.key}: ${file.value.filename}');
      }
    }
  }

  dynamic _redactSensitiveData(dynamic data) {
    if (data is List) {
      return data.map(_redactSensitiveData).toList();
    }

    if (data is! Map) {
      return data;
    }

    return data.map((key, value) {
      if (_shouldRedactField(key.toString())) {
        return MapEntry(key, '***');
      }
      return MapEntry(key, _redactSensitiveData(value));
    });
  }

  bool _shouldRedactHeader(String header) {
    return redactedHeaders.contains(header.toLowerCase());
  }

  bool _shouldRedactField(String field) {
    final lowerField = field.toLowerCase();
    return redactedFields.any(lowerField.contains);
  }
}

/// Log levels for the logging interceptor
enum LogLevel {
  /// No logging
  none,

  /// Log only basic info (method, url, status)
  basic,

  /// Log basic info + headers
  headers,

  /// Log everything including request/response bodies
  body,
}
