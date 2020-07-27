import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/mealmodel.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:provider/provider.dart';

class MacroTile extends StatefulWidget {
  @override
  _MacroTileState createState() => _MacroTileState();
}

class _MacroTileState extends State<MacroTile> {
  String getMonth(num) {
    switch (num) {
      case "01":
        {
          return "Jan";
        }
      case "02":
        {
          return "Feb";
        }
      case "03":
        {
          return "Mar";
        }
      case "04":
        {
          return "Apr";
        }
      case "05":
        {
          return "May";
        }
      case "06":
        {
          return "June";
        }
      case "07":
        {
          return "July";
        }
      case "08":
        {
          return "Aug";
        }
      case "09":
        {
          return "Sept";
        }
      case "10":
        {
          return "Oct";
        }
      case "11":
        {
          return "Nov";
        }
      default:
        {
          return "Dec";
        }
    }
  }

  String getFormattedDate() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    String dateString = date.toString();
    String year = dateString.substring(0, 4);
    String month = getMonth(dateString.substring(5, 7));
    String day = dateString.substring(8, 10);
    return month + " " + day + ", " + year;
  }

  @override
  Widget build(BuildContext context) {
    bool showMacros = true;
    var tracker = Provider.of<Tracker>(context);

    if (tracker != null) {
      var macros = tracker.personalNutrients;
      List<MealModel> meals = tracker.meals;
      var caloriesPerMeal =
          meals.map((meal) => meal.calculateCalories()).toList();
      var carbsPerMeal = meals.map((meal) => meal.calculateCarbs()).toList();
      var fatPerMeal = meals.map((meal) => meal.calculateFat()).toList();
      var proteinPerMeal =
          meals.map((meal) => meal.calculateProtein()).toList();
      double totalCalories =
          caloriesPerMeal.reduce((value, element) => value + element);
      double totalCarbs =
          carbsPerMeal.reduce((value, element) => value + element);
      double totalFat = fatPerMeal.reduce((value, element) => value + element);
      double totalProtein =
          proteinPerMeal.reduce((value, element) => value + element);

      if (showMacros) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .35,
          padding: EdgeInsets.only(left: 25, right: 25, top: 15),
          child: Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        getFormattedDate(),
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 5,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0) //
                                    ),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: (totalCalories / macros["calories"].round()) *
                              (MediaQuery.of(context).size.width),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0) //
                                    ),
                          ),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                Container(
                  child: macroPanel(totalCalories, macros["calories"].round(),
                      "CAL", Theme.of(context).primaryColor, 45),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      macroPanel(totalCarbs, macros["carbohydrates"].round(),
                          "CARBS", Color(0xFF03256C)),
                      macroPanel(totalProtein, macros["protein"].round(), "PRO",
                          Color(0xFF2A9134)),
                      macroPanel(totalFat, macros["fat"].round(), "FAT",
                          Color(0xFFDA4167)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: SwitchListTile(
            onChanged: (bool val) {
              setState(() {
                showMacros = val;
              });
            },
            value: showMacros,
            secondary: Text('Show Macronutrients'),
          ),
        );
      }
    } else {
      return Container(
        height: 0,
        width: 0,
      );
    }
  }

  Widget macroPanel(double consumed, int total, String macro, Color color,
      [double size]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          consumed.toInt().toString(),
          style: TextStyle(
              color: color, fontSize: size ?? 35, fontFamily: "OpenSans"),
        ),
        SizedBox(
          child: Column(
            children: <Widget>[
              Text(
                macro,
                textAlign: TextAlign.left,
                style: TextStyle(color: color, fontFamily: "OpenSans"),
              ),
              Text(
                "/" + total.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(color: color, fontFamily: "OpenSans"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
