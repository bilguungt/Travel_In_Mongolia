import 'package:flutter/material.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/Screens/home/widgets/place_card.dart';
import 'package:travel_app/constants.dart';

class PopularPlaces extends StatefulWidget {
  const PopularPlaces({
    Key key,
  }) : super(key: key);

  @override
  _PopularPlacesState createState() => _PopularPlacesState();
}

class _PopularPlacesState extends State<PopularPlaces> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
                controller: PageController(viewportFraction: 1, initialPage: 0),
                itemCount: demoPlaces.length,
                itemBuilder: (context, index) =>
                    PlaceCard(landMark: demoPlaces[index])),
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
