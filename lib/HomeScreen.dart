import 'package:flutter/material.dart';
import 'package:foxhole_artillery/Global/Global.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Global.homeScreen = this;
    return new Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        new SafeArea(
          child: new Column(
            children: <Widget>[
              new Header(),
              new ArtilleryIcons(),
            ],
          ),
        )
      ],
    );
  }
}

class Header extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HeaderState();
}

class HeaderState extends State<Header> {
  //TODO: Use MediaQuery and Use Color Class
  @override
  Widget build(BuildContext context) {
    return new Stack(alignment: Alignment.bottomCenter, children: [
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

class ArtilleryIcons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ArtilleryIconsState();
}

class ArtilleryIconsState extends State<ArtilleryIcons> {
  //TODO: Use MediaQuery and Use Color Class
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 3),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Global.handleSelection("Field Artillery");
            },
            child: new Container(
              alignment: Alignment.center,
              decoration: new BoxDecoration(
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
          new GestureDetector(
            onTap: () {
              Global.handleSelection("GunShip");
            },
            child: new Container(
                alignment: Alignment.center,
                decoration: new BoxDecoration(
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
          new GestureDetector(
            onTap: () {
              Global.handleSelection("Howitzer");
            },
            child: new Container(
              alignment: Alignment.center,
              decoration: new BoxDecoration(
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
          new GestureDetector(
            onTap: () {
              Global.handleSelection("Mortar");
            },
            child: new Container(
              alignment: Alignment.center,
              decoration: new BoxDecoration(
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
