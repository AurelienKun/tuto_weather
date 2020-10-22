import 'package:flutter/material.dart';
import 'package:tuto_weather/UI/weather.dart';
import '../api/MapApi.dart';
import '../model/WeatherData.dart';
import '../api/LocationApi.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData _weatherData;
  DateTime _update;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<Null> getCurrentLocation() async {
    LocationApi locationApi = LocationApi.getInstance();
    final location = await locationApi.getLocation();

    if (location != null) {
      loadWeather(
          lat: location.lat, lon: location.lon, update: location.lastUpdated);
    }
    return null;
  }

  loadWeather({double lat, double lon, DateTime update}) async {
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat, lon: lon);
    setState(() {
      this._weatherData = data;
      this._update = update;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.blue.shade900,
        onRefresh: getCurrentLocation,
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            _weatherData != null
                ? Weather(weatherData: _weatherData)
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
                      valueColor: AlwaysStoppedAnimation(Colors.orange),
                    ),
                  ),
            Center(
                child: _update == null
                    ? Text("Aucune donnée pour l'instant")
                    : Text(
                        "Dernière mise à jour: ${_update.toIso8601String()}"))
          ],
        ),
      ),
    );
  }
}
