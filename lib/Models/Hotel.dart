import 'package:flutter/material.dart';

class Hotel {
  final int id;
  final String name;
  final String description;
  final String location;
  final String image;
  final double rating;
  final int rCount;
  final double longitude;
  final double latitude;
  final String webSite;
  final int phone;


  Hotel( {
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.location,
    @required this.image,
    @required this.rating,
    this.webSite,
    this.rCount,
    @required this.longitude,
    @required this.latitude,
    this.phone
  });
}


// demo places

List<Hotel> demoHotels = [
  Hotel(
      id: 1,
      name: 'Shagrilla hotel',
      description:'The Genghis Khan Statue is a 40 m tall statue of Genghis Khan on horseback, on the bank of the Tuul River at Tsonjin Boldog (54 km east of the Mongolian capital Ulan Bator), where according to legend, he found a golden whip. The statue is symbolically pointed east towards his birthplace. It is on top of the Genghis Khan Statue Complex, a visitor centre, itself 10 m tall, with 36 columns representing the 36 khans from Genghis to Ligdan Khan.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://pix10.agoda.net/hotelImages/119/1197844/1197844_16051108350042215464.jpg?s=1024x768',
      rating: 5,
      rCount: 43,
      latitude: 47.91951609217565,
      longitude:  107.91754493569286
  ),
  Hotel(
      id: 2,
      name: 'Kenpinski hotel',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/6f/f3/74/exterior.jpg?w=900&h=-1&s=1',
      rating: 3,
      rCount: 157,

      latitude: 47.91951609217565,
      longitude:  107.91754493569286
  ),
  Hotel(
      id: 3,
      name: 'Ulaanbaatar hotel',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://media-cdn.tripadvisor.com/media/photo-s/10/30/ff/c4/ulaanbaatar-hotel.jpg',
      rating: 5),

];
