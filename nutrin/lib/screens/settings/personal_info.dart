import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var tracker = Provider.of<Tracker>(context);
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(user.uid),
                Text(tracker.personalNutrients.containsKey("Carbs")
                    ? tracker.personalNutrients["carbs"].toString()
                    : "0"),
                textField("Carbs"),
                textField("Protein"),
                textField("Fat"),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Macros have changed."),
                        ),
                      );
                    }
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Macros have been set to default"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget textField(String name) {
  return Column(
    children: <Widget>[
      Text(name),
      TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a number.';
          }
          return null;
        },
      ),
    ],
  );
}
