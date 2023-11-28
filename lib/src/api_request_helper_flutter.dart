import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:http/http.dart' as http;

/// {@template api_request_helper_flutter}
/// Flutter package for handling http calls such as GET, POST, PUT, DELETE.
/// {@endtemplate}
class ApiRequestHelperFlutter {
  /// {@macro api_request_helper_flutter}
  ApiRequestHelperFlutter({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  /// Calls GET api which will emit [Future] Map<String, dynamic>
  ///
  /// Throws a [Exception] if response status code is not 200
  Future<dynamic> get({
    required Uri uri,
    String userToken = '',
  }) async {
    final headers = {'Content-Type': 'application/json'};

    if (userToken.isNotEmpty) {
      headers.addAll({'Authorization': userToken});
    }

    log('ApiRequestHelper -- method: GET');
    log('ApiRequestHelper -- uri: $uri');
    log('ApiRequestHelper -- request headers: $headers');
    final request = http.Request('GET', uri);
    request.headers.addAll(headers);
    return _sendRequest(request);
  }

  /// Calls POST api which will emit [Future] dynamic
  ///
  /// Throws a [Exception] if response status code is not 200
  Future<dynamic> post({
    required Uri uri,
    required Map<String, String> body,
    Map<String, String> additionalHeaders = const {},
    Map<String, String> fileData = const {},
    String token = '',
  }) async {
    final headers = {'Content-Type': 'application/json'}
      ..addAll(additionalHeaders);

    if (token.isNotEmpty) {
      headers.addAll({'Authorization': token});
    }

    log('ApiRequestHelper -- method: POST');
    log('ApiRequestHelper -- uri: $uri');
    log('ApiRequestHelper -- request headers: $headers');
    log('ApiRequestHelper -- request body: $body');
    final request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);
    request.fields.addAll(body);

    if (fileData.isNotEmpty) {
      for (final filePathEntry in fileData.entries) {
        final field = filePathEntry.key;
        final fieldPath = filePathEntry.value;

        request.files.add(await http.MultipartFile.fromPath(field, fieldPath));
      }
    }

    return _sendRequest(request);
  }

  /// Calls PATCH api which will emit [Future] dynamic
  ///
  /// Throws a [Exception] if response status code is not 200
  Future<dynamic> patch({
    required Uri uri,
    required Map<String, String> body,
    Map<String, String> filePath = const {},
    String token = '',
  }) async {
    final request = http.MultipartRequest('PATCH', uri);
    final headers = {'Content-Type': 'application/json'};

    if (token.isNotEmpty) {
      request.headers.addAll({'Authorization': token});
    }

    log('ApiRequestHelper -- method: PATCH');
    log('ApiRequestHelper -- uri: $uri');
    log('ApiRequestHelper -- request headers: $headers');
    log('ApiRequestHelper -- request body: $body');

    if (filePath.isNotEmpty && filePath.length == 1) {
      body.remove(filePath.keys.first);

      final file = await http.MultipartFile.fromPath(
        filePath.keys.first,
        filePath.values.first,
      );

      request.files.add(file);
    }

    request.fields.addAll(body);
    return _sendRequest(request);
  }

  /// Calls PUT api which will emit [Future] dynamic
  ///
  /// Throws a [Exception] if response status code is not 200
  Future<dynamic> put({
    required Uri uri,
    required Map<String, String> body,
    Map<String, String> filePath = const {},
    String token = '',
  }) async {
    final request = http.MultipartRequest('PUT', uri);
    final headers = {'Content-Type': 'application/json'};

    if (token.isNotEmpty) {
      request.headers.addAll({'Authorization': token});
    }

    log('ApiRequestHelper -- method: PUT');
    log('ApiRequestHelper -- uri: $uri');
    log('ApiRequestHelper -- request headers: $headers');
    log('ApiRequestHelper -- request body: $body');

    if (filePath.isNotEmpty && filePath.length == 1) {
      body.remove(filePath.keys.first);

      final file = await http.MultipartFile.fromPath(
        filePath.keys.first,
        filePath.values.first,
      );

      request.files.add(file);
    }

    request.fields.addAll(body);
    return _sendRequest(request);
  }

  Future<dynamic> _sendRequest(http.BaseRequest request) async {
    final response =
        await _client.send(request).timeout(const Duration(minutes: 1));

    return _returnResponse(response);
  }

  Future<dynamic> _returnResponse(http.StreamedResponse response) async {
    final stringBody = await response.stream.bytesToString();
    final statusCode = response.statusCode;
    final mappedResponse = jsonDecode(stringBody) as Map<String, dynamic>;
    final baseResponse = BaseResponse.fromJson(mappedResponse);
    log('ApiRequestHelper -- response status code: $statusCode');
    log('ApiRequestHelper -- body: $mappedResponse');

    if (statusCode == 200 && baseResponse.status == 200) {
      return baseResponse.data;
    }

    throw ServiceException(
      code: response.reasonPhrase?.replaceAll(' ', '-').toLowerCase(),
      message: baseResponse.message,
    );
  }
}

/// Convinient converter for converting Map<String, dynamic> to json body format
extension ToJson on Map<String, dynamic> {
  /// Convinient function for converting Map<String, dynamic> to json body 
  /// format
  Map<String, String> get toJson {
    final json = Map<String, String>.from({});
    final length = this.length;

    for (var i = 0; i < length; i++) {
      final key = keys.elementAt(i);
      final value = values.elementAt(i);
      json.addAll({key: '$value'});
    }

    return json;
  }
}
