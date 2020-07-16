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
    var tileHeight = MediaQuery.of(context).size.height / 3;
    int caloriesEaten = 500;
    int carbsEaten = 10;
    int fatEaten = 10;
    int proteinEaten = 10;

    if (tracker != null) {
      var macros = tracker.personalNutrients;
      return Container(
          height: tileHeight,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(25),
          child: Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  getFormattedDate(),
                  style: TextStyle(fontSize: 25, fontFamily: 'OpenSans'),
                ),
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(5.0) //
                        ),
                  ),
                ),
                macroPanel(caloriesEaten, macros["calories"].round(), "CAL",
                    Theme.of(context).primaryColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    macroPanel(carbsEaten, macros["carbohydrates"].round(),
                        "CARBS", Color(0xFF03256C)),
                    macroPanel(proteinEaten, macros["protein"].round(), "PRO",
                        Color(0xFF2A9134)),
                    macroPanel(fatEaten, macros["fat"].round(), "FAT",
                        Color(0xFFDA4167)),
                  ],
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

  Widget macroPanel(int consumed, int total, String macro, Color color) {
    return Row(
      children: <Widget>[
        Text(
          consumed.toString(),
          style: TextStyle(color: color, fontSize: 35, fontFamily: "OpenSans"),
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
