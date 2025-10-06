import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiClientConfig', () {
    test('creates config with default values', () {
      // Arrange & Act
      final config = ApiClientConfig.builder(
        baseUrl: 'https://api.example.com',
      ).build();

      // Assert
      expect(config.baseUrl, equals('https://api.example.com'));
      expect(config.connectTimeout, equals(const Duration(seconds: 30)));
      expect(config.receiveTimeout, equals(const Duration(seconds: 60)));
      expect(config.sendTimeout, equals(const Duration(seconds: 60)));
      expect(config.maxRetries, equals(3));
      expect(config.retryDelay, equals(const Duration(seconds: 1)));
      expect(config.followRedirects, isTrue);
      expect(config.maxRedirects, equals(5));
      expect(config.validateCertificates, isTrue);
    });

    test('builder sets custom timeouts', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..connectTimeout = const Duration(seconds: 10)
            ..receiveTimeout = const Duration(seconds: 20)
            ..sendTimeout = const Duration(seconds: 15)
            ..build();

      // Assert
      expect(config.connectTimeout, equals(const Duration(seconds: 10)));
      expect(config.receiveTimeout, equals(const Duration(seconds: 20)));
      expect(config.sendTimeout, equals(const Duration(seconds: 15)));
    });

    test('builder adds single header', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..addHeader('X-Custom', 'value')
            ..build();

      // Assert
      expect(config.defaultHeaders['X-Custom'], equals('value'));
    });

    test('builder adds multiple headers', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..addHeaders({'X-Header1': 'value1', 'X-Header2': 'value2'})
            ..build();

      // Assert
      expect(config.defaultHeaders['X-Header1'], equals('value1'));
      expect(config.defaultHeaders['X-Header2'], equals('value2'));
    });

    test('builder adds interceptor', () {
      // Arrange
      final interceptor = InterceptorsWrapper();

      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..addInterceptor(interceptor)
            ..build();

      // Assert
      expect(config.interceptors, contains(interceptor));
    });

    test('builder enables logging', () {
      // Act
      final config = ApiClientConfig.builder(
        baseUrl: 'https://api.example.com',
      )..build();

      // Assert
      expect(config.enableLogging, isTrue);
    });

    test('builder disables logging', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..enableLogging = false
            ..build();

      // Assert
      expect(config.enableLogging, isFalse);
    });

    test('builder sets cache options', () {
      // Arrange
      final cacheOptions = CacheOptions(store: MemCacheStore());

      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..cacheOptions = cacheOptions
            ..build();

      // Assert
      expect(config.cacheOptions, equals(cacheOptions));
    });

    test('builder enables memory cache with defaults', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..enableMemoryCache()
            ..build();

      // Assert
      expect(config.cacheOptions, isNotNull);
      expect(config.cacheOptions!.store, isA<MemCacheStore>());
      expect(config.cacheOptions!.policy, equals(CachePolicy.request));
    });

    test('builder enables memory cache with custom settings', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..enableMemoryCache(
              maxAge: const Duration(minutes: 5),
              maxStale: 3,
            )
            ..build();

      // Assert
      expect(config.cacheOptions, isNotNull);
      expect(
        config.cacheOptions!.maxStale,
        equals(const Duration(days: 3)),
      );
    });

    test('builder sets certificate pinning', () {
      // Arrange
      const certConfig = CertificatePinningConfig(
        allowedSHA256Fingerprints: ['abc123', 'def456'],
      );

      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..certificatePinning = certConfig
            ..build();

      // Assert
      expect(config.certificatePinning, equals(certConfig));
    });

    test('builder sets retry configuration', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..retryConfig(
              maxRetries: 5,
              retryDelay: const Duration(seconds: 2),
              retryableHttpMethods: {'GET', 'POST'},
              retryableStatusCodes: {500, 503},
            )
            ..build();

      // Assert
      expect(config.maxRetries, equals(5));
      expect(config.retryDelay, equals(const Duration(seconds: 2)));
      expect(config.retryableHttpMethods, equals({'GET', 'POST'}));
      expect(config.retryableStatusCodes, equals({500, 503}));
    });

    test('builder sets redirect configuration', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..redirectConfig(
              followRedirects: false,
              maxRedirects: 10,
            )
            ..build();

      // Assert
      expect(config.followRedirects, isFalse);
      expect(config.maxRedirects, equals(10));
    });

    test('builder sets certificate validation', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..validateCertificates = false
            ..build();

      // Assert
      expect(config.validateCertificates, isFalse);
    });

    test('isLoggingEnabled returns enableLogging value', () {
      // Act
      final enabledConfig = ApiClientConfig.builder(
        baseUrl: 'https://api.example.com',
      ).build();

      final disabledConfigBuilder =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..enableLogging = false;

      final disabledConfig = disabledConfigBuilder.build();

      // Assert
      expect(enabledConfig.isLoggingEnabled, isTrue);
      expect(disabledConfig.isLoggingEnabled, isFalse);
    });

    test('builder chain works correctly', () {
      // Act
      final config =
          ApiClientConfig.builder(
              baseUrl: 'https://api.example.com',
            )
            ..connectTimeout = const Duration(seconds: 15)
            ..addHeader('X-Test', 'value')
            ..retryConfig(maxRetries: 2)
            ..validateCertificates = false
            ..build();

      // Assert
      expect(config.baseUrl, equals('https://api.example.com'));
      expect(config.connectTimeout, equals(const Duration(seconds: 15)));
      expect(config.defaultHeaders['X-Test'], equals('value'));
      expect(config.enableLogging, isTrue);
      expect(config.maxRetries, equals(2));
      expect(config.validateCertificates, isFalse);
    });
  });

  group('CertificatePinningConfig', () {
    test('creates config with fingerprints', () {
      // Act
      const config = CertificatePinningConfig(
        allowedSHA256Fingerprints: ['abc123', 'def456'],
      );

      // Assert
      expect(config.allowedSHA256Fingerprints, equals(['abc123', 'def456']));
      expect(config.hostPatterns, equals(['*']));
    });

    test('creates config with custom host patterns', () {
      // Act
      const config = CertificatePinningConfig(
        allowedSHA256Fingerprints: ['abc123'],
        hostPatterns: ['*.example.com', 'api.example.com'],
      );

      // Assert
      expect(
        config.hostPatterns,
        equals(['*.example.com', 'api.example.com']),
      );
    });
  });
}
