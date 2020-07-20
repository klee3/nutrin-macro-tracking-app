import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/mealpage/macrostile.dart';
import 'package:mobileapp/screens/mealpage/meallist.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key key}) : super(key: key);

  @override
  _MealPage createState() => _MealPage();
}

class _MealPage extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var tracker = Provider.of<Tracker>(context);

    Widget loading() {
      if (tracker != null) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Expanded(child:),
              MacroTile(),
              Expanded(child: MealList())
            ],
          ),
        );
      } else {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CircularProgressIndicator(),
        );
      }
    }

    return StreamProvider<Tracker>.value(
      value: DatabaseService(uid: user.uid).tracker,
      child: loading(),
    );
  }
}
