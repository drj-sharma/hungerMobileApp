import 'package:flutter/material.dart';
import 'package:hunger/models/objectModel.dart';

class ItemTile extends StatelessWidget {

  final ItemObject item;
  ItemTile({this.item});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 2.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.white10,
            backgroundImage: AssetImage('assets/pizza.png'),
          ),
          title: Text(item.name),
          subtitle: Text('Take ${item.pizzaSize} pizza'),
        ),
      ),
    );
  }
}
