// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/Student/StudentsWidgets.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Questions"),
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        actions: <Widget>[
            Student().Settings(context)
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      drawer: Student().StudentDrawer(context)
    );
  }
}