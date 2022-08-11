// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyWeatherItem _$HourlyWeatherItemFromJson(Map<String, dynamic> json) =>
    HourlyWeatherItem(
      main: json['main'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      description: json['description'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$HourlyWeatherItemToJson(HourlyWeatherItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
