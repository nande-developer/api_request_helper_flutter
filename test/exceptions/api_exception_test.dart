import 'dart:io';

import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiException', () {
    test('NetworkException has correct properties', () {
      const exception = NetworkException('No connection');

      expect(exception.message, equals('No connection'));
      expect(exception.statusCode, isNull);
      expect(exception, isA<ApiException>());
      expect(exception, isA<NetworkException>());
    });

    test('NetworkException has default message', () {
      const exception = NetworkException();

      expect(exception.message, equals('No internet connection'));
      expect(exception.statusCode, isNull);
    });

    test('TimeoutException has 408 status code', () {
      const exception = TimeoutException();

      expect(exception.statusCode, equals(408));
      expect(exception.message, equals('Request timeout'));
    });

    test('TimeoutException with custom message', () {
      const exception = TimeoutException('Custom timeout message');

      expect(exception.message, equals('Custom timeout message'));
      expect(exception.statusCode, equals(408));
    });

    test('ServerException has 500+ status code', () {
      const exception = ServerException('Server error', 503);

      expect(exception.statusCode, equals(503));
      expect(exception.message, equals('Server error'));
    });

    test('ServerException has default values', () {
      const exception = ServerException();

      expect(exception.statusCode, equals(500));
      expect(exception.message, equals('Server error occurred'));
    });

    test('BadRequestException has 400 status code', () {
      const exception = BadRequestException('Invalid request');

      expect(exception.statusCode, equals(400));
      expect(exception.message, equals('Invalid request'));
    });

    test('UnauthorizedException has 401 status code', () {
      const exception = UnauthorizedException();

      expect(exception.statusCode, equals(401));
      expect(exception.message, equals('Unauthorized access'));
    });

    test('ForbiddenException has 403 status code', () {
      const exception = ForbiddenException();

      expect(exception.statusCode, equals(403));
      expect(exception.message, equals('Access forbidden'));
    });

    test('NotFoundException has 404 status code', () {
      const exception = NotFoundException();

      expect(exception.statusCode, equals(404));
      expect(exception.message, equals('Resource not found'));
    });

    test('ValidationException has 422 status code', () {
      const exception = ValidationException();

      expect(exception.statusCode, equals(422));
      expect(exception.message, equals('Validation failed'));
    });

    test('CancelledException has null status code', () {
      const exception = CancelledException();

      expect(exception.statusCode, isNull);
      expect(exception.message, equals('Request cancelled'));
    });

    test('UnknownException can have any status code', () {
      const exception = UnknownException('Unknown', 418);

      expect(exception.statusCode, equals(418));
      expect(exception.message, equals('Unknown'));
    });

    test('exception toString includes message and status code', () {
      const exception = BadRequestException('Test error');

      final string = exception.toString();
      expect(string, contains('Test error'));
      expect(string, contains('400'));
    });

    test('exception with data stores data', () {
      final data = {'field': 'error'};
      final exception = ValidationException('Validation failed', data);

      expect(exception.data, equals(data));
      expect(exception.message, equals('Validation failed'));
      expect(exception.statusCode, equals(422));
    });
  });

  group('DioExceptionX.toApiException', () {
    test('converts connection timeout to TimeoutException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionTimeout,
        message: 'Connection timeout',
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<TimeoutException>());
      expect(apiException.statusCode, equals(408));
    });

    test('converts send timeout to TimeoutException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.sendTimeout,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<TimeoutException>());
    });

    test('converts receive timeout to TimeoutException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.receiveTimeout,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<TimeoutException>());
    });

    test('converts 400 to BadRequestException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'message': 'Bad request'},
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<BadRequestException>());
      expect(apiException.message, equals('Bad request'));
      expect(apiException.statusCode, equals(400));
    });

    test('converts 401 to UnauthorizedException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 401,
          data: {'message': 'Unauthorized'},
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<UnauthorizedException>());
      expect(apiException.statusCode, equals(401));
    });

    test('converts 403 to ForbiddenException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 403,
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<ForbiddenException>());
    });

    test('converts 404 to NotFoundException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 404,
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<NotFoundException>());
    });

    test('converts 422 to ValidationException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 422,
          data: {'message': 'Validation failed'},
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<ValidationException>());
    });

    test('converts 500-599 to ServerException', () {
      for (final code in [500, 502, 503, 504]) {
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/test'),
          response: Response(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: code,
          ),
          type: DioExceptionType.badResponse,
        );

        final apiException = dioException.toApiException();

        expect(apiException, isA<ServerException>());
        expect(apiException.statusCode, equals(code));
      }
    });

    test('converts cancel to CancelledException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.cancel,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<CancelledException>());
    });

    test('converts connection error to NetworkException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionError,
        message: 'Connection error',
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<NetworkException>());
    });

    test('converts SocketException to NetworkException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        error: const SocketException('No internet'),
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<NetworkException>());
    });

    test('converts message with "network" to NetworkException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        message: 'Network error occurred',
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<NetworkException>());
    });

    test('converts message with "connection" to NetworkException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        message: 'Connection failed',
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<NetworkException>());
    });

    test('converts bad certificate to ForbiddenException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badCertificate,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<ForbiddenException>());
      expect(apiException.message, contains('SSL certificate'));
    });

    test(
      'extracts error message from response data map with "message" key',
      () {
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/test'),
          response: Response(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: 400,
            data: {'message': 'Custom error message'},
          ),
          type: DioExceptionType.badResponse,
        );

        final apiException = dioException.toApiException();

        expect(apiException.message, equals('Custom error message'));
      },
    );

    test('extracts error message from "error" key', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'error': 'Error from error key'},
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException.message, equals('Error from error key'));
    });

    test('extracts error message from "msg" key', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'msg': 'Error from msg key'},
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException.message, equals('Error from msg key'));
    });

    test('extracts error message from "detail" key', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'detail': 'Error from detail key'},
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException.message, equals('Error from detail key'));
    });

    test('uses string data as error message', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: 'Plain string error',
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException.message, equals('Plain string error'));
    });

    test('uses DioException message when no error message found', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'other': 'data'},
        ),
        type: DioExceptionType.badResponse,
        message: 'Dio error message',
      );

      final apiException = dioException.toApiException();

      expect(apiException.message, isNotNull);
    });

    test('unknown status code converts to UnknownException', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 418, // I'm a teapot
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<UnknownException>());
      expect(apiException.statusCode, equals(418));
    });

    test('preserves response data in converted exception', () {
      final responseData = {'field': 'value', 'code': 'ERROR_CODE'};
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: responseData,
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException.data, equals(responseData));
    });

    test('handles null response data', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
        ),
        type: DioExceptionType.badResponse,
      );

      final apiException = dioException.toApiException();

      expect(apiException, isA<BadRequestException>());
      expect(apiException.data, isNull);
    });
  });
}
