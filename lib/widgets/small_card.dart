import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/Screens/detail/detail_screen.dart';
import 'package:travel_app/utils/util.dart';

import '../constants.dart';

class SmallCard extends StatefulWidget {
  final dynamic place;

  /// todo res , hotel nemegdene
  final int index;
  final int indexLen;
  const SmallCard({@required this.place, this.index, this.indexLen});

  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    place: widget.place,
                    index: widget.index,
                    indexLen: widget.indexLen,

                    /// todo hoolnii gazar buudlaas hamaarch type uur yvuulna
                    type: PlaceType.hotel,
                  )),
        );
      },
      child: AspectRatio(
        aspectRatio: 2 / 2.43,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(widget.place.image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(3, 6), // changes position of shadow
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
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
                  widget.place.name,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Row(
                  children: [
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: 5,
                      rating: widget.place.rating,
                      size: 20,
                      isReadOnly: true,
                      color: AppColors.kRatingStarColor,
                      borderColor: AppColors.kRatingStarColor,
                    ),
                    Text('(123)',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
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
