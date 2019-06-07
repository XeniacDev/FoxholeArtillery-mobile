import 'package:flutter/material.dart';

import 'HomeScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FoxholeArtillery',
      theme: new ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Calibri"
      ),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      body: new HomeScreen(),
    );
  }
}
