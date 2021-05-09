import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/Screens/home/widgets/liked_button.dart';
import 'package:travel_app/constants.dart';

import '../../../utils/util.dart';

class GridPlaceCard extends StatelessWidget {
  const GridPlaceCard(
      {Key key, @required this.landMark, @required this.tapEvent})
      : super(key: key);

  final LandMark landMark;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapEvent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Hero(
                tag: landMark.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    landMark.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                fontSize: 12,
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
                        size: 15,
                        isReadOnly: true,
                        color: AppColors.kRatingStarColor,
                        borderColor: AppColors.kRatingStarColor,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
