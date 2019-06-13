import "package:flutter/material.dart";
import "package:foxhole_artillery/Global/Global.dart";

class Header extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HeaderState();
}

class HeaderState extends State<Header> {
  //header image and the text on it
  //TODO: Use MediaQuery and Use Color Class
  @override
  Widget build(BuildContext context) {
    return new Stack(alignment: Alignment.bottomCenter, children: [

      //header image with a gradient on it.
      new Container(
        foregroundDecoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, new Color(0xff191919)]),
            border:
            new Border(bottom: BorderSide(color: new Color(0xff191919)))),
        child: new Image.asset("assets/images/foxhole_artillery_bg_noFade.jpg"),
      ),

      //selected artillery type text
      new Container(
        padding:
        const EdgeInsets.only(bottom: 20, top: 20, left: 30, right: 30),
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, new Color(0xff191919)])),
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