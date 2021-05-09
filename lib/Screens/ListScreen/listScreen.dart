import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_bar.dart';
import 'package:travel_app/widgets/comment_card.dart';
import 'package:travel_app/widgets/back_button_appBar.dart';
import 'package:travel_app/widgets/list_card.dart';
import 'package:travel_app/widgets/search_button.dart';
import 'package:travel_app/utils/util.dart';

class ListScreen extends StatefulWidget {
  final List<dynamic> places;
  final String type;

  const ListScreen({this.places, this.type, String title});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var el;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'Discover', leading: BackButtonMenu(), actions: [SearchButton()]),
      backgroundColor: Colors.white,
      body: Container(
        child:
        ListView.builder(
            itemCount: widget.places.length,
            scrollDirection: Axis.vertical,

            itemBuilder: (context, index) {
              switch (widget.type) {
                case 'review':
                  return CommentCard(review: widget.places[index]);
                default:
                  return ListCard(place: widget.places[index]);
              }
            }),
        // SingleChildScrollView(
        //   child: Column(children: [
        //     if(widget.type == 'review')
        //     for(el in widget.places)  CommentCard(review: el)
        //     else ListCard(landMark: el)
        //   ],),
        // )
      ),
    );
  }
}
