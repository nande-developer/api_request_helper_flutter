// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressData _$ProgressDataFromJson(Map<String, dynamic> json) =>
    _ProgressData(
      count: (json['count'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$ProgressDataToJson(_ProgressData instance) =>
    <String, dynamic>{'count': instance.count, 'total': instance.total};
