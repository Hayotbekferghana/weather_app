import 'package:json_annotation/json_annotation.dart';

import 'package:my_weather_app/api/models/clouds_item.dart';
import 'package:my_weather_app/api/models/coord_item.dart';
import 'package:my_weather_app/api/models/main_item.dart';
import 'package:my_weather_app/api/models/sys_item.dart';
import 'package:my_weather_app/api/models/weather_item.dart';
import 'package:my_weather_app/api/models/wind_item.dart';

part 'currently_weather.g.dart';

@JsonSerializable()
class CurrentlyWeather {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: 0, name: 'timezone')
  int timezone;

  @JsonKey(defaultValue: "", name: 'base')
  String base;

  @JsonKey(defaultValue: "", name: 'name')
  String name;

  @JsonKey(defaultValue: 0, name: 'cod')
  int cod;

  @JsonKey(defaultValue: 0, name: 'visibility')
  int visibility;

  @JsonKey(defaultValue: 0, name: 'dt')
  int dt;

  @JsonKey(name: 'sys')
  SysItem sys;

  @JsonKey(name: 'main')
  MainItem mainItem;

  @JsonKey(name: 'wind')
  WindItem windItem;

  @JsonKey(name: 'coord')
  CoordItem coordItem;

  @JsonKey(name: 'cloudsItem')
  CloudsItem cloudsItem;

  @JsonKey(name: 'weather')
  List<WeatherItem> weatherItem;

  CurrentlyWeather({
    required this.id,
    required this.weatherItem,
    required this.name,
    required this.visibility,
    required this.base,
    required this.cod,
    required this.coordItem,
    required this.dt,
    required this.mainItem,
    required this.sys,
    required this.timezone,
    required this.windItem,
    required this.cloudsItem,
  });

  factory CurrentlyWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentlyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentlyWeatherToJson(this);

  @override
  String toString() => """
    id: $id,
    timezone: $timezone,
    base: $base,
    name: $name,   
    cod: $cod,
    visibility: $visibility,
    sys: $sys,   
    mainItem: $mainItem,   
    windItem: $windItem,   
    coordItem: $coordItem,   
    weatherItem: $weatherItem,   
  """;
}
