import 'package:flutter/material.dart';
import 'package:foxhole_artillery/Global/Global.dart';

class ArtilleryButtons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ArtilleryButtonsState();
}

class ArtilleryButtonsState extends State<ArtilleryButtons> {
  //widget class for artillery types buttons
  // TODO: Use Color Class
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          //Field Artillery Button
          new GestureDetector(
            onTap: () {
              Global.handleSelection("Field Artillery");
            },
            child: new Container(
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                //to change the bgColor if selected or not.
                  color: Global.artilleryItems["Field Artillery"]
                      ? new Color(0xffFFA32B)
                      : new Color(0xff121212),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: 70,
              height: 70,
              child: new Container(
                height: 52.5,
                width: 52.5,
                child: new Image.asset("assets/images/fieldArtillery_icon.png"),
              ),
            ),
          ),

          //GunShip Button
          new GestureDetector(
            onTap: () {
              Global.handleSelection("GunShip");
            },
            child: new Container(
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  //to change the bgColor if selected or not.
                    color: Global.artilleryItems["GunShip"]
                        ? new Color(0xffFFA32B)
                        : new Color(0xff121212),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: 70,
                height: 70,
                child: Container(
                    width: 52.5,
                    height: 52.5,
                    child: new Image.asset("assets/images/gunship_icon.png"))),
          ),

          ////Howitzer Button
          new GestureDetector(
            onTap: () {
              Global.handleSelection("Howitzer");
            },
            child: new Container(
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                //to change the bgColor if selected or not.
                  color: Global.artilleryItems["Howitzer"]
                      ? new Color(0xffFFA32B)
                      : new Color(0xff121212),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: 70,
              height: 70,
              child: Container(
                child: new Image.asset("assets/images/howitzerKit_icon.png"),
                width: 52.5,
                height: 52.5,
              ),
            ),
          ),

          //Mortar Button
          new GestureDetector(
            onTap: () {
              Global.handleSelection("Mortar");
            },
            child: new Container(
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                //to change the bgColor if selected or not.
                  color: Global.artilleryItems["Mortar"]
                      ? new Color(0xffFFA32B)
                      : new Color(0xff121212),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: 70,
              height: 70,
              child: Container(
                child: new Image.asset("assets/images/mortar_icon.png"),
                width: 52.5,
                height: 52.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}