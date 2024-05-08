import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  await _validatePermission(true);
  var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
  return position;
}

Future<Placemark> getPlacemarkByPosition(Position position) async {
  var placemarkList =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  if (placemarkList.isEmpty) {
    throw Exception(
        'Address not found with position lat ${position.latitude} and long ${position.longitude}.');
  }
  return placemarkList[0];
}

String formatPlacemarkAddress(Placemark place) {
  return '${place.street}, '
      '${place.subLocality}, '
      '${place.postalCode}, '
      '${place.subAdministrativeArea}, '
      '${place.country}';
}

_validatePermission(bool tryAgain) async {
  var serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  var permission = await Geolocator.checkPermission();
  switch (permission) {
    case LocationPermission.denied:
      if (tryAgain) {
        await Geolocator.requestPermission();
        return _validatePermission(false);
      }
      return Future.error('Location permissions are denied.');
    case LocationPermission.deniedForever:
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    default:
  }
}
