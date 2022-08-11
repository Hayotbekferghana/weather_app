// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyItem _$DailyItemFromJson(Map<String, dynamic> json) => DailyItem(
      sunrise: json['sunrise'] as int? ?? 0,
      sunset: json['sunset'] as int? ?? 0,
      dt: json['dt'] as int? ?? 0,
      moon_phase: (json['moon_phase'] as num?)?.toDouble() ?? 0.0,
      moonrise: json['moonrise'] as int? ?? 0,
      pressure: (json['pressure'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['humidity'] as num?)?.toDouble() ?? 0.0,
      pop: (json['pop'] as num?)?.toDouble() ?? 0.0,
      clouds: (json['clouds'] as num?)?.toDouble() ?? 0.0,
      dew_point: (json['dew_point'] as num?)?.toDouble() ?? 0.0,
      uvi: (json['uvi'] as num?)?.toDouble() ?? 0.0,
      wind_deg: (json['wind_deg'] as num?)?.toDouble() ?? 0.0,
      wind_gust: (json['wind_gust'] as num?)?.toDouble() ?? 0.0,
      wind_speed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
      feelsLikeItem: DailyFeelsLikeItem.fromJson(
          json['feels_like'] as Map<String, dynamic>),
      temp: DailyTempItem.fromJson(json['temp'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => DailyWeatherItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DailyItemToJson(DailyItem instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moon_phase': instance.moon_phase,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dew_point,
      'wind_speed': instance.wind_speed,
      'wind_deg': instance.wind_deg,
      'wind_gust': instance.wind_gust,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
      'temp': instance.temp,
      'feels_like': instance.feelsLikeItem,
      'weather': instance.weather,
    };
