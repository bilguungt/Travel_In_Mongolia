import 'package:flutter/material.dart';
import 'package:travel_app/Screens/home/home.dart';
import 'package:travel_app/Screens/welcome/widgets/welcome_button.dart';
import 'package:travel_app/constants.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mongolian\n" + "Travel Trips",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: AppColors.TextColor
            ),
          ),

          SizedBox(height: 25),

          Text(
            'You can browse, save and get information of Mongolian LandMarks and their nearby vacation , restaurant , hotels information ',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.TextColor
            ),
          ),

          SizedBox(height: 40),

          WelcomeButton(
            tapEvent: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          )
        ],
      ),
    );
  }
}