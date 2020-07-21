import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/directory.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/search/createnewfood.dart';
import 'package:mobileapp/services/client.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final String mealName;
  final TrackedFood food;

  FoodPage(this.mealName, this.food);
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    int nutrients = 3;
    return Scaffold(
      backgroundColor: Color(0xFF3C7A89),
      body: Container(
        child: SizedBox.expand(
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.food.name,
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Percent Daily Goals',
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 1, color: Colors.grey[200]),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Nutritional Facts',
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 1, color: Colors.grey[200]),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
