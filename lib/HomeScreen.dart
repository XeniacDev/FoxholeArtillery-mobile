import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        new SafeArea(
          child: new Column(
            children: <Widget>[
              new Stack(alignment: Alignment.bottomCenter, children: [
                new Container(
                  foregroundDecoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87])),
                  child: new Image.asset(
                      "assets/images/foxhole_artillery_bg_noFade.jpg"),
                ),
                new Container(
                  padding: const EdgeInsets.only(
                      bottom: 20, top: 20, left: 30, right: 30),
                  //TODO: Use MediaQuery
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87])),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text("Select Artillery Type",
                          style: new TextStyle(color: new Color(0xffD1D1D1))),
                      new Text("Howitzer selected",
                          style: new TextStyle(color: new Color(0xff6C6C6C)))
                    ],
                  ),
                )
              ]),
            ],
          ),
        )
      ],
    );
  }
}
