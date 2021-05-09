import 'package:flutter/material.dart';
import 'package:travel_app/Screens/welcome/widgets/welcome_text.dart';
import 'package:travel_app/size_config.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/mongolia.jpeg'), fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ])),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              WelcomeText()
            ],),
      ),
    );
  }
}
