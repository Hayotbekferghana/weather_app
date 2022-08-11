import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather_app/api/models/one_call/hourly/hourly_item.dart';

import 'daily/daily_item.dart';

part 'one_call_data.g.dart';

@JsonSerializable()
class OneCallData {
  @JsonKey(defaultValue: 0.0, name: "lat")
  double lat;

  @JsonKey(defaultValue: 0.0, name: "lon")
  double lon;

  @JsonKey(defaultValue: "", name: "timezone")
  String timezone;

  @JsonKey(defaultValue: 0.0, name: "timezone_offset")
  double timezone_offset;

  @JsonKey(defaultValue: [], name: "daily")
  List<DailyItem> dailyItem;

  @JsonKey(defaultValue: [], name: "hourly")
  List<HourlyItem> hourlyItem;


  OneCallData({
    required this.lat,
    required this.timezone,
    required this.lon,
    required this.timezone_offset,
    required this.dailyItem,
    required this.hourlyItem
  });

  factory OneCallData.fromJson(Map<String, dynamic>json)=>
      _$OneCallDataFromJson(json);

  Map<String, dynamic> toJson()=> _$OneCallDataToJson(this);

  @override
  String toString() =>
      """
      "lat":$lat,
      "lon": $lon,
      "timezone": $timezone,
      "timezone_offset": $timezone_offset,
      hourly: $hourlyItem,
      daily: $dailyItem
      """;
}
