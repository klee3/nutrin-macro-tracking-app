import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sample2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                  expandedHeight: 150,
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, index) => ListTile(
                  title: Text("Index: $index"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          "https://www.solidbackgrounds.com/images/4096x2304/4096x2304-french-sky-blue-solid-color-background.jpg",
          fit: BoxFit.cover,
        ),
        Center(
          child: Row(
//            children: <Widget>[
////              Opacity(
////                opacity: shrinkOffset / expandedHeight,
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  child: Padding(
//                    padding: const EdgeInsets.only(right: 200, left: 20),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Icon(Icons.arrow_back_ios, color: Colors.white,),
//                        Text(
//                          "Breakfast",
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontWeight: FontWeight.w500,
//                            fontSize: 23,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
////              ),
//            ],
          ),
        ), 
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 200, left: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios, color: Colors.white,),
                    Text(
                      "Breakfast",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
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
        Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width / 4,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: (1 - shrinkOffset / expandedHeight),
              child: macros(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  macros() {
    return Container(
      height: 80,
      width: 200,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Color(0xFF21BFBD),),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text("Macros", style: TextStyle(color: Colors.black),
    ),
      ),
  );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;
}

