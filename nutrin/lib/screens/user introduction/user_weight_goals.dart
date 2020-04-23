import 'package:flutter/material.dart';

class UserWeightGoals extends StatefulWidget{
   @override
   _UserWeightGoals createState() => _UserWeightGoals();
}

class _UserWeightGoals extends State<UserWeightGoals> {

  ButtonTheme button(String motive) {
     return ButtonTheme(
       minWidth: 250.0,
            child: RaisedButton(
            child: RichText(
              text: TextSpan(
                text: motive,
                style: TextStyle(color: Color(0xFF119DA4), fontSize: 20, fontFamily: "OpenSans", fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(text: " weight", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),),
                ],
              ),
                ),
              color: Color(0xFF19647E),
              splashColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: (){},
               padding: EdgeInsets.all(22.0),
            ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 80.0, top: 120.0, right: 40.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "My weight goals are...",
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
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: button("Lose")
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: button("Maintain")
                ),
               Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: button("Gain")
                ),
        ],
            ),
          ),
      ],
      ),
    );
  }
}