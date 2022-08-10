import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as h;
import 'package:my_weather_app/api/models/current_weather.dart';
import 'package:my_weather_app/utils/constants.dart';

class ApiProvider {

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
      print(response.body);
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
      print(response.body);
      if(response.statusCode == 200){
        var jsonMap = jsonDecode(response.body);
        return CurrentWeather.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      print("error: $e !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      throw Exception(e);
    } finally{}
  }

}
