import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class UserInputMacros extends StatefulWidget{
  @override
  _UserInputMacros createState() => _UserInputMacros();
}

class _UserInputMacros extends State<UserInputMacros> {
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

  Widget youtubeToggle() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      height: 40.0,
      width: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: toggleValue ? Colors.blue: Colors.blueAccent.withOpacity(.5)
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            top: 3.0,
            left: toggleValue ? 60.0:0.0,
            right: toggleValue ? 0.0:60.0,
            child: InkWell(
              onTap: toggleButtonSlide,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return RotationTransition(child: child, turns: animation);
                  },
                  child: toggleValue ? Text("g", style: TextStyle(fontFamily: "Comfortaa", color: Colors.white), key: UniqueKey(),)
                      : Text("%", style: TextStyle(fontFamily: "Comfortaa", color: Colors.white), key: UniqueKey(),)
              ),

            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    defaultMap.putIfAbsent("Carbs", () => 50);
    defaultMap.putIfAbsent("Protein", () => 25);
    defaultMap.putIfAbsent("Fat", () => 25);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Container(
            height: 600,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PieChart(dataMap: input ? defaultMap:createNewMap()),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                          width: 80.0,
                          child: Text("Calories:", style: TextStyle(fontFamily: "Comfortaa"),)),
                      inputField(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80.0,
                          child: Text("Carbs:", style: TextStyle(fontFamily: "Comfortaa"),)),
                      inputField(),
                      Text(toggleValue ? "grams":"%", style: TextStyle(fontFamily: "Comfortaa"),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80.0,
                          child: Text("Protein:", style: TextStyle(fontFamily: "Comfortaa"),)),
                      inputField(),
                      Text(toggleValue ? "grams":"%", style: TextStyle(fontFamily: "Comfortaa"),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80.0,
                          child: Text("Fat:", style: TextStyle(fontFamily: "Comfortaa"),)),
                      inputField(),
                      Text(toggleValue ? "grams":"%", style: TextStyle(fontFamily: "Comfortaa"),),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CupertinoSwitch(
                      activeColor: Color(0xFF19647E),
                      value: toggleValue,
                      onChanged: (value) {
                        setState(() {
                          toggleValue = value;
                        });
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        input = true;
                      },
                      icon: Icon(Icons.check_circle, size: 30, color: Color(0xFF19647E)),
                      highlightColor: Colors.blueAccent,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map createNewMap() {
    Map<String, double>  dataMap = new Map();
    dataMap.putIfAbsent("Carbs", () => 10);
    dataMap.putIfAbsent("Protein", () => 15);
    dataMap.putIfAbsent("Fat", () => 14);
    return dataMap;
  }

  toggleButtonSlide() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}