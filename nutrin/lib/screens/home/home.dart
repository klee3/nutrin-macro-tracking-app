import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';
import 'tracker_display.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Tracker>.value(
      value: DatabaseService(uid: Provider.of<User>(context).uid).tracker,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text('Nutrin'),
          backgroundColor: Colors.green[500],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _authService.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Log Out'))
          ],
        ),
        body: TrackerDisplay(),
      ),
    );
  }
}
