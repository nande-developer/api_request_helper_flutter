// // ignore_for_file: unintended_html_in_doc_comment, document_ignores

// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
// import 'package:dio/dio.dart';
// // import 'package:http/http.dart' as http;

// /// {@template api_request_helper_flutter}
// /// Flutter package for handling http calls such as GET, POST, PUT, DELETE.
// /// {@endtemplate}
// class ApiRequestHelperFlutter {
//   /// {@macro api_request_helper_flutter}
//   ApiRequestHelperFlutter({Dio? dio}) : _dio = dio ?? Dio() {
//     _dio.options = BaseOptions(
//       contentType: 'application/json',
//     );
//     _dio.interceptors.add(LogInterceptor(logPrint: (o) => log(o.toString())));
//   }

//   final Dio _dio;

//   final _statusCodeController = StreamController<num>();
//   final _baseResponseStreamController = StreamController<BaseResponse>();

//   /// Convenient getter for status code
//   Stream<num> get statusCode async* {
//     yield* _statusCodeController.stream;
//   }

//   /// Convenient getter for base response
//   Stream<BaseResponse> get baseResponse async* {
//     yield* _baseResponseStreamController.stream;
//   }

//   /// Calls GET api which will emit [Future] [Map<String, dynamic>]
//   ///
//   /// Throws a [Exception] if response status code is not 200
//   Future<T> get<T>({
//     required Uri uri,
//     required T Function(Map<String, dynamic> json) fromJson,
//     String userToken = '',
//   }) async {
//     final headers = <String, dynamic>{};

//     if (userToken.isNotEmpty) {
//       headers.addAll({'Authorization': userToken});
//     }

//     final response = await _dio.getUri<T>(
//       uri,
//       options: Options(headers: headers),
//     );

//     return _returnResponse<T>(response);
//   }

//   /// Calls POST api with raw json body which will emit [Future] dynamic
//   ///
//   /// Throws a [Exception] if response status code is not 200
//   Future<dynamic> postWithJson({
//     required Uri uri,
//     required Map<String, dynamic> body,
//     Map<String, String> headers = const {},
//     String token = '',
//   }) async {
//     if (token.isNotEmpty) {
//       headers.addAll({'Authorization': token});
//     }

//     final response = await _dio.postUri<dynamic>(
//       uri,
//       data: jsonEncode(body),
//       options: Options(headers: headers),
//     );

//     return _returnResponse(response);
//   }

//   /// Calls POST api which will emit [Future] dynamic
//   ///
//   /// Throws a [Exception] if response status code is not 200
//   Future<dynamic> post({
//     required Uri uri,
//     required Map<String, String> body,
//     Map<String, String> additionalHeaders = const {},
//     Map<String, String> fileData = const {},
//     String token = '',
//   }) async {
//     final headers = {'Content-Type': 'application/json'}
//       ..addAll(additionalHeaders);

//     if (token.isNotEmpty) {
//       headers.addAll({'Authorization': token});
//     }

//     log('ApiRequestHelper -- method: POST');
//     log('ApiRequestHelper -- uri: $uri');
//     log('ApiRequestHelper -- request headers: $headers');
//     log('ApiRequestHelper -- request body: $body');
//     final request = http.MultipartRequest('POST', uri);
//     request.headers.addAll(headers);
//     request.fields.addAll(body);

//     if (fileData.isNotEmpty) {
//       for (final filePathEntry in fileData.entries) {
//         final field = filePathEntry.key;
//         final fieldPath = filePathEntry.value;

//         request.files.add(await http.MultipartFile.fromPath(field, fieldPath));
//       }
//     }

//     return _sendRequest(request);
//   }

//   /// Calls PATCH api which will emit [Future] dynamic
//   ///
//   /// Throws a [Exception] if response status code is not 200
//   Future<dynamic> patch({
//     required Uri uri,
//     required Map<String, String> body,
//     Map<String, String> filePath = const {},
//     String token = '',
//   }) async {
//     final request = http.MultipartRequest('PATCH', uri);
//     final headers = {'Content-Type': 'application/json'};

//     if (token.isNotEmpty) {
//       request.headers.addAll({'Authorization': token});
//     }

//     log('ApiRequestHelper -- method: PATCH');
//     log('ApiRequestHelper -- uri: $uri');
//     log('ApiRequestHelper -- request headers: $headers');
//     log('ApiRequestHelper -- request body: $body');

//     if (filePath.isNotEmpty && filePath.length == 1) {
//       body.remove(filePath.keys.first);

//       final file = await http.MultipartFile.fromPath(
//         filePath.keys.first,
//         filePath.values.first,
//       );

