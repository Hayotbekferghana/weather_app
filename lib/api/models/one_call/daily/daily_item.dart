import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather_app/api/models/one_call/daily/daily_feels_like_item.dart';
import 'package:my_weather_app/api/models/one_call/daily/daily_temp_item.dart';
import 'package:my_weather_app/api/models/one_call/daily/daily_weather_item.dart';

part 'daily_item.g.dart';

@JsonSerializable()
class DailyItem {
  @JsonKey(defaultValue: 0, name: 'dt')
  int dt;

  @JsonKey(defaultValue: 0, name: 'sunrise')
  int sunrise;

  @JsonKey(defaultValue: 0, name: 'sunset')
  int sunset;

  @JsonKey(defaultValue: 0, name: 'moonrise')
  int moonrise;

  @JsonKey(defaultValue: 0.0, name: 'moon_phase')
  double moon_phase;

  @JsonKey(defaultValue: 0.0, name: 'pressure')
  double pressure;

  @JsonKey(defaultValue: 0.0, name: 'humidity')
  double humidity;

  @JsonKey(defaultValue: 0.0, name: 'dew_point')
  double dew_point;

  @JsonKey(defaultValue: 0.0, name: 'wind_speed')
  double wind_speed;

  @JsonKey(defaultValue: 0.0, name: 'wind_deg')
  double wind_deg;

  @JsonKey(defaultValue: 0.0, name: 'wind_gust')
  double wind_gust;

  @JsonKey(defaultValue: 0.0, name: 'clouds')
  double clouds;

  @JsonKey(defaultValue: 0.0, name: 'pop')
  double pop;

  @JsonKey(defaultValue: 0.0, name: 'uvi')
  double uvi;

  @JsonKey(name: 'temp')
  DailyTempItem temp;

  @JsonKey(name: 'feels_like')
  DailyFeelsLikeItem feelsLikeItem;

  @JsonKey(defaultValue: [], name: 'weather')
  List<DailyWeatherItem> weather;

  DailyItem({
    required this.sunrise,
    required this.sunset,
    required this.dt,
    required this.moon_phase,
    required this.moonrise,
    required this.pressure,
    required this.humidity,
    required this.pop,
    required this.clouds,
    required this.dew_point,
    required this.uvi,
    required this.wind_deg,
    required this.wind_gust,
    required this.wind_speed,
    required this.feelsLikeItem,
    required this.temp,
    required this.weather,
  });

  factory DailyItem.fromJson(Map<String, dynamic> json) =>
      _$DailyItemFromJson(json);

  Map<String, dynamic> toJson() => _$DailyItemToJson(this);

  @override
  String toString() => """
      dt: $dt,
      sunrise: $sunrise,
      sunset: $sunset,
      moonrise: $moonrise,
      moonset: $moonrise,
      moon_phase: $moon_phase,
      pressure: $pressure,
      humidity: $humidity,
      dew_point: $dew_point,
      wind_speed: $wind_speed,
      wind_deg: $wind_deg,
      wind_gust: $wind_gust,
      clouds: $clouds,
      pop: $pop,
      uvi: $uvi,
      feelsLikeItem: $feelsLikeItem
      temp: $temp
      weather: $weather
      """;
}
