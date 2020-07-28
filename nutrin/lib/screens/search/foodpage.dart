import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFF3C7A89),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            widget.mealName.substring(0, 1).toUpperCase() +
                widget.mealName.substring(1, widget.mealName.length),
            style: TextStyle(
                fontFamily: 'OpenSans', color: Colors.white, fontSize: 25),
          ),
          Form(
            key: _foodFormKey,
            child: form(),
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

  Widget form() {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Carbohydrates"),
              Column(
                children: <Widget>[
                  Text("Servings"),
                  Container(
                      width: 50,
                      child: TextFormField(
                        controller: serving,
                      )),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Protein"),
              Column(
                children: <Widget>[
                  Text("Unit"),
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
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Fat"),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.check),
              )
            ],
          ),
        ],
      ),
    );
  }
}
