import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:mobileapp/screens/home/search/search.dart';
import 'package:mobileapp/screens/home/search/silversearch.dart';


class MealDisplay extends StatefulWidget {
  @override
  _MealDisplay createState() => _MealDisplay();
}

class _MealDisplay extends State<MealDisplay> {
  List<String> meals = ["Breakfast", "Lunch", "Dinner", "Snacks"];
  List<List<TrackedFood>> foods = [breakfast, lunch, dinner, snack];
  static List<TrackedFood> breakfast = [
    TrackedFood("Egg Whites", 95, 22.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 317.5, 0.0, 0.0, 200.0, "g(s)",),
    TrackedFood("Dark Chocolate", 95, 3, 0.4, 2.3, 2.6, 0.0, 0.6, 1.1, 0.0, 0.4, 0.0, 0.0, 1.0, "piece",),
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

  Widget _buildMeal(String mealName, List<TrackedFood> foodList) {
    return ListTile(
      title: Text(mealName, style: TextStyle(fontSize: 20.0, fontFamily: "Comfortaa",),),
//      chldren: <Widget>[
//        ListView.builder(
//          itemCount: foodList.length,
//          itemBuilder: (context, i) {
//            return foodTile(foodList[i]);
//          },),
//      ],
    );
//    return InkWell(
//        onTap: () {},
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Container(
//              child: Row(
//                children: [
//                  SizedBox(width: 10.0,),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        mealName,
//                        style: TextStyle(
//                            fontFamily: 'Comfortaa',
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.bold
//                        ),
//                      ),
//                      Container(
//                        width: MediaQuery.of(context).size.width * .6,
//                        height: MediaQuery.of(context).size.height / 4,
//                        child: ListView.separated(
//                          itemCount: foodList.length,
//                          itemBuilder: (context, index) {
//                            return foodList.length == 0 ? IconButton(icon: Icon(Icons.add_circle, color: Colors.black,), onPressed: (){},) : foodTile(foods[index]);
//                          }, separatorBuilder: (BuildContext context, int index) {
//                          return Divider();
//                        },
//                        ),
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(bottom: 8.0),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  IconButton(
//                    icon: Icon(Icons.add_circle, size: 35,),
//                    color: Colors.black,
//                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Sample2()),
//                      );
//                    },
//                  ),
//                  SizedBox(
//                    height: MediaQuery.of(context).size.height / 8,
//                  ),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      text("Carbs: " + calculateMacros(foodList, "carbohydrate")),
//                      text("Protein: " + calculateMacros(foodList, "protein")),
//                      text("Fat: " + calculateMacros(foodList, "fat")),],
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      );
  }

  Widget foodTiles(List<TrackedFood> foods) {
    return Padding(
      padding: const EdgeInsets.only(right: 100.0),
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: foods.length,
          itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              foodTile(foods[i]),
            ],
          );
      }),
    );
  }

  Widget foodTile(TrackedFood food) {
    return ListTile(
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
                        onPressed: (){},
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
                SizedBox(height: 40.0,),
                Container(
                  height: MediaQuery.of(context).size.height - 185.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                  ),
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 250.0,
                          child:
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, i) {
                                return Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(meals[i], style: TextStyle(fontSize: 30.0, fontFamily: "Comfortaa"),),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 1,
                                              itemBuilder: (context, index) {
                                                return foodTiles(foods[i]);
                                          }),
                                        ],
                                      ),
                                    ),
                                    Text("yah"),
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
}
