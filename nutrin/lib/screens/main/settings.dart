import 'package:flutter/material.dart';
import 'package:mobileapp/services/auth.dart';

class Settings extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: "Comfortaa"),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person),
              label: Text(
                'Log Out',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: "Comfortaa"),
              ))
        ],
      ),
    );
  }
}
