import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:flutter/services.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/search/searchtest.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final String mealName;
  final TrackedFood food;

  FoodPage(this.mealName, this.food);
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  TextEditingController serving = new TextEditingController();
  final _foodFormKey = GlobalKey<FormState>();
  var dropDownValue = "g";
  var dropDownValues = ["g", "cups", "mL"];

  @override
  Widget build(BuildContext context) {
    TrackedFood food = widget.food;
    var foodMap = food.toMap();
    String carbsPerServing =
        foodMap.containsKey('carbohydrates') ? foodMap['carbohydrates'] : "0";
    String fatPerServing = foodMap.containsKey('fat') ? foodMap['fat'] : "0";
    String proteinPerServing =
        foodMap.containsKey('protein') ? foodMap['protein'] : "0";
    double carbs = double.parse(carbsPerServing);
    double fat = double.parse(fatPerServing);
    double protein = double.parse(proteinPerServing);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF3C7A89),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              widget.mealName.substring(0, 1).toUpperCase() +
                  widget.mealName.substring(1, widget.mealName.length),
              style: TextStyle(
                  fontFamily: 'OpenSans', color: Colors.white, fontSize: 25),
            ),
          ),
          macroBar(carbs, protein, fat),
          Form(
            key: _foodFormKey,
            child: form(carbsPerServing, fatPerServing, proteinPerServing),
          ),
          Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .65,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[200],
                      width: 1,
                    ),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(40.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Nutritional Facts",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                      Column(
                        children: nutritionTiles(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 1,
                      ),
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(40.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Daily Value",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        Column(
                          children: nutritionTiles(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> nutritionTiles() {
    var widgets = <Widget>[];
    for (int i = 0; i < widget.food.toMap().length; i++) {
      widgets.add(
        ListTile(
          title: Text('item $i'),
        ),
      );
    }
    return widgets;
  }

  Widget macroBar(double carbs, double protein, double fat) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.all(
            Radius.circular(25.0) //                 <--- border radius here
            ),
      ),
      height: 30,
      width: MediaQuery.of(context).size.width * .9,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: carbs.floor(),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF57B8FF),
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(25.0),
                      topLeft: const Radius.circular(25.0),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "C",
                    style:
                        TextStyle(fontFamily: "OpenSans", color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: fat.floor(),
            child: Stack(
              children: <Widget>[
                Container(
                  color: Color(0xFFEF7674),
                ),
                Center(
                  child: Text(
                    "F",
                    style:
                        TextStyle(fontFamily: "OpenSans", color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: protein.floor(),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFC5DCA0),
                      borderRadius: new BorderRadius.only(
                        bottomRight: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "P",
                      style: TextStyle(
                          fontFamily: "OpenSans", color: Colors.white),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget form(
      String carbsPerServing, String fatPerServing, String proteinPerServing) {
    var user = Provider.of<User>(context);
    var db = DatabaseService(uid: user.uid);
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Carbohydrates",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      carbsPerServing + "g",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Serving",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Container(
                        width: 50,
                        child: TextFormField(
                          controller: serving,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Protein",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      proteinPerServing + "g",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Unit",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    DropdownButton(
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: dropDownValue,
                      onChanged: (String unit) {
                        dropDownValue = unit;
                        print(dropDownValue);
                      },
                      items: dropDownValues
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Fat",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      fatPerServing + "g",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    if (_foodFormKey.currentState.validate()) {
                      print("YEs");
                      List<TrackedFood> trackedFoods;
                      trackedFoods.add(TrackedFood(
                          widget.food.name,
                          (double.parse(carbsPerServing) *
                                  int.parse(serving.text))
                              .toString(),
                          (double.parse(proteinPerServing) *
                                  int.parse(serving.text))
                              .toString(),
                          (double.parse(fatPerServing) *
                                  int.parse(serving.text))
                              .toString(),
                          serving.text,
                          dropDownValue));
                      db.updateMeals(widget.mealName, trackedFoods);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(widget.mealName),
                        ),
                      );
                    }
                  },
                  icon: Icon(Icons.check, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
