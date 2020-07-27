import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/directory.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/search/createnewfood.dart';
import 'package:mobileapp/screens/search/foodpage.dart';
import 'package:mobileapp/services/client.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String mealName;
  const SearchPage(this.mealName);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode myFocusNode = FocusNode();
  final _searchFormkey = GlobalKey<FormState>();
  var _searchQuery = TextEditingController();
  bool _isSearching = false;
  String _error;
  List<int> _results = List();
  List<TrackedFood> userFoods;
  FutureBuilder<List<TrackedFood>> searchResults;
  Timer debounceTimer;

  @override
  void initState() {
    super.initState();

    _searchQuery.addListener(() {
      buttons();
    });
  }

  _SearchPageState() {
    _searchQuery.addListener(() {
      if (debounceTimer != null) {
        debounceTimer.cancel();
      }
      debounceTimer = Timer(Duration(milliseconds: 500), () {
        if (this.mounted) {
          performSearch(_searchQuery.text);
        }
      });
    });
  }

  void performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _error = null;
        _results = List();
      });
      return;
    }
    setState(() {
      _isSearching = true;
      _error = null;
      _results = List();
    });

    var client = FoodClient();
    final foods = await client.foodQueryForId(query);
    if (this._searchQuery.text == query && this.mounted) {
      setState(() {
        _isSearching = false;
        if (foods != null) {
          _results = foods;
        } else {
          _error = 'An error has occured.';
        }
      });
    }
  }

  Widget buttons() {
    if (_searchQuery.text == "") {
      return Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              var client = FoodClient();
              client.foodQueryForId("Yes");
            },
          ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: () {
          _searchQuery.clear();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * .25,
          child: Text(
            "CANCEL",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return StreamProvider.value(
      value: DatabaseService(uid: user.uid).tracker,
      child: searchPage(context),
    );
  }

  Widget searchPage(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateNewFoodPage(widget.mealName),
                ),
              );
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.add,
              size: 35,
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemBuilder: (BuildContext context, int index) {}),
              myFoodsView(),
            ],
          ),
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(tabs: <Widget>[
              Tab(
                text: 'SEARCH',
              ),
              Tab(
                text: "MY FOODS",
              ),
            ]),
            title: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                      child: Text(
                          widget.mealName.substring(0, 1).toUpperCase() +
                              widget.mealName
                                  .substring(1, widget.mealName.length))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Form(
                          key: _searchFormkey,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * .65,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: TextField(
                                        autofocus: true,
                                        controller: _searchQuery,
                                        onChanged: (value) {
                                          print(_searchQuery.text);
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        buttons(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView myFoodsView() {
    return ListView.builder(
        itemCount: userFoods == null ? 1 : userFoods.length,
        itemBuilder: (BuildContext context, int index) {
          var tracker = Provider.of<Tracker>(context);
          userFoods = tracker.directory.foods;
          TrackedFood food = userFoods[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodPage(widget.mealName, food),
                  ),
                );
              },
              title: Text(food.name),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(food.serving + " " + food.unit),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(food.carbohydrates +
                      "C " +
                      food.protein +
                      "P " +
                      food.fat +
                      "F "),
                  Text(food.calculateCalories() + " CAL"),
                ],
              ),
            ),
          );
        });
  }

  Widget buildBody(BuildContext context) {
    if (_isSearching) {
      return Container(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white30),
        ),
      );
    } else if (_error != null) {
      return Container(
        height: 100,
        width: 100,
        child: Text(_error),
      );
    } else if (_searchQuery.text.isEmpty) {
      return Container(
        height: 100,
        width: 100,
        child: Text("Begin search by typing in seach bar"),
      );
    } else {
      return ListView.builder(
          itemCount: _results.length,
          padding: EdgeInsets.symmetric(vertical: 8.0),
          itemBuilder: (BuildContext context, int index) {
            return Text(index.toString());
          });
    }
  }
}
