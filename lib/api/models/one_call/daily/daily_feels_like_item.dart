import 'package:json_annotation/json_annotation.dart';

part 'daily_feels_like_item.g.dart';

@JsonSerializable()
class DailyFeelsLikeItem {
  @JsonKey(defaultValue: 0.0, name: "day")
  double day;

  @JsonKey(defaultValue: 0.0, name: "night")
  double night;

  @JsonKey(defaultValue: 0.0, name: "eve")
  double eve;

  @JsonKey(defaultValue: 0.0, name: "morn")
  double morn;

  DailyFeelsLikeItem({
    required this.day,
    required this.eve,
    required this.morn,
    required this.night,
  });

  factory DailyFeelsLikeItem.fromJson(Map<String, dynamic> json) =>
      _$DailyFeelsLikeItemFromJson(json);

  Map<String, dynamic> toJson()=> _$DailyFeelsLikeItemToJson(this);

  @override
  String toString()=>
      """
      day: $day,
      eve: $eve,
      morn: $morn,
      night: $night,
      """;
}
