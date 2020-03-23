import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MacroDisplay extends StatefulWidget {
  @override
  _MacroDisplayState createState() => _MacroDisplayState();
}

class _MacroDisplayState extends State<MacroDisplay> {
  List<String> meals = ["Breakfast", "Lunch", "Dinner", "Snacks"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black54,
                      offset: new Offset(5.0, 5.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                String meal = meals[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  meal,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Apple"),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Cheese"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.lightBlue,
        overlayOpacity: .2,
        curve: Curves.easeInBack,
        children: [
          SpeedDialChild(
              child: Icon(Icons.free_breakfast),
              label: "Breakfast",
              onTap: () => print("Breakkfast")),
          SpeedDialChild(
              child: Icon(Icons.fastfood),
              label: "Lunch",
              onTap: () => print("Breakkfast")),
          SpeedDialChild(
              child: Icon(Icons.local_pizza),
              label: "Dinner",
              onTap: () => print("Breakkfast")),
        ],
      ),
    );
  }
}
