import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'graph.dart';

class Veggie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: <Widget>[
        Image(
          image: AssetImage('assets/veggies.jpg'),
        ),
        Positioned(
          bottom: 200,
                left:  MediaQuery.of(context).size.width/5,
                child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Card(
                    elevation: 0,
                    child: Text("Generate personal macronutrients or set your own.", style: TextStyle(fontFamily: "Comfortaa", fontSize: 20),),
                  ),
                ),
        ),
        Positioned(
          bottom: 120,
          left: MediaQuery.of(context).size.width/16,
            child: Dialog(
              elevation: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Color(0xFF119DA4),),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => Graph()),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}