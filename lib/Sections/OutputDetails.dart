import "package:flutter/material.dart";

class OutputDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new OutputDetailsState();
}

class OutputDetailsState extends State<OutputDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 30.0, right: 30.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  flex: 10,
                  child: new Column(
                    children: <Widget>[
                      // outputs Titles ========================================>>
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Text("DISTANCE",
                              style:
                              new TextStyle(color: new Color(0xff737373),fontSize: 12)),
                          new Text("AZIMUTH",
                              style:
                              new TextStyle(color: new Color(0xff737373),fontSize: 12))
                        ],
                      ),
                      //<<==================================================

                      new Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[

                            //output numbers ================>>
                            new Row(
                              children: <Widget>[
                                new Text("123"+"m",
                                    style:
                                    new TextStyle(color: Colors.white,fontSize: 19)),
                                new Padding(
                                  padding: const EdgeInsets.only(left:27.5),
                                  child: new Text("123"+"deg",
                                      style:
                                      new TextStyle(color: Colors.white,fontSize: 19)),
                                )
                              ],
                            )
                            //<<============================
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          new SizedBox(
          width: 10,
          ),

          //Calculate Button to get user entered numbers from TextFields ==============================>>
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new RaisedButton(
                  onPressed: (){

                  },
                  color: new Color(0xffFFA32B),
                  child: new Text("CALCULATE",style: new TextStyle(color: Colors.white)),
                )
              ],
            ),
          )
          // <<=================================================================================
        ],
      ),
    );
  }
}
