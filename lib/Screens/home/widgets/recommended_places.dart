import 'package:flutter/material.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/Screens/home/widgets/grid_place_card.dart';

import '../../../responsive.dart';

class RecommendedPlaces extends StatelessWidget {
  final List<dynamic> place;
  const RecommendedPlaces({this.place,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: place.length,
          scrollDirection: Axis.vertical,

          itemBuilder: (context, index) {
            return GridPlaceCard(landMark: place[index]);
            }
          ),
    );
  }
}