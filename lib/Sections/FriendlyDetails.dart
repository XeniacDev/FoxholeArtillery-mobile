import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:foxhole_artillery/Global/Global.dart';

class FriendlyDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FriendlyDetailsState();
}

class FriendlyDetailsState extends State<FriendlyDetails> {
  @override
  Widget build(BuildContext context) {
    //a row with some padding to get friendly information from user
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
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
                            color: new Color(0xff686868), fontSize: 13.5)),
                  ),
                ),
              ),
              // <<==================================================================

              new SizedBox(
                width: 7,
              ),

              //second TextField to get friendly azimuth ==================================>>
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
