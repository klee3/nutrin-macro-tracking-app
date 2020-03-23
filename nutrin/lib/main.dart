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
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: Color(0xFFFFb700),
            accentColor: Colors.lightBlue[100],

            // Define the default font family.
//            fontFamily: 'Comfortaa',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: TextTheme(
              headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            ),
          ),
        home: Wrapper(),
      ),
    );
  }
}
