import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/Screens/detail/detail_screen.dart';
import 'package:travel_app/utils/util.dart';

import '../constants.dart';

class PlaceCard extends StatefulWidget {
  final LandMark landMark;
  final int index;
  final int indexLen;

  const PlaceCard({@required this.landMark, this.index, this.indexLen});

  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    place: widget.landMark,
                    index: widget.index,
                    indexLen: widget.indexLen,
                    type: PlaceType.landMark,
                  )),
        );
      },
      child: Hero(
        tag: widget.landMark.image,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(widget.landMark.image), fit: BoxFit.cover),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 2,
            //     blurRadius: 10,
            //     offset: Offset(3, 6), // changes position of shadow
            //   ),
            // ],
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.landMark.name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Row(
                  children: [
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: 5,
                      rating: widget.landMark.rating,
                      size: 20,
                      isReadOnly: true,
                      color: AppColors.kRatingStarColor,
                      borderColor: AppColors.kRatingStarColor,
                    ),
                    Text('(123)', style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
