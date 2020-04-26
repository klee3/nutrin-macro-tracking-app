import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/authenticate/authenticate.dart';
import 'package:mobileapp/screens/authenticate/sign_in.dart';
import 'package:mobileapp/screens/home/food_details.dart';
import 'package:mobileapp/screens/home/search/search.dart';
import 'package:mobileapp/screens/home/search/silversearch.dart';
import 'package:mobileapp/screens/home/user_stats.dart';
import 'package:mobileapp/screens/home/meal_display.dart';
import 'package:mobileapp/screens/extra/app.dart';
import 'package:mobileapp/screens/home/meal_display.dart';
import 'package:mobileapp/screens/extra/meal_tile.dart';
import 'package:mobileapp/screens/extra/recipe_display.dart';
import 'package:mobileapp/screens/user%20introduction/new_sign_up_decision.dart';
import 'package:mobileapp/screens/user%20introduction/user_activity_levels.dart';
import 'package:mobileapp/screens/user%20introduction/user_input_macros.dart';
import 'package:mobileapp/screens/user%20introduction/user_weight_goals.dart';
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
  return Sample2();
  }
}
  