import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:foxhole_artillery/Theme/SizeConfig.dart';
import 'package:foxhole_artillery/Theme/Theme.dart';
import 'HomeScreen.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(new MyApp());
void main(List<String> args) => runApp(new MyApp());

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
              theme: appTheme,
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
  double fontSize12 = 1.54 * SizeConfig.textMultiplier; // 12
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color(0xff191919),
      //using SingleChildScrollView to push up TextFields when keyboard is open. (resizeToAvoidBottomInset doesn't work)
      //resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RawMaterialButton(
              shape: const StadiumBorder(),
              splashColor: Color(0xff191919),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.41 * 4.11), //10
                child: new Text('Made with ❤️ in Xeniac',
                    style: new TextStyle(
                      fontFamily: 'Calibri',
                      color: Color(0xff979797),
                      fontSize: fontSize12,
                    )),
              ),
              onPressed: _onPressed,
            )
          ],
        ),
        elevation: 0,
      ),
      body: new SingleChildScrollView(child: new HomeScreen()),
    );
  }

  _onPressed() async {
    const url = 'https://xeniac.ir';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
