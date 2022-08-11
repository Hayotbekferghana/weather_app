// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysItem _$SysItemFromJson(Map<String, dynamic> json) => SysItem(
      sunset: json['sunset'] as int? ?? 0,
      sunrise: json['sunrise'] as int? ?? 0,
      country: json['country'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
    );

Map<String, dynamic> _$SysItemToJson(SysItem instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'country': instance.country,
    };
