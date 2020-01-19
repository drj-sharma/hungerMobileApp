import 'package:flutter/material.dart';
import 'package:hunger/shared/reused.dart';

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
  List<String> _pizzaToppings = [
    'extra cheese',
    'pepperoni',
    'Black olives',
    'Green pepers'
  ];
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          automaticallyImplyLeading: false,
        title: const Text(
          'Update Pizza Setting',
          style: TextStyle(fontSize: 18.0,),
        ),
          centerTitle: true,
    ),
    body: Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Enter name'),
              validator: (val) => val.isEmpty ? 'Please Enter a name' : null,
              onChanged: (val) => setState(() => this._currentName = val),
            ),
            // dropdown
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currentPizzaSize ?? 'small',
              items: this.pizzaSizes.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text('$item size'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentPizzaSize = val),
            ),
            Column(
              children: _pizzaToppings
                  .map(
                    (t) => CheckboxListTile(
                      title: Text(t),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                          print(_currentSomethingElse);
                          if (val == true) {
                            _currentSomethingElse.add(t);
                            print(_currentSomethingElse);
                          }
                        });
                      },
                    ),
                  )
                  .toList(),
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
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
    ));
  }
}
