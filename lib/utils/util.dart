import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';

final cardInfoDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: AppColors.kCardInfoBG.withOpacity(0.6),
);

final likedWidgetDecoration =
    BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white);

class PlaceType {
  static const String landMark = "landMark";
  static const String restaurant = "restaurant";
  static const String hotel = "hotel";
}

class CircleButtonShape {
  static const double small = 46;
  static const double medium = 60;
  static const double large = 80;
}

const double kSmallMargin = 10;
const double kMediumMargin = kSmallMargin * 2;
const double kLargeMargin = kSmallMargin * 3;
