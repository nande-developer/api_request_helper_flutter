import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BaseResponse', () {
    test('creates response with all fields', () {
      const response = BaseResponse<Map<String, dynamic>>(
        status: 200,
        data: {'id': 1, 'name': 'Test'},
        headers: {'content-type': 'application/json'},
        message: 'Success',
      );

      expect(response.status, equals(200));
      expect(response.data, equals({'id': 1, 'name': 'Test'}));
      expect(response.headers, isNotNull);
      expect(response.message, equals('Success'));
    });

    test('creates response with minimal fields', () {
      const response = BaseResponse<String>(
        status: 200,
        data: 'OK',
      );

      expect(response.status, equals(200));
      expect(response.data, equals('OK'));
      expect(response.headers, isNull);
      expect(response.message, isNull);
    });

    test('supports generic types', () {
      const listResponse = BaseResponse<List<int>>(
        status: 200,
        data: [1, 2, 3],
      );

      expect(listResponse.data, isA<List<int>>());
      expect(listResponse.data?.length, equals(3));

      const mapResponse = BaseResponse<Map<String, String>>(
        status: 200,
        data: {'key': 'value'},
      );

      expect(mapResponse.data, isA<Map<String, String>>());
      expect(mapResponse.data?['key'], equals('value'));
    });
  });
}
