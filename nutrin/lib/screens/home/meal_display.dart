import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/meal.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:mobileapp/screens/home/donut.dart';
import 'package:mobileapp/screens/home/food_details.dart';
import 'package:mobileapp/screens/home/search/search.dart';
import 'package:mobileapp/screens/home/search/silversearch.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MealDisplay extends StatefulWidget {
  @override
  _MealDisplay createState() => _MealDisplay();
}

class _MealDisplay extends State<MealDisplay> {
  List<Meal> meals = [
    Meal("Breakfast", breakfast,),
    Meal("Lunch", lunch,),
    Meal("Dinner", dinner,),
    Meal("Snacks", snack,)];
  static List<TrackedFood> breakfast = [
    TrackedFood("Egg Whites", 95, 22.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 317.5, 0.0, 0.0, 200.0, "g(s)",),
    TrackedFood("Dark Chocolate", 30, 3, 0.4, 2.3, 2.6, 0.0, 0.6, 1.1, 0.0, 0.4, 0.0, 0.0, 1.0, "piece",),
    TrackedFood("Sourdough Bread", 100, 3.0, 20.0, 1.0, 0.0, 1.0, 0.0, 6.0, 0.0, 10.0, 0.0, 0.0, 1.0, "slice",),
  ];
  static List<TrackedFood> lunch = [
    TrackedFood("Sourdough Bread", 100, 3.0, 20.0, 1.0, 0.0, 1.0, 0.0, 6.0, 0.0, 10.0, 0.0, 0.0, 1.0, "slice",),
  ];
  static List<TrackedFood> dinner = [
    TrackedFood("Dark Chocolate", 95, 3, 0.4, 2.3, 2.6, 0.0, 0.6, 1.1, 0.0, 0.4, 0.0, 0.0, 1.0, "piece",),
  ];
  static List<TrackedFood> snack = [
    TrackedFood("Egg Whites", 95, 22.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 317.5, 0.0, 0.0, 200.0, "g(s)",),
    TrackedFood("Dark Chocolate", 95, 3, 0.4, 2.3, 2.6, 0.0, 0.6, 1.1, 0.0, 0.4, 0.0, 0.0, 1.0, "piece",),
  ];

