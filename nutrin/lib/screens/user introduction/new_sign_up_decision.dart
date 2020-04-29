import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/user%20introduction/user_activity_levels.dart';
import 'package:mobileapp/screens/user%20introduction/user_input_macros.dart';

class UserDecision extends StatefulWidget{
  @override
  _UserDecision createState() => _UserDecision();
}

class _UserDecision extends State<UserDecision> {

  ButtonTheme button(String hours, String white, Function function) {
    return ButtonTheme(
      minWidth: 350.0,
      child: RaisedButton(
        child: RichText(
          text: TextSpan(
            text: hours,
            style: TextStyle(color: Color(0xFF119DA4), fontSize: 18, fontFamily: "Comfortaa", fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: " " + white, style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),),
            ],
          ),
        ),
        color: Color(0xFF19647E),
        splashColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: function,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 60.0, top: 120.0, right: 40.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                "Let's Start!",
                style: TextStyle(
                    color: Color(0xFF119DA4),
                    fontFamily: "Comfortaa",
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.left,
              ),
    ),
    ),
            Padding(
              padding: const EdgeInsets.only(left:60.0, top: 10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Macros:",
                  style: TextStyle(fontFamily: "Comfortaa", fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top:20.0 ,bottom: 20.0, left: 60.0, right: 60.0),
                      child: button("I will input", "my own macros.", () {
                      Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => UserInputMacros()),
                      );
                      },),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top:20.0 ,bottom: 20.0, left: 60.0, right: 60.0),
                      child: button("I want","generated macros.", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => UserActivity()),
                        );
                      },),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}