import 'package:flutter/material.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';

class Settings extends StatelessWidget {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  var carbs = 0;
  var protein = 0;
  var fat = 0;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var tracker = Provider.of<Tracker>(context);

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
        body: Form(
          key: _formkey,
          child: Container(
            height: 200,
            width: 400,
            child: Column(
              children: <Widget>[
                Text(user.uid),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    macroTextFeild("carbohydrates", tracker),
                    macroTextFeild("protein", tracker),
                    macroTextFeild("fat", tracker),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        child: Text("Set New Macros"),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Macros have changed."),
                              ),
                            );
                          }
                        }),
                    RaisedButton(
                        child: Text("Set To Default"),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Macros have been set to default"),
                            ),
                          );
                        })
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget macroTextFeild(String name, Tracker tracker) {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        children: <Widget>[
          Text(name),
          TextFormField(
            initialValue: tracker.personalNutrients.containsKey(name)
                ? tracker.personalNutrients[name].round().toString()
                : 0.toString(),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a number.';
              }
              tracker.personalNutrients.containsKey(name)
                  ? tracker.personalNutrients[name] = double.parse(value)
                  : tracker.personalNutrients
                      .putIfAbsent(name, () => double.parse(value));
              return null;
            },
          ),
        ],
      ),
    );
  }
}
