// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Idle _$IdleFromJson(Map<String, dynamic> json) =>
    _Idle($type: json['runtimeType'] as String?);

Map<String, dynamic> _$IdleToJson(_Idle instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

_InProgress _$InProgressFromJson(Map<String, dynamic> json) => _InProgress(
  ProgressData.fromJson(json['progress'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$InProgressToJson(_InProgress instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'runtimeType': instance.$type,
    };

_Completed _$CompletedFromJson(Map<String, dynamic> json) =>
    _Completed($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CompletedToJson(_Completed instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_Failed _$FailedFromJson(Map<String, dynamic> json) =>
    _Failed(json['error'] as String, $type: json['runtimeType'] as String?);

Map<String, dynamic> _$FailedToJson(_Failed instance) => <String, dynamic>{
  'error': instance.error,
  'runtimeType': instance.$type,
};

_Cancelled _$CancelledFromJson(Map<String, dynamic> json) =>
    _Cancelled($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CancelledToJson(_Cancelled instance) =>
    <String, dynamic>{'runtimeType': instance.$type};
