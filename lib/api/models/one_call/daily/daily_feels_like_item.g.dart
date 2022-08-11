// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_feels_like_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyFeelsLikeItem _$DailyFeelsLikeItemFromJson(Map<String, dynamic> json) =>
    DailyFeelsLikeItem(
      day: (json['day'] as num?)?.toDouble() ?? 0.0,
      eve: (json['eve'] as num?)?.toDouble() ?? 0.0,
      morn: (json['morn'] as num?)?.toDouble() ?? 0.0,
      night: (json['night'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$DailyFeelsLikeItemToJson(DailyFeelsLikeItem instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
