import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MealDisplay extends StatefulWidget {
  @override
  _MealDisplay createState() => _MealDisplay();
}

class _MealDisplay extends State<MealDisplay> {
  List<String> meals = ["Breakfast", "Lunch", "Dinner", "Snacks"];

  Widget _buildMealItem(String mealName) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        mealName,
                        style: TextStyle(
                          fontFamily: 'Comfortaa',

                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Colors.black,
                  onPressed: (){},
                ),
                text("Carbs:"),
                text("Protein:"),
                text("Fat:"),
              ],
            ),
          ],
        ),
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
      body: ListView(
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
                      fontSize: 30,),
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
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: ListTile.divideTiles(
                        context: context,
                        tiles:  [
                          _buildMealItem(meals[0]),
                          _buildMealItem(meals[1]),
                          _buildMealItem(meals[2]),
                          _buildMealItem(meals[3]),
                        ],
                      ).toList(),),),),
              ],
            ),
          ),
        ],
      ),
    );

//    return Scaffold(
//      appBar: AppBar(
//        title:  Center(
//          child: Text(
//            new DateTime.now().toIso8601String().substring(0, 9),
//          ),
//        ),
//      ),
//      body: Column(
//        children: <Widget>[
//          Stack(
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.symmetric(horizontal: 10.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[],
//                ),
//              ),
//            ],
//          ),
//          Expanded(
//            child: ListView.builder(
//              itemCount: meals.length,
//              itemBuilder: (BuildContext context, int index) {
//                String meal = meals[index];
//                return Stack(
//                  children: <Widget>[
//                    Container(
//                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
//                      height: 170.0,
//                      width: double.infinity,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(20.0),
//                      ),
//                      child: Padding(
//                        padding: EdgeInsets.all(20.0),
//                        child: Column(
//                          children: <Widget>[
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Text(
//                                  meal,
//                                  style: TextStyle(
//                                      fontSize: 18.0,
//                                      fontWeight: FontWeight.w600),
//                                ),
//                              ],
//                            ),
//                            SizedBox(
//                              height: 10.0,
//                            ),
//                            Column(
//                              children: <Widget>[
//                                Container(
//                                  width: MediaQuery.of(context).size.width,
//                                  decoration: BoxDecoration(
//                                    color: Theme.of(context).accentColor,
//                                    borderRadius: BorderRadius.circular(10.0),
//                                  ),
//                                  alignment: Alignment.center,
//                                  child: Text("Apple"),
//                                ),
//                                SizedBox(
//                                  height: 5.0,
//                                ),
//                                Container(
//                                  width: MediaQuery.of(context).size.width,
//                                  decoration: BoxDecoration(
//                                    color: Theme.of(context).accentColor,
//                                    borderRadius: BorderRadius.circular(10.0),
//                                  ),
//                                  alignment: Alignment.center,
//                                  child: Text("Cheese"),
//                                ),
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                );
//              },
//            ),
//          ),
//        ],
//      ),
//    );
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
}
