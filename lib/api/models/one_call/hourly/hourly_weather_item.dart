import 'package:json_annotation/json_annotation.dart';
part 'hourly_weather_item.g.dart';
@JsonSerializable()
class HourlyWeatherItem{
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: "", name: 'main')
  String main;

  @JsonKey(defaultValue: "", name: 'description')
  String description;

  @JsonKey(defaultValue: "", name: 'icon')
  String icon;

  HourlyWeatherItem({
    required this.main,
    required this.icon,
    required this.description,
    required this.id,
  });

  factory HourlyWeatherItem.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherItemFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherItemToJson(this);

  @override
  String toString() => """
      id: $id,
      main: $main,
      description: $description,
      icon: $icon,
      """;
}