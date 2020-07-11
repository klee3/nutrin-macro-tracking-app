import 'package:flutter/material.dart';
import 'package:mobileapp/model/user.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'home/settings.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
  