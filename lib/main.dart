import 'package:flutter/material.dart';
import 'package:hunger/services/auth.dart';
import 'package:hunger/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:hunger/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Courier',
        ),
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}