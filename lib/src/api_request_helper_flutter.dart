import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

/// {@template api_request_helper_flutter}
/// Flutter package for handling http calls such as GET, POST, PUT, DELETE.
/// {@endtemplate}
class ApiRequestHelperFlutter {
  /// {@macro api_request_helper_flutter}
  const ApiRequestHelperFlutter();

  /// Calls GET api which will emit [Future] Map<String, dynamic>
  ///
  /// Throws a [Exception] if response status code is not 200
  Future<dynamic> get({
    required Uri uri,
    String? userToken,
    Map<String, String>? body,
  }) async {
    final headers = {'Content-Type': 'application/json'};

    if (userToken != null) {
      headers.addAll({'Authorization': 'Bearer $userToken'});
    }

    log('ApiRequestHelper -- uri: $uri');
    log('ApiRequestHelper -- request headers: $headers');

    final request = http.Request('GET', uri);
    request.headers.addAll(headers);

    if (body != null) {
      request.bodyFields = body;
      log('ApiRequestHelper -- request body: $body');
    }

    return _sendRequest(request);
  }

  Future<dynamic> _sendRequest(http.BaseRequest request) async {
    final response = await request.send().timeout(
          const Duration(minutes: 1),
          onTimeout: () => throw TimeoutException(''),
        );

    return _returnResponse(response);
  }

  Future<dynamic> _returnResponse(http.StreamedResponse response) async {
    final stringBody = await response.stream.bytesToString();
    final statusCode = response.statusCode;
    final mappedResponse = jsonDecode(stringBody) as Map<String, dynamic>;
    log('ApiRequestHelper -- response status code: $statusCode');
    log('ApiRequestHelper -- body status code: $statusCode');
    log('ApiRequestHelper -- body: $mappedResponse');

    switch (mappedResponse['code']) {
      case 200:
        return stringBody;
      default:
        return Exception(mappedResponse['message']);
    }
  }
}
