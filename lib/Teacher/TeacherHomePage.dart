// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last

import 'package:app/RoleDecisionPage.dart';
import 'package:app/Teacher/TeachersWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Home Page"),
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        actions: <Widget>[
          Teacher().Settings(context)
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(FirebaseAuth.instance.currentUser!.email.toString(),style: TextStyle(fontSize: 25)),
              ElevatedButton(onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.push(
                  context,
                CupertinoPageRoute(builder: (context) => RoleDecisionPage())
              );
              }, 
              child: Text("Sign Out",style: TextStyle(fontSize: 25)),
              style: ButtonStyle(),
              ),
            ],
          ) 
        ),
        drawer: Teacher().TeacherDrawer(context),
    );
  }
}