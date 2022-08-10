import 'package:json_annotation/json_annotation.dart';

part 'sys_item.g.dart';

@JsonSerializable()
class SysItem {
  @JsonKey(defaultValue: 0, name: 'type')
  int type;

  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: 0, name: 'sunrise')
  int sunrise;

  @JsonKey(defaultValue: 0, name: 'sunset')
  int sunset;

  @JsonKey(defaultValue: "", name: 'country')
  String country;

  SysItem({
    required this.sunset,
    required this.sunrise,
    required this.country,
    required this.id,
    required this.type,
  });

  factory SysItem.fromJson(Map<String, dynamic> json) =>
      _$SysItemFromJson(json);

  Map<String, dynamic> toJson() => _$SysItemToJson(this);

  @override
  String toString() => """
      type: $type,
      id: $id,
      country: $country,
      sunrise: $sunrise,
      sunset: $sunset
      """;
}
