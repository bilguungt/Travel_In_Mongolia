import 'package:flutter/material.dart';

class LandMark {
  final int id;
  final String name;
  final String description;
  final String location;
  final String image;
  final double rating;
  final int rCount;
  final double longitude;
  final double latitude;



  LandMark({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.location,
    @required this.image,
    @required this.rating,
    this.rCount,
    @required this.longitude,
    @required this.latitude

  });
}


// demo places

List<LandMark> demoPlaces = [
  LandMark(
      id: 1,
      name: 'Genghis Khan Equestrian Statue',
      description:'The Genghis Khan Statue is a 40 m tall statue of Genghis Khan on horseback, on the bank of the Tuul River at Tsonjin Boldog (54 km east of the Mongolian capital Ulan Bator), where according to legend, he found a golden whip. The statue is symbolically pointed east towards his birthplace. It is on top of the Genghis Khan Statue Complex, a visitor centre, itself 10 m tall, with 36 columns representing the 36 khans from Genghis to Ligdan Khan.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Chinggis_Square.jpg',
      rating: 4,
      rCount: 123,
      latitude: 47.91900569425359,
      longitude: 106.91762141336423,
  ),
  LandMark(
      id: 2,
      name: 'Gorkhi-Terelj National Park',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/29/b0/9c/terelj-national-park.jpg?w=800&h=-1&s=1',
      rating: 3,
      rCount: 157,
      latitude: 47.987811369170096,
      longitude:  107.46192556530556),
  LandMark(
      id: 3,
      name: 'Genghis Khan Statue',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Ulaanbaatar , Mongolia',
      image: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/fe/97/18/genghis-khan-statue-complex.jpg?w=800&h=500&s=1',
      rating: 5,
      rCount: 13,
      latitude: 47.80911404187405,
      longitude: 107.52935080543668
  ),

];
