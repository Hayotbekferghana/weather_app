// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeatherItem _$DailyWeatherItemFromJson(Map<String, dynamic> json) =>
    DailyWeatherItem(
      main: json['main'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      description: json['description'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$DailyWeatherItemToJson(DailyWeatherItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
