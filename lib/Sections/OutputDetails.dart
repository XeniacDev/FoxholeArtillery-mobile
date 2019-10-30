import "package:flutter/material.dart";
import 'package:foxhole_artillery/Sections/FriendlyDetails.dart';
import 'package:foxhole_artillery/Sections/EnemyDetails.dart';
import 'package:foxhole_artillery/Global/Global.dart';
import "package:foxhole_artillery/Global/Calculators/Helper.dart";
import 'package:foxhole_artillery/Theme/SizeConfig.dart';

class OutputDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new OutputDetailsState();
}

class OutputDetailsState extends State<OutputDetails> {
  double horizantalPaddingBy30 = 7.29 * SizeConfig.imageSizeMultiplier; // 30
  double horizantalPaddingBy10 = 2.43 * SizeConfig.imageSizeMultiplier; // 10
  double fontSize12 = 1.54 * SizeConfig.textMultiplier; // 12
  double fontSize19 = 2.38 * SizeConfig.textMultiplier; // 19

  @override
  Widget build(BuildContext context) {
    // top: 15, left: 30.0, right: 30.0
    return new Padding(
      padding: EdgeInsets.only(
          top: 1.92 * SizeConfig.heightMultiplier,
          left: horizantalPaddingBy30,
          right: horizantalPaddingBy30),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  flex: 10,
                  child: new DataTable(
                    horizontalMargin: 0,
                    headingRowHeight: 5,
                    columnSpacing: 5,
                    columns: [
                      DataColumn(
                          label: new Text("DISTANCE",
                              style: new TextStyle(
                                  color: new Color(0xff737373),
                                  fontSize: fontSize12))),
                      DataColumn(
                          label: new Text("AZIMUTH",
                              style: new TextStyle(
                                  color: new Color(0xff737373),
                                  fontSize: fontSize12)))
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(
                          new Text(
                              Global.enemyCoordinates["distance"].toString() +
                                  "m",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: fontSize19)),
                        ),
                        DataCell(
                          new Text(
                              Global.enemyCoordinates["azimuth"].toString() +
                                  "°",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: fontSize19)),
                        ),
                      ])
                    ],
                  ),
                  // child: new Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     // outputs Titles ========================================>>

                  //     // !Distance
                  //     // new ListTile(
                  //     //   title: new Text("DISTANCE",
                  //     //       style: new TextStyle(
                  //     //           color: new Color(0xff737373),
                  //     //           fontSize: fontSize12)),
                  //     //   subtitle: new Text(
                  //     //       Global.enemyCoordinates["distance"].toString() +
                  //     //           "m",
                  //     //       style: new TextStyle(
                  //     //           color: Colors.white, fontSize: fontSize19)),
                  //     // ),

                  //     // ! Azimuth
                  //     // new ListTile(
                  //     //   title: new Text("AZIMUTH",
                  //     //       style: new TextStyle(
                  //     //           color: new Color(0xff737373),
                  //     //           fontSize: fontSize12)),
                  //     //   subtitle: new Text(
                  //     //       Global.enemyCoordinates["distance"].toString() +
                  //     //           "m",
                  //     //       style: new TextStyle(
                  //     //           color: Colors.white, fontSize: fontSize19)),
                  //     // ),

                  //     // new Row(
                  //     //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     //   children: <Widget>[
                  //     //     new Text("DISTANCE",
                  //     //         style: new TextStyle(
                  //     //             color: new Color(0xff737373),
                  //     //             fontSize: fontSize12)), // 12
                  //     //     new Text("AZIMUTH",
                  //     //         style: new TextStyle(
                  //     //             color: new Color(0xff737373),
                  //     //             fontSize: fontSize12)) // 12
                  //     //   ],
                  //     // ),
                  //     // <<==================================================

                  //     // new Padding(
                  //     //   padding:
                  //     //       EdgeInsets.only(left: horizantalPaddingBy10), // 10
                  //     //   child: new Row(
                  //     //     mainAxisAlignment: MainAxisAlignment.start,
                  //     //     children: <Widget>[
                  //     //       //output numbers ================>>
                  //     //       new Row(
                  //     //         children: <Widget>[
                  //     //           new Text(
                  //     //               Global.enemyCoordinates["distance"]
                  //     //                       .toString() +
                  //     //                   "m",
                  //     //               style: new TextStyle(
                  //     //                   color: Colors.white,
                  //     //                   fontSize: fontSize19)), // 19
                  //     //           new Padding(
                  //     //             padding: EdgeInsets.only(
                  //     //                 left: 6.69 *
                  //     //                     SizeConfig
                  //     //                         .imageSizeMultiplier), // 27.5
                  //     //             child: new Text(
                  //     //                 Global.enemyCoordinates["azimuth"]
                  //     //                         .toString() +
                  //     //                     "°",
                  //     //                 style: new TextStyle(
                  //     //                     color: Colors.white,
                  //     //                     fontSize: fontSize19)), // 19
                  //     //           )
                  //     //         ],
                  //     //       )
                  //     //       //<<============================
                  //     //     ],
                  //     //   ),
                  //     // )
                  //   ],
                  // ),
                )
              ],
            ),
          ),
          new SizedBox(
            width: horizantalPaddingBy10, // 10
          ),

          //Calculate Button to get user entered numbers from TextFields ==============================>>
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new RaisedButton(
                  onPressed: () async {
                    Helper.currentRadioTitle = Global.whatSelected;

                    if (Helper.currentRadioTitle.isEmpty) {
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        backgroundColor: new Color(0xff191919),
                        content: new Text(Helper.errorList["artillerySelect"],
                            style: new TextStyle(color: Colors.redAccent)),
                        duration: new Duration(seconds: 3),
                      ));
                    } else if (EnemyDetailsState
                            .enemyDistanceController.text.isEmpty ||
                        EnemyDetailsState.enemyAzimuthController.text.isEmpty ||
                        FriendlyDetailsState
                            .friendlyDistanceController.text.isEmpty ||
                        FriendlyDetailsState
                            .friendlyAzimuthController.text.isEmpty) {
                      Scaffold.of(context).showSnackBar(new SnackBar(
                          backgroundColor: new Color(0xff191919),
                          content: new Text(Helper.errorList["emptyFields"],
                              style: new TextStyle(color: Colors.redAccent))));
                    } else if (!Helper.isValid(
                        EnemyDetailsState.enemyDistanceController.text,
                        EnemyDetailsState.enemyAzimuthController.text,
                        FriendlyDetailsState.friendlyDistanceController.text,
                        FriendlyDetailsState.friendlyAzimuthController.text)) {
                      Scaffold.of(context).showSnackBar(new SnackBar(
                          backgroundColor: new Color(0xff191919),
                          content: new Text(Helper.errorList["sameCoords"],
                              style: new TextStyle(color: Colors.redAccent))));
                    } else {
                      Helper.calcData(
                          double.parse(
                              EnemyDetailsState.enemyDistanceController.text),
                          double.parse(
                              EnemyDetailsState.enemyAzimuthController.text),
                          double.parse(FriendlyDetailsState
                              .friendlyDistanceController.text),
                          double.parse(FriendlyDetailsState
                              .friendlyAzimuthController.text));
                      Global.homeScreen.setState(() => null);
                    }
                    Helper.currentError = "";
                  },
                  color: new Color(0xffFFA32B),
                  child: new Text("CALCULATE",
                      style: new TextStyle(color: Colors.white)),
                )
              ],
            ),
          )
          // <<=================================================================================
        ],
      ),
    );
  }
}
