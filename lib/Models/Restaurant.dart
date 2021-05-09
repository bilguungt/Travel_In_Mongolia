import 'package:flutter/material.dart';

class Restaurant {
  final int id;
  final String name;
  final String description;
  final String location;
  final String image;
  final double rating;
  final int rCount;
  final double longtitude;
  final double laititude;
  final String webSite;


  Restaurant( {
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.location,
    @required this.image,
    @required this.rating,
    this.webSite,
    this.rCount,
    this.longtitude,
    this.laititude

  });
}


// demo places

List<Restaurant> demoRestaurant = [
  Restaurant(
      id: 1,
      name: 'Modern Nomads',
      description:'The Genghis Khan Statue is a 40 m tall statue of Genghis Khan on horseback, on the bank of the Tuul River at Tsonjin Boldog (54 km east of the Mongolian capital Ulan Bator), where according to legend, he found a golden whip. The statue is symbolically pointed east towards his birthplace. It is on top of the Genghis Khan Statue Complex, a visitor centre, itself 10 m tall, with 36 columns representing the 36 khans from Genghis to Ligdan Khan.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://mongolia-guide.com/uploads/main/ABOUT%20MONGOLIA/FOOD/huushuur.jpg',
      rating: 5,
      rCount: 43,
      laititude: 47.919341609217565,
      longtitude:  107.91754493569286
  ),
  Restaurant(
      id: 2,
      name: 'Yuna koream restaurant',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://interior.mn/wp-content/uploads/2020/06/YU1.jpg',
      rating: 3,
      rCount: 157,
      laititude: 48.91951609217565,
      longtitude:  106.91754493569286),
  Restaurant(
      id: 3,
      name: 'little sheep mongolia',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/MB3CKWITYVBP5BB2AEU5KRWTEQ.jpg',
      rating: 5),

];
