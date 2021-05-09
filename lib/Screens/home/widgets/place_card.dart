import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/Screens/home/widgets/liked_button.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/utils/util.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key key, @required this.landMark}) : super(key: key);

  final dynamic landMark;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(landMark.image), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: cardInfoDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      landMark.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    LikedButton()
                  ],
                ),
                SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (v) {},
                  starCount: 5,
                  rating: landMark.rating,
                  size: 20,
                  isReadOnly: true,
                  color: AppColors.kRatingStarColor,
                  borderColor: AppColors.kRatingStarColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
