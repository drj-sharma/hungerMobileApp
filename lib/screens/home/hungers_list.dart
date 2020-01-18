import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hunger/models/objectModel.dart';
import 'package:hunger/screens/home/item_tile.dart';

class HungerList extends StatefulWidget {
  @override
  _HungerListState createState() => _HungerListState();
}

class _HungerListState extends State<HungerList> {
  @override
  Widget build(BuildContext context) {
    final hungers = Provider.of<List<ItemObject>>(context);
    // print(hungers.documents);
    hungers.forEach((hungers) {
      print(hungers.name);
      print(hungers.pizzaSize);
      print(hungers.somethingElse);
    });
    return ListView.builder(
      itemCount: hungers.length,
      itemBuilder: (context, index) {
        return ItemTile(item: hungers[index]);
      },
    );
  }
}
