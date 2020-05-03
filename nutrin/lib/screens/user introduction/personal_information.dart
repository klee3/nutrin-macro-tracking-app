import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/user%20introduction/birthday.dart';
import 'new_sign_up_decision.dart';

class PersonalInfo extends StatefulWidget{
  @override
  _PersonalInfo createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  List<bool> _selectionsWeight = List.generate(2, (_) => false);
  List<bool> _selectionsHeight = List.generate(2, (_) => false);
  List<bool> _selections3 = List.generate(3, (_) => false);
  Map<String, double> defaultMap = new Map();
  bool toggleValue = false;
  bool input = false;


  Widget inputField() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 6,
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
    );
  }

  Widget toggleButton(String m1, String m2, List<bool> bools) {
    return ToggleButtons(
      children: <Widget>[
        Text(m1),
        Text(m2),
      ],
      isSelected: bools,
      onPressed: (int index) {
        setState(() {
          bools[index] = !bools[index];
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserDecision()),
                        );
                      },),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 40),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text("My stats are..", style: TextStyle(fontFamily: "Comfortaa", fontSize: 30.0),)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                          width: 80.0,
                          child: Text("Gender:", style: TextStyle(fontFamily: "Comfortaa"),)),
                  ToggleButtons(
                    children: <Widget>[
                      Text("M"),
                      Text("F"),
                      Text("O"),
                    ],
                    isSelected: _selections3,
                    onPressed: (int index) {
                      setState(() {
                        _selections3[index] = !_selections3[index];
                      });
                    },
                    color: Color(0xFF19647E),
                    selectedColor: Colors.white,
                    fillColor: Color(0xFF19647E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                          width: 60.0,
                          child: Text("Weight:", style: TextStyle(fontFamily: "Comfortaa"),)),
                      inputField(),
                      toggleButton("kg", "lbs", _selectionsWeight),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                          width: 60.0,
                          child: Text("Height:", style: TextStyle(fontFamily: "Comfortaa"),)),
                      inputField(),
                      toggleButton("m", "inch", _selectionsHeight),
                    ],
                  ),
                ),
                    Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Birthday()),
                          );
                        },
                        icon: Icon(Icons.check_circle, size: 30, color: Color(0xFF19647E)),
                        highlightColor: Colors.blueAccent,
                      ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }


  toggleButtonSlide() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}