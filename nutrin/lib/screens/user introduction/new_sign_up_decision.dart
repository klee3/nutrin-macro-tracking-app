import 'package:flutter/material.dart';

class UserDecision extends StatefulWidget{
  @override
  _UserDecision createState() => _UserDecision();
}

class _UserDecision extends State<UserDecision> {

  ButtonTheme button(String hours, String white) {
    return ButtonTheme(
      minWidth: 250.0,
      child: RaisedButton(
        child: RichText(
          text: TextSpan(
            text: hours,
            style: TextStyle(color: Color(0xFF119DA4), fontSize: 20, fontFamily: "OpenSans", fontWeight: FontWeight.bold),
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
        onPressed: (){},
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 60.0, top: 120.0, right: 40.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
              "Let's Start!",
              style: TextStyle(
                  color: Color(0xFF119DA4),
                  fontFamily: "OpenSans",
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
                style: TextStyle(fontFamily: "OpenSans", fontSize: 20),
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
                    child: button("I will input", "my own macros.")
                ),
                Padding(
                    padding: const EdgeInsets.only(top:20.0 ,bottom: 20.0, left: 60.0, right: 60.0),
                    child: button("I want","generated macros.")
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}