import 'package:location/location.dart';
import '../model/MyLocationData.dart';

class LocationApi {
  Location _location = Location();

  static LocationApi _instance;
  static LocationApi getInstance() => _instance ??= LocationApi();

  Future<bool> isLocalisationActivated() async {
    bool _serviceEnabled;
    _serviceEnabled = await _location.serviceEnabled();
    print("GPS service enabled: $_serviceEnabled");
    return _serviceEnabled;
  }

  Future<bool> isPermissionGranted() async {
    PermissionStatus _permissionGranted;

    _permissionGranted = await _location.hasPermission();
    bool granted = _permissionGranted == PermissionStatus.granted;
    print(
        "GPS permission granted: $granted (${_permissionGranted.toString()})");
    return granted;
  }

  Future<bool> isDeniedForever() async {
    PermissionStatus _permissionGranted;

    _permissionGranted = await _location.hasPermission();
    bool value = _permissionGranted == PermissionStatus.deniedForever;
    print(
        "GPS permission denied forever: $value (${_permissionGranted.toString()})");
    return value;
  }

  Future<MyLocationData> getLocation() async {
    bool service = await this.isLocalisationActivated();
    if (!service) {
      service = await _location.requestService();
    }

    bool permission = await this.isPermissionGranted();
    if (!permission) {
      var asking = await _location.requestPermission();
      permission = (asking == PermissionStatus.granted);
    }
    if (service && permission) {
      final locationData = await _location.getLocation();
      return MyLocationData(
          locationData.latitude, locationData.longitude, DateTime.now());
    }
    return null;
  }
}
