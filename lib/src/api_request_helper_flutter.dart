import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

/// {@template service_exception}
/// Custom exception model that provides exceptions in a format to users.
/// {@endtemplate}
class CustomException extends Equatable implements Exception {
  /// {@macro service_exception}
  const CustomException({this.code, this.message, this.stackTrace});

  /// The optional code to accommodate the message.
  ///
  /// Allows users to identify the exception from a short code-name, for example
  /// "wrong-password" is used when a user insert the wrong password
  final String? code;

  /// The long form message of the exception.
  final String? message;

  /// An interface implemented by all stack trace objects.
  /// A [StackTrace] is intended to convey information to the user about the
  /// call sequence that triggered an exception.
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [code, message, stackTrace];
}

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
      headers.addAll({'Authorization': 'Bearer $userToken'});
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
      headers.addAll({'Authorization': 'Bearer $token'});
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
      request.headers.addAll({'Authorization': 'Bearer $token'});
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

  Future<dynamic> _sendRequest(http.BaseRequest request) async {
    final response =
        await _client.send(request).timeout(const Duration(minutes: 1));

    return _returnResponse(response);
  }

  Future<dynamic> _returnResponse(http.StreamedResponse response) async {
    final stringBody = await response.stream.bytesToString();
    final statusCode = response.statusCode;
    final mappedResponse = jsonDecode(stringBody) as Map<String, dynamic>;
    log('ApiRequestHelper -- response status code: $statusCode');
    log('ApiRequestHelper -- body: $mappedResponse');

    switch (statusCode) {
      case 200:
        return mappedResponse;
      case 400:
        throw CustomException(
          code: 'bad-response',
          message: response.reasonPhrase,
        );
      case 403:
        throw CustomException(
          code: 'forbidden',
          message: response.reasonPhrase,
        );
      case 422:
        throw CustomException(
          code: 'format',
          message: response.reasonPhrase,
        );
      default:
        if (statusCode >= 500 && statusCode < 600) {
          throw CustomException(
            code: 'server',
            message: response.reasonPhrase,
          );
        }

        throw CustomException(code: 'unknown', message: response.reasonPhrase);
    }
  }
}
