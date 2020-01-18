import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HungerList extends StatefulWidget {
  @override
  _HungerListState createState() => _HungerListState();
}

class _HungerListState extends State<HungerList> {
  @override
  Widget build(BuildContext context) {
    final hungers = Provider.of<QuerySnapshot>(context);
    // print(hungers.documents);
    for (var doc in hungers.documents) {
      print(doc.data);
    }
    return Container();
  }
}
