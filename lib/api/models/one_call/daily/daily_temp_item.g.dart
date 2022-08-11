// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_temp_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTempItem _$DailyTempItemFromJson(Map<String, dynamic> json) =>
    DailyTempItem(
      day: (json['day'] as num?)?.toDouble() ?? 0.0,
      eve: (json['eve'] as num?)?.toDouble() ?? 0.0,
      max: (json['max'] as num?)?.toDouble() ?? 0.0,
      min: (json['min'] as num?)?.toDouble() ?? 0.0,
      morn: (json['morn'] as num?)?.toDouble() ?? 0.0,
      night: (json['night'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$DailyTempItemToJson(DailyTempItem instance) =>
    <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
