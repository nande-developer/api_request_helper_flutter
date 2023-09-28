import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

/// {@template base_response}
/// Base object of all request response
/// {@endtemplate}
@JsonSerializable()
class BaseResponse extends Equatable {
  /// {@macro base_response}
  const BaseResponse({this.status, this.message, this.data, this.error});

  /// Creates a [BaseResponse] from Json map
  factory BaseResponse.fromJson(Map<String, dynamic> data) =>
      _$BaseResponseFromJson(data);

  /// Status code of a response
  final num? status;

  /// Message of a response
  final String? message;

  /// Data of a response
  final dynamic data;

  /// Error of a response
  final String? error;

  /// Empty user which represents an empty [BaseResponse].
  static const empty = BaseResponse();

  /// Convenience getter to determine whether the current [BaseResponse] is
  /// empty.
  bool get isEmpty => this == BaseResponse.empty;

  /// Convenience getter to determine whether the current [BaseResponse] is
  /// not empty.
  bool get isNotEmpty => this != BaseResponse.empty;

  /// Creates a Json map from a BaseResponse
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  @override
  List<Object?> get props => [status, message, data, error];
}
