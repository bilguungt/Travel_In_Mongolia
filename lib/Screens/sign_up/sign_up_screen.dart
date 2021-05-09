import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_bar.dart';
import 'package:travel_app/widgets/back_button_appBar.dart';
import 'components/body.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'Бүртгүүлэх',
          leading: BackButtonMenu()
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
