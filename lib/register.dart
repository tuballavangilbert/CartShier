import 'package:Cartshier/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
        child: ListView(padding: EdgeInsets.all(30), children: <Widget>[
          Text(
            "CartShier Register",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "Username",
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
          TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return '  must be filled';
              }
            },
            controller: _nameController,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
              hintText: "Name",
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
                return 'name must be filled';
              }
            },
            controller: _addressController,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
              hintText: "Address",
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
            controller: _contactController,
            decoration: InputDecoration(
              hintText: "contact",
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
                    _addUser();
                  }
                },
                child: Text(
                  "Done",
                )),
          )
        ]));
  }

  _addUser() async {
    var response = await http.post(Uri.encodeFull(

        //laravel api

        "http://192.168.0.25:8000/api/auth/register"), headers: {
      "Accept": "application/json"
    }, body: {
      "name": _nameController.text,
      "username": _usernameController.text,
      "password": _passwordController.text,
      "address": _addressController.text,
      "contact": _contactController.text,
    });
    var data = json.decode(response.body);
    print(data);
    var alert = new AlertDialog(
      title: new Text("Successfully Created Account"),
    );
    showDialog(context: context, child: alert);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Login();
        },
      ),
    );
  }
}
