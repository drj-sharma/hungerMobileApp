import 'package:flutter/material.dart';
import 'package:hunger/services/databases.dart';
import 'package:hunger/shared/loading.dart';
import 'package:hunger/shared/reused.dart';
import 'package:provider/provider.dart';
import 'package:hunger/models/user.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final List<String> pizzaSizes = ['small', 'medium', 'large'];

  // form fields/values
  String _currentName;
  String _currentPizzaSize;
  List<String> _currentSomethingElse = [];
  Map<String, bool> _pizzaToppings = {
    'Extra cheese': false,
    'Pepperoni': false,
    'Black olives': false,
    'Green pepers': false
  };
  bool _isChecked = true;
  List checking = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    // context is used to get location to help the builder to  build the widget
    final user = Provider.of<User>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          automaticallyImplyLeading: false,
          title: const Text(
            'Update Pizza Setting',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<UserData>(
            // stream-function
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              UserData userData = snapshot.data;
              return snapshot.hasData
                  ? SingleChildScrollView(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              initialValue: userData.name,
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'Enter name'),
                              validator: (val) =>
                                  val.isEmpty ? 'Please Enter a name' : null,
                              onChanged: (val) =>
                                  setState(() => this._currentName = val),
                            ),
                            // dropdown
                            DropdownButtonFormField(
                              decoration: textInputDecoration,
                              value: _currentPizzaSize ?? userData.pizzaSize,
                              items: this
                                  .pizzaSizes
                                  .map<DropdownMenuItem<String>>((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text('$item size'),
                                );
                              }).toList(),
                              onChanged: (val) =>
                                  setState(() => _currentPizzaSize = val),
                            ),
                            ListView(
                              shrinkWrap: true,
                              children: _pizzaToppings.keys.map((String key) {
                                return SwitchListTile(
                                  title: Text(key),
                                  value: _pizzaToppings[key],
                                  onChanged: (bool value) {
                                    setState(() {
                                      print(_currentSomethingElse);
                                      _pizzaToppings[key] = value;
                                      if (value) {
                                        print(key);
                                        _currentSomethingElse.add(key);
                                        print(_currentSomethingElse);
                                      } else {
                                        _currentSomethingElse.remove(key);
                                      }
                                    });
                                  },
                                );
                              }).toList(),
                            ),
//          Slider(
//            value: 5.0,
//            min: 1.0,
//            max: 10.0,
//
//            activeColor: Colors.red,
//            inactiveColor: Colors.deepPurpleAccent,
//            divisions: 9,
//          ),
                            SizedBox(
                              height: 10.0,
                            ),
                            FlatButton.icon(
                              color: Colors.deepPurpleAccent,
                              onPressed: () async {
                                print(this._currentName);
                                print(this._currentPizzaSize);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              icon: Icon(
                                Icons.update,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Loading();
            }));
  }
}
