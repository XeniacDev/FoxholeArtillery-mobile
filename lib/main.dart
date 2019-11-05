import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:foxhole_artillery/Theme/SizeConfig.dart';
import 'HomeScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return new LayoutBuilder(
      builder: (context, constraints) {
        return new OrientationBuilder(
          builder: (context, orientation) {
            new SizeConfig().int(constraints, orientation);
            return new MaterialApp(
              title: 'FoxholeArtillery',
              theme: new ThemeData(
                  fontFamily: "Calibri", dividerColor: new Color(0xff191919)),
              home: new HomePage(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color(0xff191919),
      //using SingleChildScrollView to push up TextFields when keyboard is open. (resizeToAvoidBottomInset doesn't work)
      //resizeToAvoidBottomInset: true,
      body: new SingleChildScrollView(child: new HomeScreen()),
    );
  }
}
