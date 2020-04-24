import 'package:flutter/material.dart';
import 'package:mobileapp/model/meal.dart';
import 'package:mobileapp/widgets/fridge_carousel.dart';
import 'package:mobileapp/widgets/recipe_carousel.dart';

class MealTile extends StatelessWidget {
  final Meal meal;

  MealTile({this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
          height: 170.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: []
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      meal.mealName,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
//    return Padding(
//      padding: EdgeInsets.only(top: 8.0),
//      child: Card(
//        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
//        child: ListTile(
//          title: Text(meal.mealName),
//          subtitle: Text('Foods: ${meal.foods.toString()}'),
//        ),
//      ),
//    );
  }
}

class FridgeDisplay extends StatefulWidget {
  @override
  _FridgeDisplayState createState() => _FridgeDisplayState();
}

class _FridgeDisplayState extends State<FridgeDisplay> {
  int _selectedIndex = 0;
  List<IconData> _icons = [
    Icons.free_breakfast,
    Icons.fastfood,
    Icons.local_pizza,
    Icons.cake,
    Icons.add_shopping_cart,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                "Explore",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
              )
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            RecipeCarousel(),
            SizedBox(
              height: 20.0,
            ),
            FridgeCarousel(),
          ],
        ),
      ),
    );
  }
}
