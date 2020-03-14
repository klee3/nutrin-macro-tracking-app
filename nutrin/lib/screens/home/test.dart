import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0xFF18D191)),
      ),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: new Container(
            child: new Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 40.0, fontFamily: 'Comfortaa'),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: new Container(
                              height: 250.0,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  color: Colors.blue[200]),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  ),
                                  new Text(
                                    "Add to Fridge",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: "Comfortaa"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Container(
                      height: 100.0,
                      decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(25.0),
                            color: Colors.blue[200]),
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.free_breakfast,
                              color: Colors.white,
                            ),
                            new Text(
                              "Breakfast",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Comfortaa"),
                            )
                          ],
                      ),
                    ),
                        )),
                    new Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Container(
                      height: 100.0,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(25.0),
                              color: Colors.blue[200]
                            ),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.cake,
                                  color: Colors.white,
                                ),
                                new Text(
                                  "Lunch",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "Comfortaa"),
                                )
                              ],
                            ),
                    ),
                        )),
                    new Expanded(
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(25.0),
                              color: Colors.blue[200]
                          ),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(
                                Icons.fastfood,
                                color: Colors.white,
                              ),
                              new Text(
                                "Dinner",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: "Comfortaa"),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: new Container(
                              height: 150.0,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  color: Colors.blue[200]),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  ),
                                  new Text(
                                    "Add to Fridge",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: "Comfortaa"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

