import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/user%20introduction/personal_information.dart';

class UserGoal extends StatefulWidget{
  @override
  _UserGoal createState() => _UserGoal();
}

class _UserGoal extends State<UserGoal> {

  ButtonTheme button(String hours, String white, Function func) {
    return ButtonTheme(
      minWidth: 250.0,
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
        onPressed: func,
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
                  "I want to...",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Comfortaa",
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                  ),
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
                      child: button("lose", "fat", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => PersonalInfo()),
                        );
                      },)
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top:20.0 ,bottom: 20.0, left: 60.0, right: 60.0),
                      child: button("maintain","my weight", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => PersonalInfo()),
                        );
                      },)
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top:20.0 ,bottom: 20.0, left: 60.0, right: 60.0),
                      child: button("gain", "muscle", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => PersonalInfo()),
                        );
                      },)
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