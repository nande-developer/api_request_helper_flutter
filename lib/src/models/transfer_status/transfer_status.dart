import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_status.freezed.dart';
part 'transfer_status.g.dart';

/// Download/Upload status
@freezed
abstract class TransferStatus with _$TransferStatus {
  /// Idle
  const factory TransferStatus.idle() = _Idle;

  /// In progress
  const factory TransferStatus.inProgress(ProgressData progress) = _InProgress;

  /// Completed
  const factory TransferStatus.completed() = _Completed;

  /// Failed
  const factory TransferStatus.failed(String error) = _Failed;

  /// Cancelled
  const factory TransferStatus.cancelled() = _Cancelled;

  /// Create [TransferStatus] from JSON object
  factory TransferStatus.fromJson(Map<String, dynamic> json) =>
      _$TransferStatusFromJson(json);
}
