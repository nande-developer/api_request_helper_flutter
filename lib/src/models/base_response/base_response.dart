import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

/// {@template base_response}
/// Base object of all request response
/// {@endtemplate}
@Freezed(genericArgumentFactories: true)
sealed class BaseResponse<T> with _$BaseResponse<T> {
  /// {@macro base_response}
  const factory BaseResponse({
    num? status,
    String? message,
    T? data,
    String? error,
    Map<String, dynamic>? headers,
  }) = _BaseResponse;

  /// Creates a [BaseResponse] from Json map
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);

  const BaseResponse._();

  /// Empty user which represents an empty [BaseResponse].
  static const empty = BaseResponse<dynamic>();

  /// Convenience getter to determine whether the current [BaseResponse] is
  /// empty.
  bool get isEmpty => this == BaseResponse.empty;

  /// Convenience getter to determine whether the current [BaseResponse] is
  /// not empty.
  bool get isNotEmpty => this != BaseResponse.empty;
}
