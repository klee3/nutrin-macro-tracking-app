import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/services/database.dart';
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
    var tracker = Provider.of<Tracker>(context);
    int caloriesEaten = 500;
    int carbsEaten = 10;
    int fatEaten = 10;
    int proteinEaten = 10;

    if (tracker != null) {
      var macros = tracker.personalNutrients;
      return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(25),
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0) //
                                    ),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 100,
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
                  child: macroPanel(caloriesEaten, macros["calories"].round(),
                      "CAL", Theme.of(context).primaryColor, 45),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      macroPanel(carbsEaten, macros["carbohydrates"].round(),
                          "CARBS", Color(0xFF03256C)),
                      macroPanel(proteinEaten, macros["protein"].round(), "PRO",
                          Color(0xFF2A9134)),
                      macroPanel(fatEaten, macros["fat"].round(), "FAT",
                          Color(0xFFDA4167)),
                    ],
                  ),
                )
              ],
            ),
          ));
    } else {
      return Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget macroPanel(int consumed, int total, String macro, Color color,
      [double size]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          consumed.toString(),
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
