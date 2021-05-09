import 'package:flutter/material.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/widgets/place_card.dart';
import 'package:travel_app/widgets/small_card.dart';
import 'package:travel_app/constants.dart';

class PlacesSlider extends StatefulWidget {
  final List<LandMark> places;
  const PlacesSlider(this.places);

  @override
  _PlacesSliderState createState() => _PlacesSliderState();
}

class _PlacesSliderState extends State<PlacesSlider> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 260,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  },
                  controller: PageController(viewportFraction: 1, initialPage: 0),
                  itemCount: widget.places.length,
                  itemBuilder: (context, index) =>
                      PlaceCard(landMark: widget.places[index], index: index, indexLen: widget.places.length)),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    demoPlaces.length, (index) => buildDotNav(index: index)),
              ),
            )
          ],
        ),
      );
  }
  AnimatedContainer buildDotNav({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentSlider == index ? 24 : 6,
      decoration: BoxDecoration(
          color: currentSlider == index
              ? AppColors.kPrimaryColor
              : AppColors.kPrimaryColor.withAlpha(70),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
