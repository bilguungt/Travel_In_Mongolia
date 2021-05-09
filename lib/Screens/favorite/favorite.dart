import 'package:flutter/material.dart';
import 'package:travel_app/Models/Hotel.dart';
import 'package:travel_app/Models/LandMark.dart';
import 'package:travel_app/Models/Restaurant.dart';
import 'package:travel_app/Screens/home/widgets/places_categoris.dart';
import 'package:travel_app/Screens/home/widgets/recommended_places.dart';
import 'package:travel_app/widgets/app_bar.dart';
import 'package:travel_app/widgets/comment_card.dart';
import 'package:travel_app/widgets/list_card.dart';

import '../../constants.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  TabController _tabController;
  List<Tab> _tabList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.BackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.BackgroundColor,
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text('LandMark',
                      style: TextStyle(color: AppColors.kPrimaryColor))),
              Tab(
                  child: Text('Hotel',
                      style: TextStyle(color: AppColors.kPrimaryColor))),
              Tab(
                  child: Text('Restaurant',
                      style: TextStyle(color: AppColors.kPrimaryColor))),
            ],
          ),
          title: Text('Таалагдсан',
              style: TextStyle(color: AppColors.kPrimaryColor)),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                itemCount: demoPlaces.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListCard(place: demoPlaces[index]);
                }),
            ListView.builder(
                itemCount: demoHotels.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListCard(place: demoHotels[index]);
                }),
            ListView.builder(
                itemCount: demoRestaurant.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListCard(place: demoRestaurant[index]);
                }),
          ],
        ),
      ),
    );
  }
}
