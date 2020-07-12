import 'package:flutter/material.dart';
import 'package:mobileapp/model/user.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'main/settings/settings.dart';
import 'package:mobileapp/services/database.dart';
import 'package:mobileapp/model/tracker.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return StreamProvider<Tracker>.value(
        value: DatabaseService(uid: Provider.of<User>(context).uid).tracker,
        child: Settings(),
      );
    }
  }
}
