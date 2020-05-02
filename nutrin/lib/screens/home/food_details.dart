import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:mobileapp/screens/home/macros_donut.dart';

class DetailsPage extends StatefulWidget {
  final TrackedFood trackedFood;

  DetailsPage({Key key, @required this.trackedFood}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

  class _DetailsPageState extends State<DetailsPage> {
    final _formKey = GlobalKey<FormState>();
    List<String> _servings = getServings();
    List<DropdownMenuItem<String>> _dropDownServings;
    String _selectedServing;

    onChangeDropdownServing(String selectedServing) {
    setState(() {
    _selectedServing = selectedServing;
    });
  }

    static List<String> getServings() {
      return <String> [
        "g",
        "oz",
        "serving",
      ];
    }

    @override
    void initState() {
      // servings
      _dropDownServings = buildServings(_servings);
      _selectedServing = _dropDownServings[0].value;
      super.initState();
    }

    List<DropdownMenuItem<String>> buildServings(List<String> servings) {
      List<DropdownMenuItem<String>> items = List();
      for (String serving in servings) {
        items.add(DropdownMenuItem(
          value: serving,
          child: Text(serving),
        ),
        );
      }
      return items;
    }


    @override
    Widget build(BuildContext context) {
      TrackedFood food = widget.trackedFood;
      return Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width / 2 - 50,
                            child: Text(food.name, style: TextStyle(fontFamily: "Comfortaa", fontSize: 40.0),)),
                      Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 50,
                              height: MediaQuery.of(context).size.height / 8,
                              child: Form(
                                key: _formKey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Amount", style: TextStyle(fontFamily: "Comfortaa"),),
                                    Container(
                                        width: 80,
                                        child: TextFormField()),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Serving", style: TextStyle(fontFamily: "Comfortaa", fontSize: 15.0),),
                                  DropdownButton(
                                    value: _selectedServing,
                                    items: _dropDownServings,
                                    onChanged: onChangeDropdownServing,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child:
              MacroDonut(fat: food.toMap().containsKey("fat") ? food.toMap()['fat'].round() : 0,
                protein: food.toMap().containsKey("protein") ? food.toMap()['protein'].round() : 0,
                carbs: food.toMap().containsKey("carbohydrates") ? food.toMap()['carbohydrates'].round() : 0,),
            ),
      ],
        ),
      );
    }

  }