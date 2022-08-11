import 'package:json_annotation/json_annotation.dart';

part 'weather_item.g.dart';
@JsonSerializable()
class WeatherItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: "", name: 'main')
  String main;

  @JsonKey(defaultValue: "", name: 'description')
  String description;

  @JsonKey(defaultValue: "", name: 'icon')
  String icon;

  WeatherItem({
    required this.id,
    required this.description,
    required this.icon,
    required this.main,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) =>
      _$WeatherItemFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherItemToJson(this);

  @override
  String toString() => """
      id: $id,
      main: $main,
      description: $description,
      icon: $icon,
      """;
}
