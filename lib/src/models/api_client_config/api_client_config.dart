import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_client_config.freezed.dart';

/// {@template api_client_config}
/// Configuration for the API client
/// {@endtemplate}
@freezed
abstract class ApiClientConfig with _$ApiClientConfig {
  /// {@macro api_client_config}
  const factory ApiClientConfig({
    /// Base URL for all API requests
    required String baseUrl,

    /// Connect timeout duration (default: 30 seconds)
    @Default(Duration(seconds: 30)) Duration connectTimeout,

    /// Receive timeout duration (default: 60 seconds)
    @Default(Duration(seconds: 60)) Duration receiveTimeout,

    /// Send timeout duration (default: 60 seconds)
    @Default(Duration(seconds: 60)) Duration sendTimeout,

    /// Default headers to be included in all requests
    @Default({}) Map<String, String> defaultHeaders,

    /// Additional Dio interceptors
    @Default([]) List<Interceptor> interceptors,

    /// Enable logging (default: enabled in debug mode)
    bool? enableLogging,

    /// Cache configuration
    CacheOptions? cacheOptions,

    /// Certificate pinning configuration
    CertificatePinningConfig? certificatePinning,

    /// Maximum number of retry attempts (default: 3)
    @Default(3) int maxRetries,

    /// Initial delay for retry with exponential backoff (default: 1 second)
    @Default(Duration(seconds: 1)) Duration retryDelay,

    /// HTTP methods to retry (default: GET, HEAD, OPTIONS, PUT, DELETE)
    @Default({
      'GET',
      'HEAD',
      'OPTIONS',
      'PUT',
      'DELETE',
    })
    Set<String> retryableHttpMethods,

    /// Status codes that should trigger a retry
    @Default({408, 429, 500, 502, 503, 504}) Set<int> retryableStatusCodes,

    /// Whether to follow redirects (default: true)
    @Default(true) bool followRedirects,

    /// Maximum number of redirects to follow (default: 5)
    @Default(5) int maxRedirects,

    /// Validate SSL certificates (default: true, false only for dev)
    @Default(true) bool validateCertificates,
  }) = _ApiClientConfig;

  const ApiClientConfig._();

  /// Whether logging is enabled
  bool get isLoggingEnabled => enableLogging ?? kDebugMode;

  /// Creates a builder for constructing ApiClientConfig
  static ApiClientConfigBuilder builder({required String baseUrl}) =>
      ApiClientConfigBuilder._(baseUrl: baseUrl);
}

/// {@template certificate_pinning_config}
/// Certificate pinning configuration
/// {@endtemplate}
@freezed
abstract class CertificatePinningConfig with _$CertificatePinningConfig {
  /// {@macro certificate_pinning_config}
  const factory CertificatePinningConfig({
    /// List of allowed SHA-256 certificate fingerprints
    required List<String> allowedSHA256Fingerprints,

    /// Hostname patterns to apply pinning to (e.g., ['*.example.com',
    /// 'api.example.com'])
    @Default(['*']) List<String> hostPatterns,
  }) = _CertificatePinningConfig;
}

/// Builder for ApiClientConfig
class ApiClientConfigBuilder {
  ApiClientConfigBuilder._({required this.baseUrl});

  /// Base URL
  final String baseUrl;

  /// Connect timeout
  Duration connectTimeout = const Duration(seconds: 30);

  /// Receive timeout
  Duration receiveTimeout = const Duration(seconds: 60);

  /// Send timeout
  Duration sendTimeout = const Duration(seconds: 60);

  /// Default headers
  final Map<String, String> defaultHeaders = {};

  /// Interceptors
  final List<Interceptor> interceptors = [];

  /// Enable logging
  bool? enableLogging = true;

  /// Cache options
  CacheOptions? cacheOptions;

  /// Certificate pinning config
  CertificatePinningConfig? certificatePinning;

  /// Max retries
  int maxRetries = 3;

  /// Retry delay
  Duration retryDelay = const Duration(seconds: 1);

  /// Retryable HTTP methods
  Set<String> retryableHttpMethods = {
    'GET',
    'HEAD',
    'OPTIONS',
    'PUT',
    'DELETE',
  };

  /// Retryable status codes
  Set<int> retryableStatusCodes = {408, 429, 500, 502, 503, 504};

  /// Follow redirects
  bool followRedirects = true;
  
  /// Max redirects
  int maxRedirects = 5;

  /// Certificate validation (should be false only in development)
  bool validateCertificates = true;

  /// Adds a default header
  void addHeader(String key, String value) {
    defaultHeaders[key] = value;
  }

  /// Adds multiple default headers
  void addHeaders(Map<String, String> headers) {
    defaultHeaders.addAll(headers);
  }

  /// Adds an interceptor
  void addInterceptor(Interceptor interceptor) {
    interceptors.add(interceptor);
  }

  /// Enables memory cache with default settings
  void enableMemoryCache({
    Duration maxAge = const Duration(minutes: 10),
    int maxStale = 7,
  }) {
    cacheOptions = CacheOptions(
      store: MemCacheStore(),
      maxStale: Duration(days: maxStale),
      priority: CachePriority.high,
    );
  }

  /// Sets retry configuration
  void retryConfig({
    int? maxRetries,
    Duration? retryDelay,
    Set<String>? retryableHttpMethods,
    Set<int>? retryableStatusCodes,
  }) {
    if (maxRetries != null) this.maxRetries = maxRetries;
    if (retryDelay != null) this.retryDelay = retryDelay;
    if (retryableHttpMethods != null) {
      this.retryableHttpMethods = retryableHttpMethods;
    }
    if (retryableStatusCodes != null) {
      this.retryableStatusCodes = retryableStatusCodes;
    }
  }

  /// Sets redirect configuration
  void redirectConfig({
    bool? followRedirects,
    int? maxRedirects,
  }) {
    if (followRedirects != null) this.followRedirects = followRedirects;
    if (maxRedirects != null) this.maxRedirects = maxRedirects;
  }

  /// Builds the configuration
  ApiClientConfig build() {
    return ApiClientConfig(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      defaultHeaders: defaultHeaders,
      interceptors: this.interceptors,
      enableLogging: enableLogging,
      cacheOptions: cacheOptions,
      certificatePinning: certificatePinning,
      maxRetries: this.maxRetries,
      retryDelay: this.retryDelay,
      retryableHttpMethods: this.retryableHttpMethods,
      retryableStatusCodes: this.retryableStatusCodes,
      followRedirects: this.followRedirects,
      maxRedirects: this.maxRedirects,
      validateCertificates: validateCertificates,
    );
  }
}
