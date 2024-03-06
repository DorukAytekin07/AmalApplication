// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/Teacher/TeachersWidgets.dart';
import 'package:flutter/material.dart';

class HomeworkPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Homeworks"),
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        actions: <Widget>[
            Teacher().Settings(context)
        ],
      ),
      drawer: Teacher().TeacherDrawer(context),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}