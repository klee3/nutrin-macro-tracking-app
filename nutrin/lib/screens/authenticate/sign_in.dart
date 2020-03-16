import 'package:flutter/material.dart';
import 'package:mobileapp/services/auth.dart';
import 'package:mobileapp/shared/constants.dart';
import 'package:mobileapp/shared/loading.dart';
import 'package:mobileapp/utilities/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = "";
  String password = "";

  String error = '';

  bool _rememberMe = false;

  Widget _buildEmail() {
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
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: "Enter your email",
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: "Enter your password",
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Forgot password button pressed"),
        padding: EdgeInsets.only(right: 0.8),
        child: Text(
          "Forgot password",
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25.0,
      ),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print("Login button pressed"),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Color(0xFF93e5ab),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Comfortaa",
          ),
        ),
      ),
    );
  }

  Widget _buildSignInwithFBGMBtn() {
    return Column(
      children: <Widget>[
        Text(
          "- OR -",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Sign in with",
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildRememberMeBtn() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            "Remember me",
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButton(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(
              image: logo,
            )),
      ),
    );
  }

  Widget _buildSocialMediaRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialMediaButton(
                  () => print("Login with Facebook"),
              AssetImage('assets/fbfb.png')),
          _buildSocialMediaButton(
                  () => print("Login with Google"),
              AssetImage('assets/gmail.png')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF4e878c),
                  Color(0xFF65b891),
                  Color(0xFF93e5ab),
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Comfortaa",
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildEmail(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildPassword(),
                  _buildForgotPasswordBtn(),
                  _buildRememberMeBtn(),
                  _buildLoginBtn(),
                  _buildSignInwithFBGMBtn(),
                  _buildSocialMediaRow(),
             
                ],
              ),
            ),
          ),
        ],
      ),
    );
//    return loading ? Loading() : Scaffold(
//      backgroundColor: Colors.green[200],
//      appBar: AppBar(
//        backgroundColor: Colors.green[500],
//        elevation: 0.0,
//        title: Text('Sign in to Nutrin'),
//        actions: <Widget>[
//          FlatButton.icon(
//              onPressed: () {
//                widget.toggleView();
//              },
//              icon: Icon(Icons.person),
//              label: Text('Register'))
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
//                validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                onChanged: (val) {
//                  setState(() => email = val);
//                },
//              ),
//              SizedBox(height: 20.0),
//              TextFormField(
//                decoration: textInputDecorationPassword,
//                obscureText: true,
//                validator: (val) => val.isEmpty ? 'Enter a password' : null,
//                onChanged: (val) {
//                  setState(() => password = val);
//                },
//              ),
//              SizedBox(height: 20.0),
//              RaisedButton(
//                color: Colors.blueGrey[400],
//                child: Text(
//                  'Sign in',
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () async {
//                  if (_formKey.currentState.validate()) {
//                    setState(() => loading = true);
//                    dynamic result = await _authService
//                        .signInWithEmailAndPassword(email, password);
//                    if (result == null) {
//                      setState(() {
//                        error = 'Could not sign in with those credentials';
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
//
//// button for anon sign in
////        child: RaisedButton(
////          child: Text('Sign in'),
////          onPressed: () async {
////            dynamic result = await _authService.signInAnon();
////            if (result == null) {
////              print('Error signing in');
////            } else {
////              print('Signed in');
////              print(result.uid);
////            }
////          },
////        ),
//      ),
//    );
  }
}
