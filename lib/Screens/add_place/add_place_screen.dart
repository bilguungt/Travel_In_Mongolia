import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_bar.dart';
import 'package:travel_app/widgets/back_button_appBar.dart';
import 'components/body.dart';

class AddPlaceScreen extends StatefulWidget {

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'Газар нэмэх',
          leading: BackButtonMenu()
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
