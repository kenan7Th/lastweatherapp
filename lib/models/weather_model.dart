import 'package:flutter/material.dart';

class WeatherMoldel {
  String cityName;
  String countryName;
  String date;
  String weatherStateName;
  String icon;
  double avgTemp;
  double maxTemp;
  double minTemp;

  WeatherMoldel(
      {required this.cityName,
      required this.countryName,
      required this.date,
      required this.weatherStateName,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.icon});

  factory WeatherMoldel.fromJason(dynamic data) {
    var jasonNameDate = data["location"];
    var jasonData = data["forecast"]["forecastday"][0]["day"];
    var jasonWeatherStateAndIcon = jasonData["condition"];

    return WeatherMoldel(
      cityName: jasonNameDate["name"],
      countryName: jasonNameDate["country"],
      date: jasonNameDate["localtime"],
      weatherStateName: jasonWeatherStateAndIcon["text"],
      icon: jasonWeatherStateAndIcon["icon"],
      avgTemp: jasonData["avgtemp_c"],
      maxTemp: jasonData["maxtemp_c"],
      minTemp: jasonData["mintemp_c"],
    );
  }
  String? GetWeatherStateIcon() {
    if (weatherStateName == "Sunny" || weatherStateName == "Clear") {
      return "assets/icons/113.png";
    } else if (weatherStateName == "Partly cloudy") {
      return "assets/icons/116.png";
    } else if (weatherStateName == "Cloudy" || weatherStateName == "Overcast") {
      return "assets/icons/119.png";
    } else if (weatherStateName == "Mist") {
      return "assets/icons/143.png";
    } else if (weatherStateName.contains("Fog")) {
      return "assets/icons/248.png";
    } else if (weatherStateName.contains("rain")) {
      return "assets/icons/308.png";
    } else if (weatherStateName.contains("snow")) {
      return "assets/icons/338.png";
    } else if (weatherStateName.contains("Thundery")) {
      return "assets/icons/200.png";
    } else if (weatherStateName == "Ice pellets") {
      return "assets/icons/350.png";
    }
    return "assets/icons/113.png";
  }

  MaterialColor? getThemeColor() {
    if (weatherStateName == "Sunny" || weatherStateName == "Clear") {
      return Colors.orange;
    } else if (weatherStateName == "Cloudy" ||
        weatherStateName == "Overcast" ||
        weatherStateName == "Partly cloudy") {
      return Colors.blueGrey;
    } else if (weatherStateName == "Mist" || weatherStateName.contains("Fog")) {
      return Colors.grey;
    } else if (weatherStateName.contains("rain")) {
      return Colors.lightBlue;
    } else if (weatherStateName.contains("snow") ||
        weatherStateName == "Ice pellets") {
      return Colors.grey;
    } else if (weatherStateName.contains("Thundery")) {
      return Colors.yellow;
    }
    return Colors.orange;
  }
}
//Thundery
// String toString() {
//     // TODO: implement toString
//     return "avgtemp = $avgTemp \n maxtemp = $maxTemp \n mintemp = $minTemp \n at date $date";
//   }