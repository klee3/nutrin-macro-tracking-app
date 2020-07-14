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
    return Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(25),
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    getFormattedDate(),
                  )
                ],
              ),
              SizedBox(
                height: 50,
                child: Text(tracker.personalNutrients.containsKey("calories")
                    ? tracker.personalNutrients["calories"].round().toString()
                    : 0.toString()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    child: Text(
                        tracker.personalNutrients.containsKey("carbohydrates")
                            ? tracker.personalNutrients["carbohydrates"]
                                .round()
                                .toString()
                            : 0.toString()),
                  ),
                  SizedBox(
                    child: Text(tracker.personalNutrients.containsKey("protein")
                        ? tracker.personalNutrients["protein"]
                            .round()
                            .toString()
                        : 0.toString()),
                  ),
                  SizedBox(
                    child: Text(tracker.personalNutrients.containsKey("fat")
                        ? tracker.personalNutrients["fat"].round().toString()
                        : 0.toString()),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
