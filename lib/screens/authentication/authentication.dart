import 'package:flutter/material.dart';
import 'package:hunger/screens/authentication/register.dart';
import 'package:hunger/screens/authentication/sign_in.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return SignIn(toggleValue: toggleView);
    } else {
      return Register(toggleValue: toggleView);
    }
  }
}
