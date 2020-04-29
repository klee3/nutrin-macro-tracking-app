import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/app.dart';
import 'package:mobileapp/screens/home/search/results.dart';

class SearchDisplay extends StatefulWidget {
  @override
  _SearchDisplay createState() => _SearchDisplay();
}

class _SearchDisplay extends State<SearchDisplay>  with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Color(0xFF21BFBD),
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(50, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(22.0)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter food item",
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.mic, color: Colors.white,),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.search, color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Results(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Color(0xFF21BFBD),
        ),
      ),
    );
  }
}


