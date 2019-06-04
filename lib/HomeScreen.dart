import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(
                      'assets/images/foxhole_artillery_bg.png'))),
        )
      ],
    );
  }
}
