import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:provider/provider.dart';

import 'meal_tile.dart';

class TrackerDisplay extends StatefulWidget {
  @override
  _TrackerDisplayState createState() => _TrackerDisplayState();
}

class _TrackerDisplayState extends State<TrackerDisplay> {
  @override
  Widget build(BuildContext context) {
    final tracker = Provider.of<Tracker>(context);

    return ListView.builder(
      itemCount: tracker.meals.length,
      itemBuilder: (context, index) {
        return MealTile(meal: tracker.meals[index]);
      },
    );
  }
}
