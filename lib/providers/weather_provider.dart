import 'package:flutter/widgets.dart';

import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherMoldel? _weatherData;

  set weatherData(WeatherMoldel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherMoldel? get weatherData => _weatherData;
}
