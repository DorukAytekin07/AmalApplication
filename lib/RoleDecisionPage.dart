// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, unnecessary_import

import 'package:app/PageDecision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RoleDecisionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Adnan Menderes Login"),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed:(){
                PageManager().PrincipalLogin(context);
              }, 
              child: Text(
                "Principal",
                textScaleFactor: 3,
                textWidthBasis: TextWidthBasis.longestLine,
                style: TextStyle(color: Colors.white),
              )
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed:(){
                PageManager().TeacherLogin(context);
              }, 
              child: Text(
                "Teacher",
                textScaleFactor: 3,
                style: TextStyle(color: Colors.white),
              )
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed:(){
                PageManager().StudentLogin(context);
              }, 
              child: Text(
                "Student",
                textScaleFactor: 3,
                style: TextStyle(color: Colors.white),
              )
            ),
          ],
        )
      ),
    );
  }
}