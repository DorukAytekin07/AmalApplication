// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/Teacher/TeachersWidgets.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      drawer: Teacher().TeacherDrawer(context)
    );
  }
}