//       request.files.add(file);
//     }

//     request.fields.addAll(body);
//     return _sendRequest(request);
//   }

//   /// Calls PUT api which will emit [Future] dynamic
//   ///
//   /// Throws a [Exception] if response status code is not 200
//   Future<dynamic> put({
//     required Uri uri,
//     required Map<String, String> body,
//     Map<String, String> filePath = const {},
//     String token = '',
//   }) async {
//     final request = http.MultipartRequest('PUT', uri);
//     final headers = {'Content-Type': 'application/json'};

//     if (token.isNotEmpty) {
//       request.headers.addAll({'Authorization': token});
//     }

//     log('ApiRequestHelper -- method: PUT');
//     log('ApiRequestHelper -- uri: $uri');
//     log('ApiRequestHelper -- request headers: $headers');
//     log('ApiRequestHelper -- request body: $body');

//     if (filePath.isNotEmpty && filePath.length == 1) {
//       body.remove(filePath.keys.first);

//       final file = await http.MultipartFile.fromPath(
//         filePath.keys.first,
//         filePath.values.first,
//       );

//       request.files.add(file);
//     }

//     request.fields.addAll(body);
//     return _sendRequest(request);
//   }

//   /// Calls DELETE api which will emit [Future] dynamic
//   ///
//   /// Throws a [Exception] if response status code is not 200
//   Future<dynamic> delete({
//     required Uri uri,
//     String userToken = '',
//   }) async {
//     final headers = {'Content-Type': 'application/json'};

//     if (userToken.isNotEmpty) {
//       headers.addAll({'Authorization': userToken});
//     }

//     log('ApiRequestHelper -- method: DELETE');
//     log('ApiRequestHelper -- uri: $uri');
//     log('ApiRequestHelper -- request headers: $headers');

//     final request = http.Request('DELETE', uri);
//     request.headers.addAll(headers);
//     return _sendRequest(request);
//   }

//   Future<dynamic> _sendRequest() async {
//     try {
//       final response = await _client
//           .send(request)
//           .timeout(const Duration(minutes: 1));

//       // final response = await _dio.request();

//       return _returnResponse(response);
//     } on SocketException catch (error, stackTrace) {
//       log('$error');
//       log('$stackTrace');

//       throw ServiceException(
//         code: 'socket-exception',
//         message: error.message,
//         stackTrace: stackTrace,
//       );
//     } on FormatException catch (error, stackTrace) {
//       log('$error');
//       log('$stackTrace');

//       throw ServiceException(
//         code: 'format-exception',
//         message: error.message,
//         stackTrace: stackTrace,
//       );
//     }
//   }

//   Future<T> _returnResponse<T>(Response<T> response) async {
//     final stringBody = await response.stream.bytesToString();
//     final statusCode = response.statusCode;
//     final mappedResponse = jsonDecode(stringBody) as Map<String, dynamic>;
//     final baseResponse = BaseResponse.fromJson(mappedResponse);
//     log('ApiRequestHelper -- response status code: $statusCode');
//     log('ApiRequestHelper -- body: $mappedResponse');

//     _statusCodeController.add(statusCode);
//     _baseResponseStreamController.add(baseResponse);

//     if (statusCode == 200 && baseResponse.status == 200) {
//       return baseResponse.data;
//     }

//     throw ServiceException(
//       code: response.reasonPhrase?.replaceAll(' ', '-').toLowerCase(),
//       message: baseResponse.message,
//     );
//   }

//   /// Dispose all stream controllers
//   void dispose() {
//     _statusCodeController.close();
//     _baseResponseStreamController.close();
//   }
// }

// /// Convinient converter for converting Map<String, dynamic> to json body format
// extension ToJson on Map<String, dynamic> {
//   /// Convinient function for converting Map<String, dynamic> to json body
//   /// format
//   Map<String, String> get toJson {
//     final json = Map<String, String>.from({});
//     final length = this.length;

//     for (var i = 0; i < length; i++) {
//       final key = keys.elementAt(i);
//       final value = values.elementAt(i);
//       json.addAll({key: '$value'});
//     }

//     return json;
//   }
// }

// class CustomInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     log('REQUEST[${options.method}] => PATH: ${options.uri}');
//     log('REQUEST HEADERS: ${options.headers}');
//     log('REQUEST BODY: ${options.data}');
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(
//     Response<dynamic> response,
//     ResponseInterceptorHandler handler,
//   ) {
//     log(
//       'RESPONSE[${response.statusCode}] => PATH: '
//       '${response.requestOptions.path}',
//     );

//     super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     log(
//       'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
//     );

//     super.onError(err, handler);
//   }
// }
