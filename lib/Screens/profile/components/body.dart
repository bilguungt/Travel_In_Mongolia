import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/Screens/add_place/add_place_screen.dart';
import 'package:travel_app/Screens/home/home.dart';
import 'package:travel_app/Screens/sign_in/sign_in_screen.dart';
import 'package:travel_app/global/global.dart';
import 'package:travel_app/utils/func.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {

  Future logOut() async {
    SharedPreferences prefences = await SharedPreferences.getInstance();
    prefences.clear();
    App.isLoggedIn = false;
    App.email = null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          // Text(Func.isNullEmpty(App.email) ? App.email : 'bilguun1@gmail.com') ,
          Text(App.email) ,

          ProfileMenu(
            text: "Газар нэмэх",
            icon: "assets/icons/add.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddPlaceScreen(
                    )),
              );
            },
          ),
          ProfileMenu(
            text: "Миний сэтгэгдлүүд",
            icon: "assets/icons/favourite.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              logOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}


