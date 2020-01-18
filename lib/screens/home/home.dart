import 'package:flutter/material.dart';
import 'package:hunger/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hunger/services/databases.dart';
import 'package:provider/provider.dart';
import 'package:hunger/screens/home/hungers_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().hungers, // stream in database.dart file
      child: Scaffold(
        drawer: Drawer(
          elevation: 0.0,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  radius: 30.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () async {
                  await _auth.signout();
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.blueGrey),
          backgroundColor: Colors.white70,
          title: Text('hungers\'',
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold
            ),
          ),
          elevation: 0.0,
        ),
        body: HungerList(),
      ),
    );
  }
}
