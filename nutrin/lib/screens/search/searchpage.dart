import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  final String mealName;
  const SearchPage(this.mealName);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formkey = GlobalKey<FormState>();
  final textEditingController = new TextEditingController();
  String _searchText = "";
  List names = <String>[];
  List filteredNames = <String>[];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text("Add Food");

  void _getFoods() async {
    var url = 'https://swapi.co/api/people';
    final response = await http.get(url);
    List tempList = [];
    print(response.body);
  }

  Widget searchResults() {}

  Widget buttons() {
    if (_searchText == "") {
      return Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _getFoods();
            },
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      );
    } else {
      return Container(
        child: Text("CANCEL"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Form(
                  key: _formkey,
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
          )
        ],
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20.0),
      //     child: SearchBar(
      //       onSearch: search,
      //       onItemFound: (TrackedFood food, int index) {
      //         return InkWell(
      //           onTap: () => print("Hello"),
      //           child: ListTile(
      //             title: Text(food.name),
      //             subtitle: Text(food.serving + " " + food.unit),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        title: Text("Add Food"),
      ),
    );
  }

  // Future<List<TrackedFood>> search(String search) async {
  //   await Future.delayed(Duration(seconds: 2));
  //   return List.generate(search.length, (int index) {
  //     return TrackedFood("Apple", "25", "3", "1", "80", "g");
  //   });
  // }
}
