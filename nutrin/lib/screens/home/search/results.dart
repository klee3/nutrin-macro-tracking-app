
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  _Results createState() => _Results();
}

class _Results extends State<Results> {
  List data = ["one", "two", "three", "four", "five", "sixe", "sevon", "eight", "nine", "ten", "one", "two", "three", "four", "five", "sixe", "sevon", "eight", "nine", "ten"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int i) => Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Text(data[i], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                  Divider(color: Colors.black,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}