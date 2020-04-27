import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget{
  @override
  _PersonalInfo createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  List<bool> _selections = List.generate(2, (_) => false);
  Map<String, double> defaultMap = new Map();
  bool toggleValue = false;
  bool input = false;


  ButtonTheme button(String measure) {
    return  ButtonTheme(
      minWidth: 100,
      child: RaisedButton(
        child: Text(measure, style: TextStyle(color: Colors.white, fontFamily: 'Comfortaa'),),
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

  Widget inputField() {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Card(
            elevation: 0,
            child: TextFormField( decoration: const InputDecoration(
            ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },),
          ),
        ),
      ),
    );
  }

  Widget toggleButton() {
    return ToggleButtons(
      children: <Widget>[
        Text("g"),
        Text("%"),
      ],
      isSelected: _selections,
      onPressed: (int index) {
        setState(() {
          _selections[index] = !_selections[index];
        });
      },
      color: Color(0xFF19647E),
      selectedColor: Colors.white,
      fillColor: Color(0xFF19647E),
      borderRadius: BorderRadius.circular(30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}