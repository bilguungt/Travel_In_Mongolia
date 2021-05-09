import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/global/global.dart';
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/util.dart';
import 'package:travel_app/widgets/app_bar.dart';
import 'package:travel_app/widgets/magic_circle_icon_button.dart';

import '../../constants.dart';
import '../../Models/directions_model.dart';
import '../../Models/directions_repository.dart';

class LocationScreenTest extends StatefulWidget {
  final LatLng orig;
  final LatLng dest;

  const LocationScreenTest({Key key, this.orig, this.dest}) : super(key: key);
  @override
  _LocationScreenTestState createState() => _LocationScreenTestState();
}

class _LocationScreenTestState extends State<LocationScreenTest> {
  CameraPosition _initialCameraPosition;
  Set<Marker> _markers = {};
  Position _currentPosition;
  LatLng latLatPosition;
  String _currentAddress;

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        latLatPosition = LatLng(position.latitude, position.longitude);

         _initialCameraPosition = CameraPosition(target: latLatPosition, zoom: 14);
      });
    }).catchError((e) {
      print(e);
    });
  }

  Marker _origin;
  Marker _destination;
  Directions _info;

  void _MapCreated(GoogleMapController _googleMapController) {
    setState(() {
      for(var el in demoPlaces)
      _markers.add(
        Marker(markerId: MarkerId(el.name) , position: LatLng(el.latitude , el.longitude) )
      );
    });
  }
  @override
  void initState() {
    _getCurrentLocation();
    if(widget.dest != null)
    _addMarker(widget.orig , widget.dest);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: GoogleMap(

              myLocationEnabled: true,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight - 200,),
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: _MapCreated,
              markers: {
                if (_origin != null) _origin,
                if (_destination != null) _destination
              },
              polylines: {
                if (_info != null)
                  Polyline(
                    polylineId: const PolylineId('overview_polyline'),
                    color: Colors.deepPurpleAccent,
                    width: 5,
                    points: _info.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
              },
            ),
          ),


          if (_info != null)
            Positioned(
              top: 115.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info.totalDistance}, ${_info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                ),
              ),
            ),

          Positioned(
            bottom: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MagicIconCircleButton(
                  press: () {},
                  icon: Icons.hotel,
                  pColor: AppColors.kPrimaryColor,
                  isHaveShadow: true,
                  size: CircleButtonShape.medium,
                ),
                SizedBox(width: 50,),
                MagicIconCircleButton(
                  press: () {},
                  icon: Icons.restaurant_menu,
                  pColor: AppColors.kWeatherColor,
                  isHaveShadow: true,
                  size: CircleButtonShape.medium,
                ),
                SizedBox(width: 50,),

                MagicIconCircleButton(
                  press: () {},
                  icon: Icons.local_attraction_rounded,
                  pColor: AppColors.kRatingStarColor,
                  isHaveShadow: true,
                  size: CircleButtonShape.medium,
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }

  void _addMarker(LatLng orig , LatLng dest) async {


      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: dest,
        );
        print('sdasd ${_destination.position}');
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: orig, destination: dest);
      setState(() => _info = directions);
    }
  }

