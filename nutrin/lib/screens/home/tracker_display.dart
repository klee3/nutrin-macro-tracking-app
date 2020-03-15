import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:provider/provider.dart';

class TrackerList extends StatefulWidget {
  @override
  _TrackerListState createState() => _TrackerListState();
}

class _TrackerListState extends State<TrackerList> {
  @override
  Widget build(BuildContext context) {
    final tracker = Provider.of<Tracker>(context);

    return ListView.builder(
        itemCount: 3,
      itemBuilder: (context, index) {

      },
    );
  }
}
