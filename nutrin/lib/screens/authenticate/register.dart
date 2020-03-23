import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileapp/screens/authenticate/sign_in.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:mobileapp/shared/constants.dart';
import 'package:mobileapp/shared/loading.dart';
import 'package:mobileapp/utilities/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  String error = '';

  Widget _buildEmailSignUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            validator: (val) => val.isEmpty ? 'Enter an email' : null,
            onChanged: (val) {
              setState(() => email = val);
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 15.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
              ),
              hintText: "Enter your email",
              hintStyle: kHintTextStyle.copyWith(
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordSignUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: kLabelStyle.copyWith(color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            validator: (val) => val.isEmpty ? 'Enter a password' : null,
            onChanged: (val) {
              setState(() => password = val);
            },
            obscureText: true,
            style: TextStyle(color: Theme.of(context).primaryColor),
            decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 15),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Enter your password",
                hintStyle: kHintTextStyle.copyWith(
                    color: Theme.of(context).primaryColor)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 120.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: "Comfortaa",
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  _buildEmailSignUp(),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  _buildPasswordSignUp(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15.0,
                                    ),
                                    width: double.infinity,
                                    child: RaisedButton(
                                      elevation: 5.0,
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _authService
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          if (result == null) {
                                            setState(() {
                                              error =
                                                  'Could not sign up with those credentials';
                                              loading = false;
                                            });
                                          }
                                        }
                                      },
                                      padding: EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 1.5,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Comfortaa",
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => widget.toggleView(),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Already have an account? ',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Sign in',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
//      backgroundColor: Colors.green[200],
//      appBar: AppBar(
//        backgroundColor: Colors.green[500],
//        elevation: 0.0,
//        title: Text('Register for Nutrin'),
//        actions: <Widget>[
//          FlatButton.icon(
//              onPressed: () {
//                widget.toggleView();
//              },
//              icon: Icon(Icons.person),
//              label: Text('Sign in'))
//        ],
//      ),
//      body: Container(
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//        child: Form(
//          key: _formKey,
//          child: Column(
//            children: <Widget>[
//              SizedBox(height: 20.0),
//              TextFormField(
//                decoration: textInputDecorationEmail,
//                // TODO: should check using regex
//                validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                onChanged: (val) {
//                  setState(() => email = val);
//                },
//              ),
//              SizedBox(height: 20.0),
//              TextFormField(
//                decoration: textInputDecorationPassword,
//                obscureText: true,
//                validator: (val) =>
//                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
//                onChanged: (val) {
//                  setState(() => password = val);
//                },
//              ),
//              SizedBox(height: 20.0),
//              RaisedButton(
//                color: Colors.blueGrey[400],
//                child: Text(
//                  'Register',
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () async {
//                  if (_formKey.currentState.validate()) {
//                    setState(() => loading = true);
//                    dynamic result = await _authService
//                        .registerWithEmailAndPassword(email, password);
//                    if (result == null) {
//                      // TODO: different error message for already exists etc.
//                      setState(() {
//                        error = 'Please supply a valid email';
//                        loading = false;
//                      });
//                    }
//                  }
//                },
//              ),
//              SizedBox(
//                height: 12.0,
//              ),
//              Text(
//                error,
//                style: TextStyle(color: Colors.red, fontSize: 14.0),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
  }
}
