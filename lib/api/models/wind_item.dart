import 'package:json_annotation/json_annotation.dart';
part 'wind_item.g.dart';

@JsonSerializable()
class WindItem {
  @JsonKey(defaultValue: 0.0, name: 'speed')
  double speed;

  @JsonKey(defaultValue: 0, name: 'deg')
  double deg;

  WindItem({
    required this.deg,
    required this.speed,
  });

  factory WindItem.fromJson(Map<String, dynamic> json) =>
      _$WindItemFromJson(json);

  Map<String, dynamic> toJson() => _$WindItemToJson(this);

  @override
  String toString() => """
      speed: $speed,
      deg: $deg,
      """;
}
