import 'package:http/http.dart' show Client;
import '../model/WeatherData.dart'; 

class MapApi {
  static const _apiKey = '394e53ae1efaff3d70931390542a2d77';
  static const _endpoint = 'http://api.openweathermap.org/data/2.5/'; 

  double lon, lat;
  Client client = Client();

  static MapApi _instance;
  static MapApi getInstance() => _instance ??= MapApi();

  String _apiCall({double lat, double lon,}) {
    //forecast?id=524901&APPID={YOUR API KEY}';
    return _endpoint + "/weather?lat=" + lat.toString() + "&lon=" + lon.toString() + "&APPID=" + _apiKey + "&units=metric";    
  }

  getWeather({double lat, double lon}) async {
    var response = await client.get(
      Uri.encodeFull(_apiCall(lat: lat, lon: lon)),
      headers: {
        'Accept': 'application/json'
      }
    );

    return WeatherData.deserialize(response.body);
  }
}