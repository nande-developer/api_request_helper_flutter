// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:typed_data';

import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_request_helper_flutter_test.mocks.dart';

// TODO(fajar): find out why stubbing not working
@GenerateMocks([http.Client])
void main() {
  late http.Client client;

  setUp(() {
    client = MockClient();
  });

  group('ApiRequestHelperFlutter', () {
    test('can be instantiated', () {
      expect(ApiRequestHelperFlutter(), isNotNull);
    });

    group('get', () {
      Future<void> runGetMethodTest({bool isSuccess = true}) async {
        final uri = Uri.parse('https://api.escuelajs.co/api/v1/users/1');

        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer token'
        };

        const expectedSuccessResponseString =
            '{"id":1,"email":"john@mail.com","password":"changeme","name":"Jhon","role":"customer","avatar":"https://picsum.photos/640/640?r=1066","creationAt":"2023-05-31T00:14:31.000Z","updatedAt":"2023-05-31T00:14:31.000Z"}';

        const expectedFailedResponseString = 'Not found';

        final expextedResponseByte = Uint8List.fromList(
          utf8.encode(
            isSuccess
                ? expectedSuccessResponseString
                : expectedFailedResponseString,
          ),
        );

        final byteStream = http.ByteStream.fromBytes(expextedResponseByte);

        final request = http.Request('GET', uri, );
        request.headers.addAll(headers);
        print('request e $request ${request.headers}');

        when(client.send(request)).thenAnswer(
          (_) async {
            if (isSuccess) return http.StreamedResponse(byteStream, 200);
            return http.StreamedResponse(byteStream, 404);
          },
        );

        final apiRequestHelper = ApiRequestHelperFlutter(client: client);
        final response =
            await apiRequestHelper.get(uri: uri, userToken: 'token');

        if (isSuccess) {
          expect(response, equals(jsonDecode(expectedSuccessResponseString)));
        } else {
          expect(response, throwsException);
        }
      }

      test(
        'returns a Map<String, dynaimc> if a http call successfully.',
        runGetMethodTest,
      );

      test(
        'throws Exception if e http call failed.',
        () => runGetMethodTest(isSuccess: false),
      );
    });
  });
}
