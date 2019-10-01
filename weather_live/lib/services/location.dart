import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitute;

  Future<void> getCurrentLocation() async {
    try {
      Position pos = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = pos.latitude;
      longitute = pos.longitude;
    } catch (e) {
      print('Location not available');
    }
  }
}