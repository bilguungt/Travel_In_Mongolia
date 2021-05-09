import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackButtonMenu extends StatelessWidget {
  const BackButtonMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(CupertinoIcons.arrow_left ,color: Colors.black,),
      onPressed: () {
        Navigator.pop(context);
      }
    );
  }
}