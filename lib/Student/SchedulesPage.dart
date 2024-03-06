// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/Student/StudentsWidgets.dart';
import 'package:flutter/material.dart';

class SchedulesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Schedules"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
            Student().Settings(context)
        ],
      ),
      drawer: Student().StudentDrawer(context)
    );
  }
}