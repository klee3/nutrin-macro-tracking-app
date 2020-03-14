import 'package:flutter/material.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/wrapper.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
