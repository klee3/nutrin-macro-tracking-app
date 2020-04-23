import 'package:flutter/material.dart';

class UserInputMacros extends StatefulWidget{
  @override
  _UserInputMacros createState() => _UserInputMacros();
}

class _UserInputMacros extends State<UserInputMacros> {

  ButtonTheme button(String measure) {
    return  ButtonTheme(
      minWidth: 100,
      child: RaisedButton(
        child: Text(measure),
        color: Color(0xFF19647E),
        splashColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: (){},
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
      ),
    ),
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text(
                  "Macronutrients",
                style: TextStyle(fontFamily: "OpenSans", fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                button("grams"),
                button("%"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Carbs",
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Protein",
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 20),),
                  Text(
                    "Fat",
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 20),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}