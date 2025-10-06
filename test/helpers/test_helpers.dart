import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart' hide Matcher;
import 'package:mocktail/mocktail.dart';

/// Mock TokenProvider for testing
class MockTokenProvider extends Mock implements TokenProvider {}

/// Creates a test Dio instance with mock adapter
DioAdapter createMockDio() {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.test.com'));
  return DioAdapter(dio: dio);
}

/// Test fixtures
class TestFixtures {
  static const baseUrl = 'https://api.test.com';
  static const validToken = 'valid_token_12345';
  static const refreshedToken = 'refreshed_token_67890';

  static final Map<String, dynamic> testUser = {
    'id': 1,
    'name': 'Test User',
    'email': 'test@example.com',
  };

  static final testError = {
    'message': 'Something went wrong',
    'code': 'ERROR_CODE',
  };

  static ApiClientConfigBuilder createTestConfig({
    List<Interceptor>? interceptors,
    bool enableLogging = false,
    int maxRetries = 0,
  }) {
    return ApiClientConfig.builder(baseUrl: baseUrl)
      ..enableLogging = enableLogging
      ..retryConfig(maxRetries: maxRetries)
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5)
      ..sendTimeout = const Duration(seconds: 5)
      ..build();
  }

  static MockTokenProvider createMockTokenProvider({
    String? token,
    bool hasValidToken = true,
  }) {
    final mock = MockTokenProvider();

    when(mock.getToken).thenAnswer((_) async => token ?? validToken);
    when(mock.hasValidToken).thenAnswer((_) async => hasValidToken);
    when(() => mock.saveToken(any())).thenAnswer((_) async {});
    when(mock.clearToken).thenAnswer((_) async {});
    when(mock.refreshToken).thenAnswer((_) async => refreshedToken);

    return mock;
  }
}

/// Response builders for testing
class ResponseBuilder {
  static Response<T> success<T>(
    T data, {
    int statusCode = 200,
    RequestOptions? requestOptions,
  }) {
    return Response(
      data: data,
      statusCode: statusCode,
      requestOptions: requestOptions ?? RequestOptions(path: '/test'),
    );
  }

  static Response<T> error<T>(
    int statusCode, {
    dynamic data,
    RequestOptions? requestOptions,
  }) {
    return Response(
      data: data as T,
      statusCode: statusCode,
      requestOptions: requestOptions ?? RequestOptions(path: '/test'),
    );
  }
}

/// Matcher helpers
class ApiMatchers {
  static Matcher isNetworkException() => isA<NetworkException>();

  static Matcher isTimeoutException() => isA<TimeoutException>();

  static Matcher isServerException() => isA<ServerException>();

  static Matcher isBadRequestException() => isA<BadRequestException>();

  static Matcher isUnauthorizedException() => isA<UnauthorizedException>();

  static Matcher isForbiddenException() => isA<ForbiddenException>();

  static Matcher isNotFoundException() => isA<NotFoundException>();

  static Matcher isValidationException() => isA<ValidationException>();

  static Matcher isCancelledException() => isA<CancelledException>();

  static Matcher isUnknownException() => isA<UnknownException>();
}
