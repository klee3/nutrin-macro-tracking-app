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
  final _searchFormkey = GlobalKey<FormState>();
  var myController = TextEditingController();
  String _searchText = "";
  Future<List<TrackedFood>> searchResults;
  var client = FoodClient();

  // @protected
  // @mustCallSuper
  // void didChangeDependencies() {}

  @override
  void initState() {
    super.initState();

    myController.addListener(() {
      buttons();
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  Widget buttons() {
    if (myController.text == "") {
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
          myController.clear();
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
                                controller: myController,
                                onChanged: (value) {
                                  print(myController.text);
                                  client.foodQueryForId("cheese");
                                  // setState(() {
                                  //   searchResults =
                                  //       client.foodQueryWithId(_searchText);
                                  // });
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
          FutureBuilder<List<TrackedFood>>(
            future: searchResults,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child:
                        Container(width: 100, height: 100, child: Text("YEs")));
              } else {
                return Center(
                  child: Container(
                      child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white30),
                  )),
                );
              }
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(widget.mealName.substring(0, 1).toUpperCase() +
            widget.mealName.substring(1, widget.mealName.length)),
      ),
    );
  }
}
