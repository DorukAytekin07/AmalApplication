// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/Principal/PrincipalHomePage.dart';
import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Classes"),
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        actions: <Widget>[
            PrincipalHomePage().Settings(context),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      drawer: PrincipalHomePage().PrincipalDrawer(context),
    );
  }
}