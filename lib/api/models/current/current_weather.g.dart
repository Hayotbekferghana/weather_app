// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      id: json['id'] as int? ?? 0,
      weatherItem: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      name: json['name'] as String? ?? '',
      visibility: json['visibility'] as int? ?? 0,
      base: json['base'] as String? ?? '',
      cod: json['cod'] as int? ?? 0,
      coordItem: CoordItem.fromJson(json['coord'] as Map<String, dynamic>),
      dt: json['dt'] as int? ?? 0,
      mainItem: MainItem.fromJson(json['main'] as Map<String, dynamic>),
      sys: SysItem.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int? ?? 0,
      windItem: WindItem.fromJson(json['wind'] as Map<String, dynamic>),
      cloudsItem: CloudsItem.fromJson(json['clouds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timezone': instance.timezone,
      'base': instance.base,
      'name': instance.name,
      'cod': instance.cod,
      'visibility': instance.visibility,
      'dt': instance.dt,
      'sys': instance.sys,
      'main': instance.mainItem,
      'wind': instance.windItem,
      'coord': instance.coordItem,
      'clouds': instance.cloudsItem,
      'weather': instance.weatherItem,
    };
