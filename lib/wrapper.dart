import 'package:flutter/material.dart';
import 'package:hunger/screens/home/home.dart';
import 'package:hunger/screens/authentication/authentication.dart';
import 'package:provider/provider.dart';
import 'package:hunger/models/user.dart';
import 'package:hunger/screens/authentication/sign_in.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    // either return home or authentication
    print(user);
    return user == null ? Auth() : Home();
  }
}
