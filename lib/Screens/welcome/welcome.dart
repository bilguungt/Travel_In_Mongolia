import 'package:flutter/material.dart';
import 'package:travel_app/Screens/welcome/widgets/welcome_image.dart';
import 'package:travel_app/size_config.dart';

class WelcomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          WelcomeImage(),

        ],
      ),
    );
  }
}
