import 'package:flutter/material.dart';
import 'package:tuto_weather/UI/weather.dart';
import '../api/MapApi.dart';
import '../model/WeatherData.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData _weatherData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() {
    loadWeather(lat: 48.821234, lon: 2.295060);
  }

  loadWeather({double lat, double lon}) async {
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat, lon: lon);
    setState(() {
      this._weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _weatherData != null
            ? Weather(weatherData: _weatherData)
            : Center(
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
      ),
    );
  }
}
