import 'package:flutter/material.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:mobileapp/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = "";
  String password = "";

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        elevation: 0.0,
        title: Text('Sign in to Nutrin'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecorationEmail,
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecorationPassword,
                obscureText: true,
                validator: (val) => val.isEmpty ? 'Enter a password' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blueGrey[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _authService
                        .signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'Could not sign in with those credentials');
                    }
                  }
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),

// button for anon sign in
//        child: RaisedButton(
//          child: Text('Sign in'),
//          onPressed: () async {
//            dynamic result = await _authService.signInAnon();
//            if (result == null) {
//              print('Error signing in');
//            } else {
//              print('Signed in');
//              print(result.uid);
//            }
//          },
//        ),
      ),
    );
  }
}
