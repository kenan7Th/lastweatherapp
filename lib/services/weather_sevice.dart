import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "99e1198d0097454bb2e232425231908";

  Future<WeatherMoldel?> getWeather({required String cityName}) async {
    WeatherMoldel? weatherMoldel;
    try {
      Uri uri =
          Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      http.Response response = await http.get(uri);

      Map<String, dynamic> data = jsonDecode(response.body);

      weatherMoldel = WeatherMoldel.fromJason(data);
    } catch (e) {}
    return weatherMoldel;
  }
}


// WeatherMoldel weatherMoldel = WeatherMoldel(
    //   cityName: nameDate["name"],
    //   date: nameDate["localtime"],
    //   weatherStateName: jasonData["condition"]["text"],
    //   avgTemp: jasonData["avgtemp_c"],
    //   maxTemp: jasonData["maxtemp_c"],
    //   minTemp: jasonData["mintemp_c"],
    //   icon: jasonData["condition"]["icon"],
    // );