import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
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
    var tracker = Provider.of<Tracker>(context);
    var user = Provider.of<User>(context);
  }
}
