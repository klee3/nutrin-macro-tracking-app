import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/mealmodel.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';

class MealList extends StatefulWidget {
  @override
  _MealListState createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  @override
  Widget build(BuildContext context) {
    var tracker = Provider.of<Tracker>(context);
    var mealListHeight = MediaQuery.of(context).size.height -
        ((MediaQuery.of(context).size.height / 10.5) +
            (MediaQuery.of(context).size.height / 3));
    if (tracker != null) {
      var meals = tracker.meals;
      return Container(
        width: MediaQuery.of(context).size.width,
        height: mealListHeight,
        child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var currentMeal = meals[index];
              return generateMeal(currentMeal, index);
            },
            // separatorBuilder: (BuildContext context, int index) =>
            //     const Divider(),
            itemCount: meals.length),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget foodtiles(MealModel currentMeal) {
    var widgets = <Widget>[];

    for (var i = 0; i < currentMeal.foods.length; i++) {
      TrackedFood food = currentMeal.foods[i];
      Widget foodTile = InkWell(
        onTap: () {},
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      food.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            food.carbohydrates + "C",
                            style: TextStyle(fontFamily: "OpenSans"),
                          ),
                          Text(
                            food.protein + "P",
                            style: TextStyle(fontFamily: "OpenSans"),
                          ),
                          Text(
                            food.fat + "F",
                            style: TextStyle(fontFamily: "OpenSans"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: Text(
                      food.serving + " " + food.unit,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: "OpenSans"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      widgets.add(foodTile);
    }
    return Column(
      children: widgets,
    );
  }

  Widget generateMeal(MealModel currentMeal, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 15),
          child: Text(
            currentMeal.mealName.toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(fontFamily: "OpenSans"),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: foodtiles(currentMeal),
          // ListView.separated(
          //   shrinkWrap: true,
          //   itemCount: currentMeal.foods.length,
          //   separatorBuilder: (BuildContext context, int index) =>
          //       const Divider(),
          //   itemBuilder: (BuildContext context, int index) {
          //     return generateFoodTile(currentMeal, index);
          //   },
          // ),
        ),
      ],
    );
  }
}
