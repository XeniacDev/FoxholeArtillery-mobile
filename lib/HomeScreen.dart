import 'package:flutter/material.dart';
import 'package:foxhole_artillery/Sections/EnemyDetails.dart';
import 'package:foxhole_artillery/Sections/FriendlyDetails.dart';
import 'package:foxhole_artillery/Global/Global.dart';
import 'package:foxhole_artillery/Sections/Header.dart';
import 'package:foxhole_artillery/Sections/ArtilleryButtons.dart';
import 'package:foxhole_artillery/Sections/OutputDetails.dart';
import 'package:foxhole_artillery/Theme/SizeConfig.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  double horizantalPaddingBy30 = 7.29 * SizeConfig.imageSizeMultiplier; // 30

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
            child: new GestureDetector(
          // To drop down the keyboard when the screen
          onTap: () => FocusScope.of(context).unfocus(),
          child: new Column(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Header(),
                  new ArtilleryButtons(),
                  new Padding(
                    // left:30.0, right: 30.0,top: 15
                    padding: EdgeInsets.only(
                        left: horizantalPaddingBy30,
                        right: horizantalPaddingBy30,
                        top: 1.88 * SizeConfig.heightMultiplier),
                    child: new Divider(color: new Color(0xff272626)),
                  ),
                  new EnemyDetails(),
                  new FriendlyDetails(),
                  new Padding(
                    padding: EdgeInsets.only(
                        // left:30.0, right: 30.0,top: 20
                        left: horizantalPaddingBy30,
                        right: horizantalPaddingBy30,
                        top: 2.50 * SizeConfig.heightMultiplier),
                    child: new Divider(color: new Color(0xff272626)),
                  ),
                  new OutputDetails()
                ],
              ),
            ],
          ),
        ))
      ],
    );
  }
}
