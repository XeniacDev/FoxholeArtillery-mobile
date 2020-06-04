import "package:flutter/material.dart";
import "package:foxhole_artillery/Global/Global.dart";
import 'package:foxhole_artillery/Theme/SizeConfig.dart';

class Header extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HeaderState();
}

class HeaderState extends State<Header> {
  double horizantalPaddingBy30 = 7.29 * SizeConfig.imageSizeMultiplier; // 30

  //header image and the text on it
  @override
  Widget build(BuildContext context) {
    return new Stack(alignment: Alignment.bottomCenter, children: [
      //header image with a gradient on it.
      new Container(
        child: new Image.asset("assets/images/overlay_wallpaper.jpg"),
      ),

      //selected artillery type text
      new Container(
        // bottom: 17.5, left: 30, right: 30
        padding: EdgeInsets.only(
            bottom: 2.19 * SizeConfig.heightMultiplier,
            left: horizantalPaddingBy30,
            right: horizantalPaddingBy30),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text("Select Artillery Type",
                style: new TextStyle(color: new Color(0xffD1D1D1))),

            //to see if there is no selected artillery show the blank line in the header or if selected, show the artillery name.
            Global.whatSelected.isEmpty
                ? new Text("-",
                    style: new TextStyle(color: new Color(0xff6C6C6C)))
                : new Text(Global.whatSelected.toString() + " selected",
                    style: new TextStyle(color: new Color(0xff6C6C6C)))
          ],
        ),
      )
    ]);
  }
}
