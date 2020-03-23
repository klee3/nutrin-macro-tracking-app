import 'package:flutter/material.dart';

class RegisterInfoForm extends StatefulWidget {
  @override
  _RegisterInfoFormState createState() => _RegisterInfoFormState();
}

class _RegisterInfoFormState extends State<RegisterInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: PageController(initialPage: 1),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Text("page 1"),
          Text("page 2")
        ],
      ),
    );
  }
}
