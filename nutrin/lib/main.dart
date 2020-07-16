import 'package:flutter/material.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/wrapper.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:mobileapp/model/tracker.dart';
import 'package:mobileapp/services/database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
        // StreamProvider<Tracker>.value(
        //   value: DatabaseService(uid: Provider.of<User>(context).uid).tracker,
        // ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFF3C7A89),
          textTheme: TextTheme(
            headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          ),
        ),
        home: Wrapper(),
      ),
    );
  }
}
