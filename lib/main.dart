import 'package:flutter/material.dart';
import 'package:lastweatherapp/providers/weather_provider.dart';
import 'package:lastweatherapp/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.orange
            : Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor(),
        //brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
