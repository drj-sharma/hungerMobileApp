import 'package:flutter/material.dart';
import 'package:hunger/services/auth.dart';
import 'package:hunger/shared/reused.dart';

class Register extends StatefulWidget {
  final Function toggleValue;
  Register({this.toggleValue});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();
  final Authservice _auth = Authservice();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(color: Colors.white,
              onPressed: () {
                widget.toggleValue();
              }, icon: Icon(Icons.person), label: Text('SignIn'))
        ],
        title: Text('register',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0,),
                    TextFormField(
                      validator: (arg) => arg.isEmpty ? 'must be filled': null,
                      cursorColor: Colors.deepPurple,
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                      textDirection: TextDirection.ltr, // btw its Default but can change to rtl
                      onChanged: (val) {
                        setState(() => this.email = val);
                      },
                    ),
                    SizedBox(height: 15.0,),
                    TextFormField(
                      validator: (arg) => (arg.length < 8) ? 'at least 8 char long': null,
                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      cursorColor: Colors.deepPurple,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => this.password = val);

                      },
                    ),
                    SizedBox(height: 15.0,),
                    RaisedButton(
                      elevation: 0.0,
                      highlightColor: Colors.amber,
                      color: Colors.blue,
                      child: Text('Register',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white70
                        ),),
                      onPressed: () async {
                        if(_formkey.currentState.validate()) {
                          dynamic result = await _auth.registerWithEmailandPassword(email, password);

                          if(result == null) {
                            print(result);
                            setState(() => error = 'please enter a legit email');
                          }
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    Text(error, style: TextStyle(
                      color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
