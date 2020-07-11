import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:mobileapp/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
//    return StreamProvider<Tracker>.value(
//      value: DatabaseService(uid: Provider.of<User>(context).uid).tracker,
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings, color: Colors.black,),
        title: Text("Settings",
          style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: "Comfortaa"),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Comfortaa"),))
        ],
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('View profile', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Change macros', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Generate macros', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Edit profile', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Display', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Macros', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Calories', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Connect to Facebook', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Connect to Gmail', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('About', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Terms and Conditions', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Privacy Policy', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Support', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
            ListTile(
              title: Text('Change password', style: TextStyle(fontFamily: "Comfortaa"),),
            ),
          ],
        ).toList(),
      ),
    );
//    );
  }
}