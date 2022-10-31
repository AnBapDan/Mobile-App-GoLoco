import 'package:geolocator/geolocator.dart';

class Location {
  static Future<bool> hasPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      } else if (permission == LocationPermission.deniedForever) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  static Future<bool> checkStatus() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<bool> locationActivated() async {
    bool perms = await hasPermissions();
    if (!perms) {
      return false;
    }

    bool activated = await checkStatus();
    if (!activated) {
      return false;
    }
    return true;
  }
}
