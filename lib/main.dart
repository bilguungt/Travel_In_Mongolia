import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/Screens/welcome/welcome.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/global/routes.dart' as router;
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/func.dart';

import 'Screens/home/home.dart';
import 'global/global.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefences = await SharedPreferences.getInstance();
  App.email = prefences.getString('email');
  App.isLoggedIn = prefences.getBool('isLoggedIn');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.kPrimaryColor,
        scaffoldBackgroundColor: AppColors.kBackgroundColor,
      //   textTheme: GoogleFonts.merriweatherTextTheme(Theme.of(context).textTheme),
      ),
      home: Func.isNullEmpty(App.email) ? WelcomeScreen() : HomeScreen(),
    );
  }
}

