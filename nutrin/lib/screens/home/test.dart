import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
//  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int _selectedPage = 0;
  final _pageOptions = [MainContent(), EntryScreen(),MainContent()];

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
              icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), title: Text("Fridge")),
        ],
      ),
//      MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: new Container(
            child: new Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Text(
                      new DateTime.now().toIso8601String().substring(0,10),
                      style: TextStyle(fontSize: 30.0, fontFamily: 'Comfortaa'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: new Container(
                          height: 150.0,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(25.0),
                              color: Color(0xFF05668d)),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(
                                Icons.free_breakfast,
                                color: Colors.white,
                              ),
                              new Text(
                                "Breakfast",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: "Comfortaa"),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: new Container(
                          height: 150.0,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(25.0),
                              color: Color(0xFF05668d)),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(
                                Icons.fastfood,
                                color: Colors.white,
                              ),
                              new Text(
                                "Lunch",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: "Comfortaa"),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: new Container(
                          height: 150.0,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(25.0),
                              color: Color(0xFF05668d)),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(
                                Icons.cake,
                                color: Colors.white,
                              ),
                              new Text(
                                "Dinner",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: "Comfortaa"),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  int _selectedIndex = 0;
  List<IconData> _icons = [
    Icons.free_breakfast,
    Icons.fastfood,
    Icons.local_pizza,
    Icons.add_shopping_cart,
    Icons.cake,
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
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                "What would you like to do today?",
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
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Your Fridge",
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5)),
                      Text("See all",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
