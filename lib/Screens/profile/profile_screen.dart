import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_bar.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({this.fromLogin});

  final bool fromLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'Хэрэглэгч'),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
