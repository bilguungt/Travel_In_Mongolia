import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_app/Models/Hotel.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/Models/Restaurant.dart';
import 'package:travel_app/Screens/ListScreen/listScreen.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/global/global.dart';
import 'package:travel_app/utils/func.dart';
import 'package:travel_app/widgets/app_bar.dart';
import 'package:travel_app/widgets/row_text_with_button.dart';
import 'package:travel_app/widgets/search_button.dart';
import 'package:travel_app/widgets/small_slider.dart';
import 'package:travel_app/global/routes.dart';

import '../../widgets/place_card.dart';
import '../../widgets/places_slider.dart';

import '../../Models/directions_model.dart';
import '../../Models/directions_repository.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Position _currentPosition;
  LatLng _originPosition;
  String _currentAddress;
  Directions _info;

  getCurrentLocation() async {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {

      _currentPosition = position;
      _originPosition = LatLng(position.latitude, position.longitude);
      getAddressFromLatLng();
      print( "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}");

    }).catchError((e) {
      print(e);
    });


  }



  getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude);

      Placemark place = placemarks[0];
      print(place);
      _currentAddress = place.locality;
      App.currentLocation = "${place.locality}, ${place.postalCode}, ${place.country} , ${place.street} , ${place.name}";
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'Nearby',
          actions: [SearchButton()]),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Places
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10, right: 20, left: 20, ),
                    child: Row(
                      children: [
                        Text(
                          'Аялаж болох газрууд',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListScreen(
                                  title: 'Аялаж болох газрууд',
                                  places: demoPlaces,
                                )),
                              );
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(fontSize: 14),
                            ))
                      ],
                    ),
                  ),
                  PlacesSlider(demoPlaces),
                ],
              ),
              /// Restaurants
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10, right: 20, left: 20, ),
                    child: Row(
                      children: [
                        Text(
                          'Хоолны газрууд',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListScreen(
                                  title: 'Хоолны газрууд',
                                  places: demoPlaces,
                                )),
                              );
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(fontSize: 14),
                            ))
                      ],
                    ),
                  ),
                  SmallSlider(demoRestaurant),
                ],
              ),

              /// Hotels
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10, right: 20, left: 20, ),
                    child: Row(
                      children: [
                        Text(
                          'Зочид буудлууд',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListScreen(
                                  title: 'Зочид буудлууд',
                                  places: demoHotels,
                                )),
                              );
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(fontSize: 14),
                            ))
                      ],
                    ),
                  ),
                  SmallSlider(demoHotels),
                ],
              ),

              SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}
