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
          title: Text(
            "Settings",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: "OpenSans"),
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
                      fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
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
                Container(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Change Macros",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
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
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        child: Text(
                          "SET NEW MACROS",
                          style: TextStyle(
                              fontFamily: 'OpenSans', color: Colors.white),
                        ),
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
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        child: Text(
                          "SET DEFAULT",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Theme.of(context).primaryColor),
                        ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name.length > 7
                  ? name.toUpperCase().substring(0, 4) + "S"
                  : name.toUpperCase(),
              style: TextStyle(
                  fontFamily: "OpenSans", fontWeight: FontWeight.bold),
            ),
          ),
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
