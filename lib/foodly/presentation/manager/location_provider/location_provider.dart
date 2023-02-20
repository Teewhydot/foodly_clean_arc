import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/welcome_screens/mainscreen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationProvider extends ChangeNotifier {
  double _lat = 0.0;
  double _long = 0.0;
  String appId = '1e2c66dbb32db6e904786288b45ded3e';
  String locationName = '';
  bool showSpinner = false;

  double get lat => _lat;

  String get location => locationName;

  double get long => _long;
  bool get spinner => showSpinner;

  void startSpinning() {
    showSpinner = true;
    notifyListeners();
  }

  void stopSpinning() {
    showSpinner = false;
    notifyListeners();
  }

  void setLocation(String location) {
    locationName = location;
    notifyListeners();
  }

  Future<void> determinePosition() async {
    startSpinning();
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        stopSpinning();
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          stopSpinning();
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        stopSpinning();
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      _lat = position.latitude;
      _long = position.longitude;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future getLocationName(BuildContext context) async {
    final nav = Navigator.of(context);
    final url = Uri.parse(
        'http://api.positionstack.com/v1/reverse?access_key=6a7674d0f66fec05fcb5dbc3d4f1af46&query=$lat,$long');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      locationName = decodedData['data'][0]['label'];
    } else {}
    notifyListeners();
    stopSpinning();
    nav.pushReplacement(MaterialPageRoute(builder: (context) {
      return const MainScreen();
    }));
  }
}
