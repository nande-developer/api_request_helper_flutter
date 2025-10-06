import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_exception.freezed.dart';

/// {@template service_exception}
/// Custom exception model that provides exceptions in a format to users.
/// {@endtemplate}
@freezed
sealed class ServiceException with _$ServiceException implements Exception {
  /// {@macro service_exception}
  const factory ServiceException({
    String? code,
    String? message,
    StackTrace? stackTrace,
  }) = _ServiceException;

  /// {@macro service_exception}
  const ServiceException._();
}
