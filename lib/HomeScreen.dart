import 'package:flutter/material.dart';
import 'package:foxhole_artillery/Global/Global.dart';
import 'package:foxhole_artillery/Header.dart';
import 'package:foxhole_artillery/ArtilleryButtons.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  //root widget for home screen
  @override
  Widget build(BuildContext context) {
    
    //pass the instance of the root widget to the Global variable fot future uses.
    Global.homeScreen = this;
    
    return new Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        new SafeArea(
          child: new Column(
            children: <Widget>[
              new Header(),
              new ArtilleryButtons(),
            ],
          ),
        )
      ],
    );
  }
}
