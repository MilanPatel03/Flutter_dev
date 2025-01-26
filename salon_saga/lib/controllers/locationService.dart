import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';


class LocationService {
  static Future<void> getCurrentLocation(Function(String) onLocationUpdated) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      print("Location Denied");
      LocationPermission askForLocation = await Geolocator.requestPermission();
    }

    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print("Latitude=${currentPosition.latitude.toString()}");
    print("Longitude=${currentPosition.longitude.toString()}");

    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(
      currentPosition.latitude,
      currentPosition.longitude,
    );

    if (placemarks.isNotEmpty) {
      String location = "${placemarks[0].locality}, ${placemarks[0].administrativeArea}";
      onLocationUpdated(location);  // Update the location in UI
    }
  }
}