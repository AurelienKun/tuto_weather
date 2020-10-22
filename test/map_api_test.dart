import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import '../lib/api/MapApi.dart';

main() {
  test('MapApi getWeather method', () async {
    final double lat = 48.83;
    final double lon = 2.24;
    final mapJson = {
      "coord": {"lon": 2.24, "lat": 48.83},
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "base": "stations",
      "main": {
        "temp": 19.15,
        "feels_like": 18.25,
        "temp_min": 18,
        "temp_max": 20,
        "pressure": 1012,
        "humidity": 77
      },
      "visibility": 10000,
      "wind": {"speed": 3.6, "deg": 230},
      "clouds": {"all": 90},
      "dt": 1603370902,
      "sys": {
        "type": 1,
        "id": 6550,
        "country": "FR",
        "sunrise": 1603347745,
        "sunset": 1603385291
      },
      "timezone": 7200,
      "id": 6457370,
      "name": "Boulogne",
      "cod": 200
    };
    final mapApi = MapApi.getInstance();
    mapApi.client = MockClient((request) async {
      return Response(json.encode(mapJson), 200);
    });

    final weatherItem = await mapApi.getWeather(lat: lat, lon: lon);

    expect(weatherItem.name, 'Boulogne');
    expect(weatherItem.temp, 19.15);
  });
}
