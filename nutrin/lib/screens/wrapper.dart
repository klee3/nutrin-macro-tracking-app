import 'package:flutter/material.dart';
import 'package:mobileapp/main.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/home/app.dart';
import 'package:mobileapp/screens/home/test_meal_display.dart';
import 'package:mobileapp/screens/user%20introduction/graph.dart';
import 'package:mobileapp/screens/user%20introduction/new_sign_up_decision.dart';
import 'package:mobileapp/screens/user%20introduction/veggies.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final user = Provider.of<User>(context);

   // return either Home or Authenticate widget
  //  if (user == null) {
  //    return Authenticate();
  //  } else {
  //    return Home();
  //  }
  return Veggie();
  }
}
  