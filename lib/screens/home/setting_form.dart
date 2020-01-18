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
  String _currentSomethingElse;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your setting',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Enter name'),
            validator: (val) => val.isEmpty ? 'Please Enter a name' : null,
            onChanged: (val) => setState(() => this._currentName = val),
          ),
          SizedBox(height: 10.0),
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
          SizedBox(
            height: 10.0,
          ),
          FlatButton.icon(
            color: Colors.white,
            onPressed: () async {
              print(this._currentName);
              print(this._currentPizzaSize);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            icon: Icon(Icons.update),
            label: Text('Update'),
          )
        ],
      ),
    );
  }
}
