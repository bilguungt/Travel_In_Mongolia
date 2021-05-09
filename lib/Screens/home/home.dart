
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/Screens/dashboard/dashboard.dart';
import 'package:travel_app/Screens/favorite/favorite.dart';
import 'package:travel_app/Screens/location/location.dart';
import 'package:travel_app/Screens/location/location_screen.dart';
import 'package:travel_app/Screens/profile/profile_screen.dart';
import 'package:travel_app/Screens/sign_in/sign_in_screen.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/global/global.dart';
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/func.dart';

class HomeScreen extends StatefulWidget {
  final int currentTab;
  final LatLng orig;
  final LatLng dest;
  const HomeScreen({ this.currentTab, this.orig, this.dest});




  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<HomeScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen;
   int currentTab = 0;
   
  Future checkLoggedIn() async {
    SharedPreferences prefences = await SharedPreferences.getInstance();
    App.email = prefences.getString('email');
    App.isLoggedIn = prefences.getBool('isLoggedIn');
  }

  /// user location
  Position _currentPosition;
  LatLng latLatPosition;
  String _currentAddress;

  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        latLatPosition = LatLng(position.latitude, position.longitude);
        App.latLatPosition = latLatPosition;
        App.lat = position.latitude;
        App.long = position.longitude;
        print('aaaaa : ${App.latLatPosition}');
        _currentPosition = position;
        
        CameraPosition cameraPosition = CameraPosition(target: latLatPosition, zoom: 14);

            _getAddressFromLatLng();
        print( "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}");

      });
    }).catchError((e) {
      print(e);
    });
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        App.currentPlace = place;
        _currentAddress = place.locality;
        App.currentLocation = "${place.locality}, ${place.postalCode}, ${place.country} , ${place.street} , ${place.name}";
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    _getCurrentLocation();
    checkLoggedIn();
   if(widget.currentTab == 3) {
      currentScreen = ProfileScreen();
      currentTab = 3;
    }else if(widget.currentTab == 1) {
     currentScreen = LocationScreenTest(orig: widget.orig, dest: widget.dest);
     currentTab = 1;
   } else
   currentScreen = Dashboard();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            height: 75,
            width: double.infinity,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 20, offset: const Offset(0, 3), color: AppColors.kPrimaryColor.withAlpha(40))
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navItem(
                  icon:  Icon(Icons.home),
                  currTab: 0,
                ),
                navItem(
                  icon: Icon(CupertinoIcons.location_solid),
                  currTab: 1,
                ),
                navItem(
                  icon: Icon(CupertinoIcons.suit_heart_fill),
                  currTab: 2,
                ),
                navItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  currTab: 3,
                ),
              ],
            ),
          ),
          body: PageStorage(
            child: currentScreen,
            bucket: bucket,
          ),
      ),
    );
  }

  Widget navItem({Icon icon , int currTab}) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        IconButton(
          icon: icon,
          color: (currentTab == currTab) ? AppColors.kPrimaryColor : AppColors.kBackgroundColor,

          iconSize: 33,
          onPressed: () {
            setState(() {
              currentTab = currTab;
              switch(currTab) {
                case 0: currentScreen = Dashboard(); break;
                //
                case 1: currentScreen = LocationScreenTest(); break;
                //
                case 2: currentScreen = Favorite(); break;

                case 3: if(Func.isNullEmpty(App.email))   currentScreen = SignInScreen(); else currentScreen = ProfileScreen(); break;

              }
              });
          },
        ),
        Spacer(),
        Container(
          height: 4,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentTab == currTab ? AppColors.kPrimaryColor : Colors.transparent,
              boxShadow: [
                BoxShadow(blurRadius: 6, offset: const Offset(0, -2), color: currentTab == currTab  ? AppColors.kPrimaryColor : Colors.transparent)
              ]
          ),
        )
      ],
    );
  }
}
