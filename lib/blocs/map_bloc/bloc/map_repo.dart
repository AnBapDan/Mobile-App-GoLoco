import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vector_math/vector_math_64.dart';

class MapRepository {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  double getAngle(Position actual, LatLng goal) {
    double x = cos(goal.latitude) * sin((actual.longitude - goal.longitude));
    double y = cos(actual.latitude) * sin(goal.latitude) -
        sin(actual.latitude) *
            cos(goal.latitude) *
            cos((actual.longitude - goal.longitude));
    double angle = degrees(atan2(x, y));
    if (angle < 0) {
      angle = angle + 360;
    }
    return angle;
  }

  double calculateDistance(Position actual, LatLng goal) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((goal.latitude - actual.latitude) * p) / 2 +
        cos(actual.latitude * p) *
            cos(goal.latitude * p) *
            (1 - cos((goal.longitude - actual.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a)) * 1000;
  }
}
