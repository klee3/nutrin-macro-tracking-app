import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/settings.dart';
import 'package:mobileapp/screens/home/user_stats.dart';
import '../home/meal_display.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
//  _TestState createState() => _TestState();
}

class _AppState extends State<App> {
  int _selectedPage = 0;
  final _pageOptions = [MealDisplay(), StatsDisplay(), Settings()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Track"), backgroundColor: Color(0xFF21BFBD),),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), title: Text("Stats")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
//      MainContent(),
    );
  }
}