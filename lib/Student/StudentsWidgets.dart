// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, unnecessary_import, prefer_const_literals_to_create_immutables

import 'package:app/Student/QuestionsPage.dart';
import 'package:app/Student/SettingsPage.dart';
import 'package:app/Student/StudentHomePage.dart';
import 'package:app/Student/HomeworkPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Student{
  Widget StudentDrawer(context){
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                Text(
                  "Name",
                  textScaleFactor: 1.5,
                  textWidthBasis: TextWidthBasis.longestLine,
                  style: TextStyle(color: Colors.white),  
                ),
                Text(
                  "E-mail",
                  textScaleFactor: 1.5,
                  textWidthBasis: TextWidthBasis.longestLine,
                  style: TextStyle(color: Colors.white), 
                ),
                Text(
                  "Class",
                  textScaleFactor: 1.5,
                  textWidthBasis: TextWidthBasis.longestLine,
                  style: TextStyle(color: Colors.white), 
                )
              ],
            )
          ),
          ListTile(
              leading: const Icon(Icons.home_rounded),
              title: Text("Home Page"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => StudentHomePage())
                );
              },
            ),
          ListTile(
              leading: const Icon(Icons.menu_book_rounded),
              title: const Text('Homework'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => HomeworkPage())
                );
              },
            ),
          ListTile(
              leading: const Icon(Icons.question_mark_sharp),
              title: const Text('Questions'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => QuestionsPage())
                );
              },
          ),
        ]
      ),
    );
  }
  Widget Settings(context){
    return IconButton(
      icon: const Icon(Icons.settings_rounded),
      onPressed:(){
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => SettingsPage())
        );
      }, 
    );
  }
}