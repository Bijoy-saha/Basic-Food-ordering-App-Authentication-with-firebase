// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portfolio/models/imagesection.dart';

// ignore: use_key_in_widget_constructors
class ItemsAre extends StatefulWidget {
  ItemsAre(this.submitFn);
  final void Function(
    String email,
    String username,
    String password,
    bool islogin,
    BuildContext ctx,
  ) submitFn;
  @override
  State<ItemsAre> createState() => _ItemsAreState();
}

class _ItemsAreState extends State<ItemsAre> {
  var log = true;
  var _userEmail = '';
  var _userName = '';
  // ignore: prefer_final_fields
  var _userPassword = '';
  // ignore: prefer_typing_uninitialized_variables
  // final login = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  // ignore: unused_field, prefer_final_fields
  var _formkey = GlobalKey<FormState>();

  void _trysubmit() {
    final isvalid = _formkey.currentState!.validate();

    if (isvalid) {
      FocusScope.of(context).unfocus();
      _formkey.currentState!.save();
      print(_userEmail);
      // ignore: avoid_print
      print(_userName);
      print(_userPassword);
      widget.submitFn(
        _userEmail,
        _userName,
        _userPassword,
        log,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'khana chaiye?',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              width: 300,
              child: Column(
                children: [
                  if (log)
                    Image.asset(
                      'lib/images/panda.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  TextFormField(
                    key: ValueKey('email'),
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return ('please enter a valid email');
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    key: ValueKey('password1'),
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'please  make it above 5 characters';
                      }
                      return null;
                    },
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  if (log == false)
                    TextFormField(
                      key: ValueKey('username'),
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'please  make it above 2 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'userName',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                  SizedBox(height: 10),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(width: 10),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(log ? 'logIn' : 'SignUp'),
                        onPressed: _trysubmit,
                      ),
                      FlatButton(
                        // ignore: deprecated_member_use
                        textColor: Theme.of(context).accentColor,
                        child: Text(log
                            ? 'create an account'
                            : 'i have already an account'),
                        onPressed: () {
                          setState(() {
                            email.clear();
                            password.clear();
                            username.clear();
                            log = !log;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
