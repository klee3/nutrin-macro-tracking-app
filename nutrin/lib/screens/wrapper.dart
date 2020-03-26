import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/authenticate/authenticate.dart';
import 'package:mobileapp/screens/authenticate/sign_in.dart';
import 'package:mobileapp/screens/home/entry.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/screens/home/app.dart';
import 'package:mobileapp/screens/home/recipe_display.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final user = Provider.of<User>(context);
//
//    // return either Home or Authenticate widget
//    if (user == null) {
//      return Authenticate();
//    } else {
//      return Home();
//    }
  return App();
  }
}
