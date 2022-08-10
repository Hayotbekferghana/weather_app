// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainItem _$MainItemFromJson(Map<String, dynamic> json) => MainItem(
      feels_like: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['humidity'] as num?)?.toDouble() ?? 0.0,
      pressure: (json['pressure'] as num?)?.toDouble() ?? 0.0,
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      temp_max: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
      temp_min: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$MainItemToJson(MainItem instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
