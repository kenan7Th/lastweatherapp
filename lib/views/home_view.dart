import 'package:flutter/material.dart';
import 'package:lastweatherapp/views/search_page.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //HomeView({Key? key}) : super(key: key);

  // void updateUi() {
  //   setState(() {});
  // }

  WeatherMoldel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      body: weatherData == null ? const NoWeatherBody() : WeatherInfoBody(),
    );
  }
}
