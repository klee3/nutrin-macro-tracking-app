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
          resizeToAvoidBottomPadding: false,
          backgroundColor: Color(0xFFF9F9F9),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height / 6 - 20,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(food.name, style: TextStyle(fontFamily: "Comfortaa", fontSize: 25.0),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 2 - 50,
                                height: 50,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Container(
                      width: 100,
                      height: 100,
                      child:
                      MacroDonut(fat: food.toMap().containsKey("fat") ? food.toMap()['fat'] : 0,
                        protein: food.toMap().containsKey("protein") ? food.toMap()['protein'] : 0,
                        carbs: food.toMap().containsKey("carbohydrates") ? food.toMap()['carbohydrates'] : 0,
                      food: food,),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton.icon(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          icon: Icon(Icons.check, color: Colors.white,),
                          color: Color(0xFF21BFBD),
                          onPressed: (){},
                          label: Text("Add", style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            macroDisplay(food, "carbohydrates", Color(0xff19647E)),
                            macroDisplay(food, "protein", Color(0xff119DA4)),
                            macroDisplay(food, "fat", Color(0xff845bef),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              nutrition(food),
            ],
          ),
        );
    }

    macroDisplay(TrackedFood trackedFood, String s, Color color) {
      return Column(
        children: <Widget>[
          Text(s.toUpperCase().substring(0,1), style: TextStyle(fontFamily: "Comfortaa", color: color, fontSize: 20, fontWeight: FontWeight.w500),),
          Text(calculateTotal(trackedFood, s).toStringAsFixed(2), style: TextStyle(fontFamily: "Comfortaa", color: color, fontSize: 15,),),
        ],
      );
    }

    double calculateTotal(TrackedFood food, String s) {
      switch (s) {
        case "carbohydrates":
          return food.toMap().containsKey("carbohydrates") ? food
              .toMap()['carbohydrates'] : 0;
          break;
        case "protein":
          return food.toMap().containsKey("protein")
              ? food.toMap()['protein']
              : 0;
          break;
        case "fat":
          return food.toMap().containsKey("fat")
              ? food.toMap()['fat']
              : 0;
          break;
      }
      return 0.0;
    }

  nutrition(TrackedFood food) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 + 70,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
          shrinkWrap: true,
            itemCount: food.toMap().keys.toList().length,
            itemBuilder: (context, index) {
          return nutrientPanel(food.toMap().keys.toList()[index], food);
        }),
      ),
    );
  }

  nutrientPanel(String list, TrackedFood food) {
      return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(list == "name" ?  "Nutrition Label": list, style: TextStyle(fontFamily: "Comfortaa", fontSize: list == "name" ? 30 : 15),),
            Text(list == "name" ?  "": food.toMap()[list].toString() + " " + measurement(list), style: TextStyle(fontFamily: "Comfortaa"),),
          ],
        ),
      );
  }

  String measurement(String list) {
      switch (list) {
        case "iron" : return "%";
        break;
        case "calories" : return "";
        break;
        case "cholesterol" : return "mg";
        break;
        case "sodium" : return "mg";
        break;
        case "calcium" : return "%";
        break;
        case "vitaminA" : return "%";
        break;
        case "vitaminC" : return "%";
        break;
        case "potassium" : return "mg";
        break;
        case "serving" : return "";
        break;
        case "unit" : return "";
        break;
      }
      return "g";
  }

  }