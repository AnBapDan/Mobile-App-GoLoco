import 'package:location/location.dart';

class MapRepository {
  Future<LocationData> getCurrentLocation() async {
    return await Location().getLocation();
  }
}
