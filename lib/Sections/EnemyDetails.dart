import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:foxhole_artillery/Global/Global.dart';

class EnemyDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EnemyDetailsState();
}

class EnemyDetailsState extends State<EnemyDetails> {
  @override
  Widget build(BuildContext context) {

    //a row with some padding to get enemy information from user
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
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
          padding: const EdgeInsets.only(top: 5.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  height: 55,
                  decoration: new BoxDecoration(
                      color: new Color(0xff121212),
                      borderRadius: BorderRadius.circular(5)),
                  child: new TextField(
                    keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
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
                            color: new Color(0xff686868), fontSize: 13.5)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  height: 55,
                  decoration: new BoxDecoration(
                      color: new Color(0xff121212),
                      borderRadius: BorderRadius.circular(5)),
                  child: new TextField(
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
                    cursorColor: Colors.white,
                    style: new TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enemy Azimuth",
                        hintStyle: new TextStyle(
                            color: new Color(0xff686868), fontSize: 13.5)),
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
