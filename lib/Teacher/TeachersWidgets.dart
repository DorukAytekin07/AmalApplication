// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:app/Teacher/HomeworkPage.dart';
import 'package:app/Teacher/Questions.dart';
import 'package:app/Teacher/SettingsPage.dart';
import 'package:app/Teacher/TeacherHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Teacher{
  Widget TeacherDrawer(context){
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
                  CupertinoPageRoute(builder: (context) => TeacherHomePage())
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