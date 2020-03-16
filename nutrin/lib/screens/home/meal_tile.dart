import 'package:flutter/material.dart';
import 'package:mobileapp/model/meal.dart';

class MealTile extends StatelessWidget {
  final Meal meal;

  MealTile({this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green,
          ),
          title: Text(meal.mealName),
          subtitle: Text('Foods: ${meal.foods.toString()}'),
        ),
      ),
    );
  }
}
