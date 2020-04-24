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
                          fontFamily: 'OpenSans',

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
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: (){},
                ),
                text("Carbs"),
                text("Protein"),
                text("Fate"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget text(String text) {
    return Text(
      text + ":",
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 12.0,
          fontWeight: FontWeight.w200,
      ),
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
                Text("April 25",
                  style: TextStyle(color: Colors.white, fontFamily: "OpenSans",
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
                    child: ListView( children: [
                      _buildMealItem(meals[0]),
                      _buildMealItem(meals[1]),
                      _buildMealItem(meals[2]),
                      _buildMealItem(meals[3]),
                    ],),),),
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
}
