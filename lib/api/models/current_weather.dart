import 'package:json_annotation/json_annotation.dart';

import 'package:my_weather_app/api/models/clouds_item.dart';
import 'package:my_weather_app/api/models/coord_item.dart';
import 'package:my_weather_app/api/models/main_item.dart';
import 'package:my_weather_app/api/models/sys_item.dart';
import 'package:my_weather_app/api/models/weather_item.dart';
import 'package:my_weather_app/api/models/wind_item.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
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

  @JsonKey(name: 'clouds')
  CloudsItem cloudsItem;

  @JsonKey(defaultValue: [], name: 'weather')
  List<WeatherItem> weatherItem;

  CurrentWeather({
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

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);

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

Map e = {
  "coord": {
    "lon": 69.2163,
    "lat": 41.2646,
  },
  "weather": [
    {
      "id": 801,
      "main": "Clouds",
      "description": "few clouds",
      "icon": "02d",
    }
  ],
  "base": "stations",
  "main": {
    "temp": 303.12,
    "feels_like": 301.47,
    "temp_min": 303.12,
    "temp_max": 303.12,
    "pressure": 1010,
    "humidity": 23
  },
  "visibility": 10000,
  "wind": {
    "speed": 3.09,
    "deg": 250,
  },
  "clouds": {"all": 20},
  "dt": 1660108169,
  "sys": {
    "type": 1,
    "id": 9016,
    "country": "UZ",
    "sunrise": 1660091220,
    "sunset": 1660141812
  },
  "timezone": 18000,
  "id": 1512569,
  "name": "Tashkent",
  "cod": 200
};
