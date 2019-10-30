import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:foxhole_artillery/Global/Global.dart';
import 'package:foxhole_artillery/Theme/SizeConfig.dart';

class EnemyDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EnemyDetailsState();
}

class EnemyDetailsState extends State<EnemyDetails> {
  double horizantalPaddingBy30 = 7.29 * SizeConfig.imageSizeMultiplier; // 30
  double horizantalPaddingBy15 = 3.64 * SizeConfig.imageSizeMultiplier; // 15
  double containerHeight50 = 6.90 * SizeConfig.heightMultiplier; // 55
  double fontSize13o5 = 1.69 * SizeConfig.textMultiplier; // 13.5

  static TextEditingController enemyDistanceController;
  static TextEditingController enemyAzimuthController;

  @override
  void initState() {
    super.initState();
    enemyDistanceController = new TextEditingController();
    enemyAzimuthController = new TextEditingController();
  }

  @override
  void dispose() {
    enemyDistanceController.dispose();
    enemyAzimuthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //a row with some padding to get enemy information from user
    return Padding(
      // top: 10.0, left: 30.0, right: 30.0
      padding: EdgeInsets.only(
          top: 1.25 * SizeConfig.heightMultiplier,
          left: horizantalPaddingBy30,
          right: horizantalPaddingBy30),
      child: new Column(children: <Widget>[
        new Row(
          children: <Widget>[
            // To Enemy position text
            new Text("To Enemy Position",
                style: new TextStyle(color: new Color(0xffEAEAEA)))
          ],
        ),

        //first TextField to get enemy distance ===================================>>
        new Padding(
          padding:
              EdgeInsets.only(top: 0.62 * SizeConfig.heightMultiplier), // 5
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizantalPaddingBy15), // 15
                  alignment: Alignment.center,
                  height: containerHeight50, // 55
                  decoration: new BoxDecoration(
                      color: new Color(0xff121212),
                      borderRadius: BorderRadius.circular(5)),
                  child: new TextField(
                    controller: enemyDistanceController,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    cursorColor: Colors.white,
                    style: new TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enemy Distance",
                        hintStyle: new TextStyle(
                            color: new Color(0xff686868),
                            fontSize: fontSize13o5)), // 13.5
                  ),
                ),
              ),
              // <<==================================================================

              new SizedBox(
                width: 7,
              ),

              //second TextField to get enemy azimuth ==================================>>
              new Expanded(
                child: new Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizantalPaddingBy15), // 15
                  alignment: Alignment.center,
                  height: containerHeight50, // 55
                  decoration: new BoxDecoration(
                      color: new Color(0xff121212),
                      borderRadius: BorderRadius.circular(5)),
                  child: new TextField(
                    controller: enemyAzimuthController,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                    cursorColor: Colors.white,
                    style: new TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enemy Azimuth",
                        hintStyle: new TextStyle(
                            color: new Color(0xff686868),
                            fontSize: fontSize13o5)), // 15
                  ),
                ),
              )
              // <<======================================================================
            ],
          ),
        )
      ]),
    );
  }
}
