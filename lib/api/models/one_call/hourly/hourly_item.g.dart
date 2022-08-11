// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyItem _$HourlyItemFromJson(Map<String, dynamic> json) => HourlyItem(
      dt: json['dt'] as int? ?? 0,
      pressure: (json['pressure'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['humidity'] as num?)?.toDouble() ?? 0.0,
      pop: (json['pop'] as num?)?.toDouble() ?? 0.0,
      clouds: (json['clouds'] as num?)?.toDouble() ?? 0.0,
      dew_point: (json['dew_point'] as num?)?.toDouble() ?? 0.0,
      uvi: (json['uvi'] as num?)?.toDouble() ?? 0.0,
      wind_deg: (json['wind_deg'] as num?)?.toDouble() ?? 0.0,
      wind_gust: (json['wind_gust'] as num?)?.toDouble() ?? 0.0,
      wind_speed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
      feels_like: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      weather: (json['weather'] as List<dynamic>?)
              ?.map(
                  (e) => HourlyWeatherItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$HourlyItemToJson(HourlyItem instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'pressure': instance.pressure,
      'temp': instance.temp,
      'humidity': instance.humidity,
      'dew_point': instance.dew_point,
      'wind_speed': instance.wind_speed,
      'wind_deg': instance.wind_deg,
      'wind_gust': instance.wind_gust,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
      'feels_like': instance.feels_like,
      'weather': instance.weather,
    };
