import 'package:flutter/material.dart';
import 'package:foxhole_artillery/Global/Global.dart';
import 'package:foxhole_artillery/Theme/SizeConfig.dart';

class ArtilleryButtons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ArtilleryButtonsState();
}

class ArtilleryButtonsState extends State<ArtilleryButtons> {
  double horizantalPaddingBy30 = 7.29 * SizeConfig.imageSizeMultiplier; // 30
  double buttonContainerWidth = 17.03 * SizeConfig.imageSizeMultiplier; // 70
  double buttonContainerHeight = 8.78 * SizeConfig.heightMultiplier; // 70
  double buttonImageWidth = 12.77 * SizeConfig.imageSizeMultiplier; // 52.5
  double buttonImageHeight = 6.58 * SizeConfig.heightMultiplier; // 52.5
  //widget class for artillery types buttons
  // TODO: Use Color Class
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizantalPaddingBy30), // 30
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
              width: buttonContainerWidth, // 70
              height: buttonContainerHeight, // 70
              child: new Container(
                width: buttonImageWidth, // 52.5
                height: buttonImageHeight, // 52.5
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
                width: buttonContainerWidth, // 70
                height: buttonContainerHeight, // 70
                child: new Container(
                    width: buttonImageWidth, // 52.5
                    height: buttonImageHeight, // 52.5
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
              width: buttonContainerWidth, // 70
              height: buttonContainerHeight, // 70
              child: new Container(
                width: buttonImageWidth, // 52.5
                height: buttonImageHeight, // 52.5
                child: new Image.asset("assets/images/howitzerKit_icon.png"),
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
              width: buttonContainerWidth, // 70
              height: buttonContainerHeight, // 70
              child: new Container(
                width: buttonImageWidth, // 52.5
                height: buttonImageHeight, // 52.5
                child: new Image.asset("assets/images/mortar_icon.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
