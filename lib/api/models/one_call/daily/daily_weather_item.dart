import 'package:json_annotation/json_annotation.dart';

part 'daily_weather_item.g.dart';

@JsonSerializable()
class DailyWeatherItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: "", name: 'main')
  String main;

  @JsonKey(defaultValue: "", name: 'description')
  String description;

  @JsonKey(defaultValue: "", name: 'icon')
  String icon;

  DailyWeatherItem({
    required this.main,
    required this.icon,
    required this.description,
    required this.id,
  });

  factory DailyWeatherItem.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherItemFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherItemToJson(this);

  @override
  String toString() => """
      id: $id,
      main: $main,
      description: $description,
      icon: $icon,
      """;
}