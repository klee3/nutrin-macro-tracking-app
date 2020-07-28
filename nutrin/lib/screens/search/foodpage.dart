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
  TextEditingController carbs = new TextEditingController();
  final _foodFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3C7A89),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
