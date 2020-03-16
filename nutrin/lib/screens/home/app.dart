import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/entry.dart';
import 'package:mobileapp/widgets/fridge_carousel.dart';
import 'package:mobileapp/widgets/recipe_carousel.dart';
import 'macro_display.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
//  _TestState createState() => _TestState();
}

class _AppState extends State<App> {
  int _selectedPage = 0;
  final _pageOptions = [MacroDisplay(), StatsDisplay(), FridgeDisplay()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0xFF18D191)),
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Track")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.person), title: Text("Track")),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), title: Text("Stats")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), title: Text("Fridge")),
        ],
      ),
//      MainContent(),
    );
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
