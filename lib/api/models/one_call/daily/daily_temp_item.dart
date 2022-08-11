import 'package:json_annotation/json_annotation.dart';

part 'daily_temp_item.g.dart';

@JsonSerializable()
class DailyTempItem {
  @JsonKey(defaultValue: 0.0, name: "day")
  double day;

  @JsonKey(defaultValue: 0.0, name: "min")
  double min;

  @JsonKey(defaultValue: 0.0, name: "max")
  double max;

  @JsonKey(defaultValue: 0.0, name: "night")
  double night;

  @JsonKey(defaultValue: 0.0, name: "eve")
  double eve;

  @JsonKey(defaultValue: 0.0, name: "morn")
  double morn;

  DailyTempItem({
    required this.day,
    required this.eve,
    required this.max,
    required this.min,
    required this.morn,
    required this.night,
  });

  factory DailyTempItem.fromJson(Map<String, dynamic> json) =>
      _$DailyTempItemFromJson(json);

  Map<String, dynamic> toJson()=> _$DailyTempItemToJson(this);

  @override
  String toString()=>
      """
      day: $day,
      eve: $eve,
      max: $max,
      min: $min,
      morn: $morn,
      night: $night,
      """;
}
