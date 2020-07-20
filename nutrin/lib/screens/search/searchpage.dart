import 'dart:async';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:mobileapp/screens/search/createnewfood.dart';
import 'package:mobileapp/services/client.dart';

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
  List<TrackedFood> _results = List();
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

    final foods = await FoodClient.foodQueryWithId(query);
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
            onPressed: () {},
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNewFoodPage(),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
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
                              color: Colors.grey[300],
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            width: MediaQuery.of(context).size.width * .65,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                autofocus: true,
                                controller: _searchQuery,
                                onChanged: (value) {
                                  print(_searchQuery.text);
                                },
                                decoration:
                                    InputDecoration(border: InputBorder.none),
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
          buildBody(context),
          // FutureBuilder<List<TrackedFood>>(
          //   future: searchResults,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Expanded(
          //           child:
          //               Container(width: 100, height: 100, child: Text("YEs")));
          //     } else {
          //       return Center(
          //         child: Container(
          //             child: CircularProgressIndicator(
          //           backgroundColor: Theme.of(context).primaryColor,
          //           valueColor: AlwaysStoppedAnimation<Color>(Colors.white30),
          //         )),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
      appBar: AppBar(
        title: Text(widget.mealName.substring(0, 1).toUpperCase() +
            widget.mealName.substring(1, widget.mealName.length)),
      ),
    );
  }

  Widget buildBody(BuildContext context) {}
}
