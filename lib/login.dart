import 'dart:ui';

import 'package:Cartshier/dashboard.dart';
import 'package:Cartshier/register.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _nameController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var _addressController = new TextEditingController();
  var _contactController = new TextEditingController();
  var _usernameController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Successfully Register"),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          Text(
            "CartShier",
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
          ),
          TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return ' must be filled';
              }
            },
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "Email",
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return ' must be filled';
              }
            },
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: new BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: new BorderRadius.circular(9.0)),
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _addUser(_usernameController.text, _passwordController.text);
                }
              },
              child: Text(
                "Login",
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: new BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: new BorderRadius.circular(9.0)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Create();
                    },
                  ),
                );
              },
              child: Text(
                "Register",
              ),
            ),
          ),
        ],
      ),
    );
  }

  _addUser(String username, String password) async {
    var response = await http.post(Uri.encodeFull(

        //laravel api

        "http://192.168.0.25:8000/api/auth/login"), headers: {
      "Accept": "application/json"
    }, body: {
      "username": _usernameController.text,
      "password": _passwordController.text,
    });
    var data = json.decode(response.body);
    var status = response.body.contains('error');
    if (status) {
      print(data);
      var alert = new AlertDialog(
        title: new Text("Incorrect Username or Password"),
      );
      showDialog(context: context, child: alert);
    } else {
      print(data);
      var alert = new AlertDialog(
        title: new Text("Successfully Login"),
      );
      showDialog(context: context, child: alert);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    }
  }
}
