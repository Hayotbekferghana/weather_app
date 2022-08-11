import 'package:json_annotation/json_annotation.dart';

part 'main_item.g.dart';
@JsonSerializable()
class MainItem {
  @JsonKey(defaultValue: 0.0, name: 'temp')
  double temp;

  @JsonKey(defaultValue: 0.0, name: 'feels_like')
  double feels_like;

  @JsonKey(defaultValue: 0.0, name: 'temp_min')
  double temp_min;

  @JsonKey(defaultValue: 0.0, name: 'temp_max')
  double temp_max;

  @JsonKey(defaultValue: 0.0, name: 'pressure')
  double pressure;

  @JsonKey(defaultValue: 0.0, name: 'humidity')
  double humidity;

  MainItem({
    required this.feels_like,
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.temp_max,
    required this.temp_min,
  });

  factory MainItem.fromJson(Map<String, dynamic> json) =>
      _$MainItemFromJson(json);

  Map<String, dynamic> toJson() => _$MainItemToJson(this);

  @override
  String toString() => """
    temp: $temp,
    feels_like: $feels_like,
    temp_min: $temp_min,
    temp_max: $temp_max,
    pressure: $pressure,
    humidity: $humidity,  
  """;
}
