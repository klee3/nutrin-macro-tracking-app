import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/mealmodel.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:flutter/services.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/main/bottomnav.dart';
import 'package:mobileapp/screens/search/search.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final String mealName;
  final TrackedFood food;
  final List<MealModel> meals;

  FoodPage(this.mealName, this.food, this.meals);
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  TextEditingController serving = new TextEditingController();
  final _foodFormKey = GlobalKey<FormState>();
  double userInputServing = 1.0;
  var dropDownValue = "serving";
  var dropDownValues = new List<String>();

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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          widget.food.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "OpenSans",
            fontSize: 25,
          ),
        ),
        backgroundColor: Color(0xFF3C7A89),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: macroBar(carbs, protein, fat),
          ),
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
            height: MediaQuery.of(context).size.height * .60,
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
    TrackedFood food = widget.food;
    for (int i = 0; i < food.toMap().length; i++) {
      List<String> name =
          food.toMap().keys.map((name) => name.toString()).toList();
      List<String> val =
          food.toMap().values.map((val) => val.toString()).toList();
      widgets.add(
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(name[i]),
              Text(val[i]),
            ],
          ),
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
                    color: Color(0xFF03256C),
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
                  color: Color(0xFFDA4167),
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
                      color: Color(0xFF2A9134),
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

  List<String> appropriateDropDownvalues() {
    TrackedFood food = widget.food;
    if (food.unit == "g" | )
  }

  Widget form(
      String carbsPerServing, String fatPerServing, String proteinPerServing) {
    dropdown = appropriateDropDownvalues();
    var user = Provider.of<User>(context);
    var db = DatabaseService(uid: user.uid);
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              macroDisplay("Carbs", carbsPerServing),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: 100,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value == null) {
                              setState(() {
                                userInputServing = 0.0;
                              });
                            } else {
                              setState(() {
                                userInputServing = double.parse(value);
                              });
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Servings",
                            labelStyle: TextStyle(
                                color: Colors.black, fontFamily: "OpenSans"),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
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
              macroDisplay("Protein", proteinPerServing),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Unit",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    DropdownButton(
                      underline: Container(
                        color: Colors.black,
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
                            style: TextStyle(color: Colors.black),
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
              macroDisplay("Fat", fatPerServing),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    double carbs = double.parse(carbsPerServing);
                    double fat = double.parse(fatPerServing);
                    double protein = double.parse(proteinPerServing);
                    if (_foodFormKey.currentState.validate()) {
                      sendFoodsToDb(carbs, protein, fat, db);
                      Navigator.pop(context);
                    } else {
                      return null;
                    }
                  },
                  icon: Icon(Icons.check, color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  MealModel getMeal(List<MealModel> meals, String mealname) {
    if (mealname.toLowerCase() == "breakfast") {
      return meals[0];
    } else if (mealname.toLowerCase() == "lunch") {
      return meals[1];
    } else {
      return meals[2];
    }
  }

  // TODO: fix method
  sendFoodsToDb(double carbs, double protein, double fat, DatabaseService db) {
    TrackedFood food = widget.food;
    List<TrackedFood> foods = List<TrackedFood>();
    foods.add(new TrackedFood(
        food.name,
        calculateMacroValues(carbs),
        (protein * userInputServing).toString(),
        (fat * userInputServing).toString(),
        userInputServing.toString(),
        dropDownValue));
    db.updateMeals(widget.mealName, foods);
  }

  String calculateMacroValues(double macro) {
    TrackedFood food = widget.food;
    if (food.unit == dropDownValue) {
      return (macro * userInputServing).toString();
    }
  }

  Widget macroDisplay(String macro, String macroPerServing) {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Text(
            macro,
            style: TextStyle(
                fontFamily: 'OpenSans', color: Colors.black, fontSize: 15),
          ),
          Text(
            (double.parse(macroPerServing) * userInputServing).toString() +
                " g",
            style: TextStyle(
                fontFamily: 'OpenSans', color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
