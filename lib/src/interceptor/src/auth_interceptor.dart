import 'dart:async';

import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// {@template auth_interceptor}
/// Interceptor for handling authentication tokens
///
/// Features:
/// - Automatic token injection in request headers
/// - Token refresh on 401 responses
/// - Request queuing during token refresh
/// - Retry original request after refresh
/// {@endtemplate}
class AuthInterceptor extends Interceptor {
  /// {@macro auth_interceptor}
  AuthInterceptor({
    required this.tokenProvider,
    this.headerKey = 'Authorization',
    this.headerPrefix = 'Bearer',
    this.refreshOn401 = true,
  });

  /// Token provider implementation
  final TokenProvider tokenProvider;

  /// Header key for authorization (default: 'Authorization')
  final String headerKey;

  /// Token prefix (default: 'Bearer')
  final String headerPrefix;

  /// Whether to automatically refresh token on 401
  final bool refreshOn401;

  /// Lock to prevent multiple simultaneous refresh attempts
  Completer<void>? _refreshCompleter;

  /// Queue for pending requests during token refresh
  final List<RequestOptions> _pendingRequests = [];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Wait if token refresh is in progress
    if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
      _pendingRequests.add(options);
      await _refreshCompleter!.future;
    }

    // Inject token if available
    final token = await tokenProvider.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers[headerKey] = '$headerPrefix $token';
      debugPrint('🔐 Token injected for ${options.method} ${options.path}');
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Only handle 401 errors if refresh is enabled
    if (!refreshOn401 || err.response?.statusCode != 401) {
      return handler.next(err);
    }

    debugPrint('🔄 Received 401, attempting token refresh...');

    try {
      // Check if refresh is already in progress
      if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
        debugPrint('⏳ Token refresh already in progress, waiting...');
        await _refreshCompleter!.future;
      } else {
        // Start new refresh process
        _refreshCompleter = Completer<void>();
        await _performTokenRefresh();
        _refreshCompleter!.complete();
      }

      // Retry original request with new token
      final newToken = await tokenProvider.getToken();
      if (newToken != null && newToken.isNotEmpty) {
        debugPrint('✅ Token refreshed, retrying original request');

        final options = err.requestOptions;
        options.headers[headerKey] = '$headerPrefix $newToken';

        // Create a new Dio instance to avoid interceptor loops
        final dio = Dio();
        final response = await dio.fetch<dynamic>(options);

        return handler.resolve(response);
      } else {
        debugPrint('❌ No token available after refresh');
        return handler.next(err);
      }
    } catch (e) {
      debugPrint('❌ Token refresh failed: $e');

      // Clear token on refresh failure
      await tokenProvider.clearToken();

      // Complete the completer to unblock pending requests
      if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
        _refreshCompleter!.completeError(e);
      }

      return handler.next(err);
    } finally {
      // Reset refresh state
      _refreshCompleter = null;
      _pendingRequests.clear();
    }
  }

  Future<void> _performTokenRefresh() async {
    final newToken = await tokenProvider.refreshToken();

    if (newToken == null || newToken.isEmpty) {
      throw Exception('Token refresh returned null or empty token');
    }

    await tokenProvider.saveToken(newToken);
  }
}

/// {@template header_interceptor}
/// Interceptor that adds custom headers to all requests
/// {@endtemplate}
class HeaderInterceptor extends Interceptor {
  /// {@macro header_interceptor}
  HeaderInterceptor(this.headers);

  /// Request headers
  final Map<String, String> headers;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(headers);
    handler.next(options);
  }
}

/// {@template user_agent_interceptor}
/// Interceptor for adding user agent
/// {@endtemplate}
class UserAgentInterceptor extends Interceptor {
  /// {@macro user_agent_interceptor}
  UserAgentInterceptor({
    required this.appName,
    required this.appVersion,
    String? platform,
  }) : platform = platform ?? _getPlatform();

  /// App name that are doing API request
  final String appName;

  /// App version that are doing API request
  final String appVersion;

  /// App platform that are doing API request
  final String platform;

  static String _getPlatform() {
    if (kIsWeb) return 'Web';
    return defaultTargetPlatform.name;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['User-Agent'] = '$appName/$appVersion ($platform)';
    handler.next(options);
  }
}
