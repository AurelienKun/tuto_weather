import 'package:location/location.dart';
import '../model/MyLocationData.dart';

class LocationApi {
  Location _location = Location();

  static LocationApi _instance;
  static LocationApi getInstance() => _instance ??= LocationApi();

  Future<MyLocationData> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return MyLocationData(0, 0);
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return MyLocationData(0, 0);
      }
    }

    final locationData = await _location.getLocation();
    return MyLocationData(locationData.latitude, locationData.longitude);
  }
}
