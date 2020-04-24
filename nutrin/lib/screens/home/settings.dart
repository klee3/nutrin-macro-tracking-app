//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//
//class Settings extends StatefulWidget {
//  @override
//  _Settings createState() => _Settings();
//}
//
//class _Settings extends State<Settings> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold();
//  }
//}

import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
//    return StreamProvider<Tracker>.value(
//      value:  DatabaseService(uid: Provider.of<User>(context).uid).tracker,
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => print("pressed"),
            color: Colors.black,
          ),
          title: Text("Settings",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
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
    );
  }
}