  Widget foodTiles(List<TrackedFood> foods) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
            shrinkWrap: true,
              itemCount: foods.length,
              itemBuilder: (context, i) {
              return Column(
                children: <Widget>[
                  foodTile(foods[i]),
                ],
              );
          }),
        ),
      ],
    );
  }

  Widget foodTile(TrackedFood food) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage(trackedFood: food,)),
        );
      },
      onDoubleTap: (){},
      child: ListTile(
        title: Title(
          child: Container(
            width: MediaQuery.of(context).size.width * .6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 150,
                        child: Text(food.name , style: TextStyle(
                            fontFamily: "Comfortaa", fontSize: 15),),
                      ),
                      Container(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(food.toMap().containsKey("serving") ? food.toMap()["serving"].toString() : '1', style: TextStyle(
                                fontFamily: "Comfortaa",
                                color: Colors.grey,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w100),),
                            Text(food.toMap().containsKey("unit") ? " " + food.toMap()["unit"] : ' serving', style: TextStyle(
                                fontFamily: "Comfortaa",
                                color: Colors.grey,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w100),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food.toMap().containsKey("carbohydrates") ? "C: " + food.toMap()["carbohydrates"].toString() + " g" : 'C: 0.0 g',
                    style: TextStyle(fontFamily: "Comfortaa", fontSize: 10),),
                    Text(food.toMap().containsKey("protein") ? "P: " + food.toMap()["protein"].toString() + " g" : 'P: 0.0 g',
                      style: TextStyle(fontFamily: "Comfortaa", fontSize: 10),),
                    Text(food.toMap().containsKey("fat") ? "F: " + food.toMap()["fat"].toString() + " g" : 'F: 0.0 g',
                      style: TextStyle(fontFamily: "Comfortaa", fontSize: 10),),
                  ],
                ),
              ],
            ),
          ),
          color: Colors.black,),
      ),
    );
  }

  text(String string) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          string,
        style: TextStyle(fontFamily: "Comfortaa",
            fontSize: 10,
            fontWeight: FontWeight.w500),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CaloriesDonut()),
                          );
                        },
                      ),
                      Text(findWeekDay(new DateTime.now().weekday) + ", " + findMonth(new DateTime.now().month) + " " + new DateTime.now().day.toString(),
                        style: TextStyle(color: Colors.white, fontFamily: "Comfortaa",
                            fontSize: 25,),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250.0,
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 150,
                        child: CaloriesDonut(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                        macroDisplay(meals, "carbohydrates"),
                        macroDisplay(meals, "protein"),
                        macroDisplay(meals, "fat"),
                    ],
                    ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 400,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                  ),
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 450.0,
                          child: ListView.builder(
//                            separatorBuilder: (context, index) => Divider(
//                              color: Color(0xFF21BFBD),
//                            ),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, i) {
                                return Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(meals[i].mealName, style: TextStyle(fontSize: 30.0, fontFamily: "Comfortaa"),),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width / 2 + 80,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[
                                                            Text("C: " + meals[i].calculateCarbs().toString() + " g", style: TextStyle(fontSize: 10.0, fontFamily: "Comfortaa"),),
                                                            Text("P: " + meals[i].calculateProtein().toString() + " g", style: TextStyle(fontSize: 10.0, fontFamily: "Comfortaa"),),
                                                            Text("F: "  + meals[i].calculateFat().toString() + " g", style: TextStyle(fontSize: 10.0, fontFamily: "Comfortaa"),),
                                                            Text("Calories: " + meals[i].calculateCalories().toStringAsFixed(2), style: TextStyle(fontSize: 10.0, fontFamily: "Comfortaa"),),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => SearchDisplay()),
                                                      );
                                                    },
                                                    icon: Icon(Icons.add_circle, color: Color(0xFF21BFBD), size: 40,),
                                                  ),
                                                ],
                                              ),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 1,
                                                  itemBuilder: (context, index) {
                                                    return foodTiles(meals[i].foods);
                                              }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                                },
                              ),
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String findMonth(int month) {
    switch (month) {
      case 1: return "January";
      case 2: return "February";
      case 3: return "March";
      case 4: return "April";
      case 5: return "May";
      case 6: return "June";
      case 7: return "July";
      case 8: return "August";
      case 9: return "September";
      case 10: return "October";
      case 11: return "November";
      case 12: return "December";
    }
    return "January";
  }

  findWeekDay(int weekday) {
    switch (weekday) {
      case 1: return "Sunday";
      case 2: return "Monday";
      case 3: return "Tuesday";
      case 4: return "Wednesday";
      case 5: return "Thursday";
      case 6: return "Friday";
      case 7: return "Saturday";
    }
    return "January";
  }

  String calculateMacros(List<TrackedFood> foods, String s) {
    double macro = 0;
    for (TrackedFood tf in foods) {
      macro += tf.toMap().containsKey(s) ? tf.toMap()[s] : 0;
    }
    return macro.toString() + " g";
  }

  macroDisplay(List<Meal> meals, String s) {
    return Column(
      children: <Widget>[
        Text(s.toUpperCase().substring(0,1), style: TextStyle(fontFamily: "Comfortaa", color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
        Text(calculateTotal(meals, s).toStringAsFixed(2), style: TextStyle(fontFamily: "Comfortaa", color: Colors.white, fontSize: 15,),),
      ],
    );
  }

  double calculateTotal(List<Meal> meals, String s) {
    switch (s) {
      case "carbohydrates": return calculateTotalCarbs(meals);
      break;
      case "protein": return calculateTotalProtein(meals);
      break;
      case "fat": return calculateTotalFat(meals);
      break;
    }
  }

  double calculateTotalCarbs(List<Meal> meals) {
    double carbs = 0;
    for (Meal meal in meals) {
      carbs += meal.calculateCarbs();
    }
    return carbs;
  }

  double calculateTotalProtein(List<Meal> meals) {
    double protein = 0;
    for (Meal meal in meals) {
      protein += meal.calculateProtein();
    }
    return protein;
  }

  double calculateTotalFat(List<Meal> meals) {
    double fat = 0;
    for (Meal meal in meals) {
      fat += meal.calculateFat();
    }
    return fat;
  }

  Map createNewMap() {
    Map<String, double>  dataMap = new Map();
    dataMap.putIfAbsent("Eaten", () => 876);
    dataMap.putIfAbsent("Remaining", () => 234);
    return dataMap;
  }
}
