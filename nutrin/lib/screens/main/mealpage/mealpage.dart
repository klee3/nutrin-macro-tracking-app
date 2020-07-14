import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/main/mealpage/macrostile.dart';
import 'package:mobileapp/screens/main/mealpage/meallist.dart';
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
    bool toggle = true;

    List<Widget> display() {
      if (toggle) {
        return [MacroTile(), MealList()];
      } else {
        return [MealList()];
      }
    }

    return StreamProvider<Tracker>.value(
      value: DatabaseService(uid: user.uid).tracker,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          body: Column(
            children: display(),
          ),
        ),
      ),
    );
  }
}
