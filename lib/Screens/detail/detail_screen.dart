import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:travel_app/Models/directions_model.dart';
import 'package:travel_app/Models/directions_repository.dart';
import 'package:travel_app/Models/model.dart';
import 'package:travel_app/Screens/ListScreen/listScreen.dart';
import 'package:travel_app/Screens/home/home.dart';
import 'package:travel_app/Screens/location/location_screen.dart';
import 'package:travel_app/Screens/sign_in/components/sign_form.dart';
import 'package:travel_app/global/global.dart';
import 'package:travel_app/utils/func.dart';
import 'package:travel_app/widgets/comment_card.dart';
import 'package:travel_app/widgets/custom_dialog_box.dart';
import 'package:travel_app/widgets/magic_circle_icon_button.dart';
import 'package:travel_app/widgets/row_text_with_button.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/util.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  final dynamic place;
  final int index;
  final int indexLen;
  final String type;


  /// todo landMark , res , hotel orj irne
  DetailScreen({
    this.place,
    this.index,
    this.indexLen,
    this.type,

    ///todo
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;
  List<Review> demoReview2 = [];
  FocusNode _focus = new FocusNode();
  WeatherFactory wf =  WeatherFactory("0ac1daaef977fd77e6782cae33b79b0a");
  Weather _data;

  final ScrollController _scrollController = ScrollController();

  Temperature temp;

  LatLng _originPosition;
  String _currentAddress;
  Directions _info;

  Future<String> getData() async {

    Weather weather = await wf.currentWeatherByLocation(widget.place.latitude, widget.place.longitude);
    setState(() {
      _data = weather;
       temp = _data.temperature;
    });
    return _data.toString();

  }

  getDirection() async {
      final directions = await DirectionsRepository()
          .getDirections(origin: App.latLatPosition, destination: _originPosition );
    setState(() => _info = directions);
  }
  @override
  void initState()  {
    getData();
    _originPosition = LatLng(widget.place.latitude, widget.place.longitude);
    getDirection();
    print("info: $_info");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          backgroundColor: AppColors.BackgroundColor,
          body: Stack(children: [
            /// detail
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                _buildSliverHead(),
                SliverToBoxAdapter(
                  child: _buildDetail(),
                )
              ],
            ),

            /// top <- , more  Button
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              child: SizedBox(
                /// Appbar constants
                height: kToolbarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },

                      /// back button
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 14, top: 9, bottom: 9, right: 4),
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          )),
                    ),

                    /// right button
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 15,
                    //   ),
                    //   child: Icon(
                    //     Icons.menu,
                    //     color: Colors.white,
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ]),
          floatingActionButton: _buildRatingStar(),
      ),
    );

  }



  Widget _buildRatingStar() {
    return Visibility(
      visible: _focus.hasFocus,
      child: Container(
        margin: const EdgeInsets.only(top: 700,left: 40.0 , right: 10, bottom: 0),
        alignment: Alignment.center,


        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.BackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.kPrimaryColor.withOpacity(0.3),
              blurRadius: 10.0,
              // has the effect of softening the shadow
              spreadRadius:
              2.0, // has the effect of extending the shadow
            ),
          ],
        ),
        height: 60.0,
        child: SmoothStarRating(
          onRated: (v) {},
          starCount: 5,
          size: 40,
          color: AppColors.kRatingStarColor,
          borderColor: AppColors.kRatingStarColor,
        ),
      ),
    );
  }
  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandedHeight,
        widget.place,
        roundedContainerHeight,
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
      color: AppColors.BackgroundColor,
      child: Column(
        children: <Widget>[
          _buildUserInfo(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Column(
              children: [
                /// 3 circle icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///1
                    Column(
                      children: [
                        MagicIconCircleButton(
                          press: () {},
                          icon: Icons.star,
                          pColor: AppColors.kRatingStarColor,
                          isHaveShadow: true,
                          size: CircleButtonShape.medium,
                        ),
                        SizedBox(
                          height: kSmallMargin,
                        ),
                        Text("${widget.place.rating}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("${widget.place.rCount} REVIEWS",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kSecondaryColor)),
                      ],
                    ),

                    ///2
                    Column(
                      children: [
                        MagicIconCircleButton(
                          press: () {
                            print('location pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                    currentTab: 1,
                                    dest: _originPosition,
                                    orig: App.latLatPosition,

                                )),
                            );
                          },
                          icon: Icons.location_on,
                          pColor: AppColors.kPrimaryColor,
                          isHaveShadow: true,
                          size: CircleButtonShape.medium,
                        ),
                        SizedBox(
                          height: kSmallMargin,
                        ),
                        Text(
                          "${_info?.totalDistance}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("LOCATION",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kSecondaryColor)),
                      ],
                    ),

                    ///3
                    Column(
                      children: [
                        MagicIconCircleButton(
                          press: () {},
                          icon: Icons.wb_sunny_outlined,
                          pColor: AppColors.kWeatherColor,
                          isHaveShadow: true,
                          size: CircleButtonShape.medium,
                        ),
                        SizedBox(
                          height: kSmallMargin,
                        ),
                        Text(
                          "$temp",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("WEATHER",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kSecondaryColor)),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: kMediumMargin),

                Text(widget.place.description, textAlign: TextAlign.justify),
                SizedBox(height: kSmallMargin),

                Divider(thickness: 1),

                /// review
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: RowTextWithButton(
                    title: "Аялагчдын сэтгэгдэл",
                    button: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListScreen(
                                      places: demoReview,
                                      type: 'review',
                                    )),
                          );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.kPrimaryColor),
                        )),
                  ),
                ),

                if (demoReview.length > 3) ...[
                  for (var el = 0; el < 3; el++)
                    CommentCard(review: demoReview[el]),
                ] else ...[
                  for (var el in demoReview) CommentCard(review: el),
                ],

                ///REVIEW COMMENT
                Padding(
                  padding: const EdgeInsets.only(bottom:  15.0 ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.BackgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kRatingStarColor.withOpacity(0.3),
                          blurRadius: 10.0,
                          // has the effect of softening the shadow
                          spreadRadius:
                              2.0, // has the effect of extending the shadow
                        ),
                      ],
                    ),
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.fromLTRB(14, 2, 2, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,

                            /// avatar
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                demoReview[0].avatar,
                                height: 40,
                              ),

                            ),
                          ),
                          /// write comment
                          Expanded(
                            flex: 6,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  focusNode: _focus,
                                  onTap: () { },
                                  cursorColor: AppColors.kRatingStarColor,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 12),
                                    hintText: "Сэтгэгдэл үлдээх...",
                                    hintStyle: TextStyle(
                                        color: AppColors.kPrimaryColor),
                                    isDense: true, // Added this
                                      ),
                                      style: TextStyle(
                                      height: 1,
                                      fontSize: 20,
                                      color: AppColors.kPrimaryColor),
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: GestureDetector(
                                onTap: ()   {
                                  if(Func.isNullEmpty(App.email)) {
                                    showDialog(context: context,
                                        builder: (BuildContext context){
                                          return (CustomDialogBox( title: 'Нэвтрэх', descriptions: SignForm(isFocused: true,fromWhere: 'detailScreen',), text: 'xaax', ));

                                        }
                                    );
                                  }
                                  /// todo else
                                    },
                                child: Icon(
                                  !_focus.hasFocus ? CupertinoIcons.chat_bubble : CupertinoIcons.arrow_right_circle_fill,
                                   color: !_focus.hasFocus ? AppColors.kRatingStarColor : AppColors.kPrimaryColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: kSmallMargin),

                /// map
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: RowTextWithButton(title: "Дэлгэрэнгүй хаяг"),
                ),
                SizedBox(height: kMediumMargin),

                /// map
                Container(
                  height: getProportionateScreenHeight(150),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.BackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage('assets/images/map.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// name
                Text(
                  widget.place.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "${widget.index + 1} of ${widget.indexLen} ${widget.type} ${widget.place.location} ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.favorite_border_rounded,
                size: 30,
                color: AppColors.kPrimaryColor,
              ),
              onPressed: () {
                print("info: $_info");

              })
        ],
      ),
    );
  }

  _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController?.position?.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}


bool validator() {
  /// todo  star bolon setgegled shalgana
}






class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  final dynamic _place;

  DetailSliverDelegate(
      this.expandedHeight, this._place, this.roundedContainerHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Hero(
          tag: _place.image,
          child: Image.network(_place.image,
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover,)

        ),

        /// detail items
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.BackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
