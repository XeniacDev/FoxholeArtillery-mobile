import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:foxhole_artillery/Theme/SizeConfig.dart';

class FriendlyDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FriendlyDetailsState();
}

class FriendlyDetailsState extends State<FriendlyDetails> {
  double horizantalPaddingBy30 = 7.29 * SizeConfig.imageSizeMultiplier; // 30
  double horizantalPaddingBy15 = 3.64 * SizeConfig.imageSizeMultiplier; // 15
  double containerHeight50 = 6.90 * SizeConfig.heightMultiplier; // 55
  double fontSize13o5 = 1.69 * SizeConfig.textMultiplier; // 13.5

  static TextEditingController friendlyDistanceController;
  static TextEditingController friendlyAzimuthController;

  @override
  void initState() {
    super.initState();
    friendlyDistanceController = new TextEditingController();
    friendlyAzimuthController = new TextEditingController();
  }

  @override
  void dispose() {
    friendlyDistanceController.dispose();
    friendlyAzimuthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //a row with some padding to get friendly information from user
    return Padding(
      // top: 25.0, left: 30.0, right: 30.0
      padding: EdgeInsets.only(
          top: 3.20 * SizeConfig.heightMultiplier,
          left: horizantalPaddingBy30,
          right: horizantalPaddingBy30),
      child: new Column(children: <Widget>[
        new Row(
          children: <Widget>[
            // To Friendly Artillery text
            new Text("To Friendly Artillery",
                style: new TextStyle(color: new Color(0xffEAEAEA)))
          ],
        ),

        //first TextField to get friendly distance ===================================>>
        new Padding(
          padding:
              EdgeInsets.only(top: 0.64 * SizeConfig.heightMultiplier), // 5
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
                    controller: friendlyDistanceController,
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
                        hintText: "Friendly Distance",
                        hintStyle: new TextStyle(
                            color: new Color(0xff686868),
                            fontSize: fontSize13o5)), // 13.5
                  ),
                ),
              ),
              // <<==================================================================

              new SizedBox(
                width: 1.70 * SizeConfig.imageSizeMultiplier, // 7
              ),

              //second TextField to get friendly azimuth ==================================>>
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
                    controller: friendlyAzimuthController,
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
                        hintText: "Friendly Azimuth",
                        hintStyle: new TextStyle(
                            color: new Color(0xff686868),
                            fontSize: fontSize13o5)), // 13.5
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
