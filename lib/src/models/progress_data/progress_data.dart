import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_data.freezed.dart';

part 'progress_data.g.dart';

/// {@template progress_data}
/// Progress tracking for uploads/downloads
/// {@endtemplate}
@freezed
abstract class ProgressData with _$ProgressData {
  /// {@macro progress_data}
  const factory ProgressData({
    required int count,
    required int total,
  }) = _ProgressData;

  const ProgressData._();

  /// Creates
  factory ProgressData.fromJson(Map<String, dynamic> json) =>
      _$ProgressDataFromJson(json);

  /// Progress percentage (0.0 to 1.0)
  double get percentage => total > 0 ? count / total : 0.0;

  /// Progress percentage (0 to 100)
  int get percentageInt => (percentage * 100).round();

  /// Is download/upload complete
  bool get isComplete => count >= total && total > 0;
}
