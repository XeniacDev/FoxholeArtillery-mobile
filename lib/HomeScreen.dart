import 'package:flutter/material.dart';
import 'package:foxhole_artillery/EnemyDetails.dart';
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

    //main stack to put the different section together
    return new Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        new SafeArea(
          child: new Column(
            children: <Widget>[
              new Header(),
              new ArtilleryButtons(),
              new Padding(
                padding: const EdgeInsets.only(left:30.0, right: 30.0,top: 15),
                child: new Divider(color: new Color(0xff272626)),
              ),
              new EnemyDetails()
            ],
          ),
        )
      ],
    );
  }
}
