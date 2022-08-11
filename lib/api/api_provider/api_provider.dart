import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as h;
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:my_weather_app/api/models/one_call/one_call_data.dart';
import 'package:my_weather_app/utils/constants.dart';

class ApiProvider {
  /// get current weather info
  static Future<CurrentWeather> getCurrentWeatherByText({
    required String searchText,
  }) async {
    try {
      Map<String, String> queryParams = {
        "appId": API_KEY,
        "q": searchText,
      };
      Response response = await h.get(
        Uri.https(
          BASE_URL,
          "/data/2.5/weather",
          queryParams,
        ),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return CurrentWeather.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    } finally {}
  }

  static Future<CurrentWeather> getCurrentWeatherByLatLong({
    required double lat,
    required double long,
  }) async {
    try {
      Map<String, dynamic> queryParams = {
        "lat": lat.toString(),
        "lon": long.toString(),
        "appId": API_KEY,
      };
      Response response = await h.get(
        Uri.https(
          BASE_URL,
          "/data/2.5/weather",
          queryParams,
        ),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return CurrentWeather.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint(
          "error: $e !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      throw Exception(e);
    } finally {}
  }

  /// get daily and hourly weather info

  static Future<OneCallData> getOneCallDataByLatlong({
    required double latitude,
    required double longitude,
  }) async {
    try {
      var queryParams = {
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appId": API_KEY,
        "units": "metric",
        "exclude": "minutely,current",
      };
      Response response = await h.get(
        Uri.https(BASE_URL, "/data/2.5/onecall", queryParams),
      );
      if(response.statusCode == 200){
        var jsonMap = jsonDecode(response.body);
        return OneCallData.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    } finally {}
  }
}
