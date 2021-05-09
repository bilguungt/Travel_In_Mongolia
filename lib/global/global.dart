import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class App {
  static bool isLoggedIn = false;
  static String email = '';

  Position currentPosition;
  static String currentLocation;
  static Placemark currentPlace;
  static LatLng latLatPosition;
  static double lat;
  static double long;
}
