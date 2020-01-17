import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunger/services/auth.dart';
import 'package:hunger/shared/reused.dart';
import 'package:hunger/shared/loading.dart';


class SignIn extends StatefulWidget {
  final Function toggleValue;
  SignIn({this.toggleValue});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool loading = false;

  // text field states
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(color: Colors.white,
              onPressed: () {
            widget.toggleValue();
          }, icon: Icon(Icons.person), label: Text('Register'))
        ],
        title: Text('Log In',
        style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
    ),),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  TextFormField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp('[a-zA-Z0-9]')), // do email address regex function
                    ],
                    validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                    cursorColor: Colors.deepPurple,
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    onChanged: (val) {
                      setState(() => this.email = val);
                    },
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    validator: (val) => val.length < 8 ? 'at least 8 chars required' : null,
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    cursorColor: Colors.deepPurple,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => this.password = val);

                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    elevation: 0.0,
                    highlightColor: Colors.amber,
                    color: Colors.blue,
                    child: Text('Sign in',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white70
                    ),),
                    onPressed: () async {
                      if(_formkey.currentState.validate()) {
                        setState(() => this.loading = true);
                        dynamic result = await _auth.signInWithEmailandPassword(email, password);
                        if(result == null) {
                          setState(() {
                            this.error = 'couldn\'t sign in with those credential';
                            this.loading = false;
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text(error, style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                  ),)
                ],
              ),
            )
        ),
      ),
    );
  }
}
