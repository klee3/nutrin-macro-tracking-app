import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/results.dart';

class SearchDisplay extends StatefulWidget {
  @override
  _SearchDisplay createState() => _SearchDisplay();
}

class _SearchDisplay extends State<SearchDisplay>  with SingleTickerProviderStateMixin{
  TabController controller;
   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     controller = new TabController(length: 4, vsync: this, initialIndex: 0);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF21BFBD),
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(22.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter food item",
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.search, color: Colors.white,),
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
                    VerticalDivider(color: Colors.white,),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.more_vert, color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.home)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Results(),
          Results(),
          Results(),
          Results(),
        ],
      ),
    );
  }
}

