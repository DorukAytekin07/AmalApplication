// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/Principal/PrincipalHomePage.dart';
import 'package:flutter/material.dart';

class SchedulesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Schedules"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          PrincipalHomePage().Settings(context),
        ],
      ),
      drawer: PrincipalHomePage().PrincipalDrawer(context),
    );
  }
}