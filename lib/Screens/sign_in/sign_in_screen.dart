import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_bar.dart';
import 'package:travel_app/widgets/search_button.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'Нэвтрэх'),
      body: Body(),
      backgroundColor: Colors.white,
    );
  }
}
