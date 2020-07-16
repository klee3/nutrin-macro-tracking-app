import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            itemBuilder: (BuildContext context, int index) {
              var currentMeal = meals[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      currentMeal.mealName.toUpperCase(),
                      textAlign: TextAlign.left,
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
                    height: 50,
                    child: ListView.separated(
                        itemCount: currentMeal.foods.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(currentMeal.foods[index].name),
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                            30) /
                                        2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(currentMeal
                                                .foods[index].carbohydrates +
                                            "C"),
                                        Text(currentMeal.foods[index].protein +
                                            "P"),
                                        Text(
                                            currentMeal.foods[index].fat + "F"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                currentMeal.foods[index].serving.toString() +
                                    currentMeal.foods[index].unit,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              );
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
}
