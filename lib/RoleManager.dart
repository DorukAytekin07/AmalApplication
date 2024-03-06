// ignore_for_file: non_constant_identifier_names, file_names, prefer_typing_uninitialized_variables, avoid_print

import 'package:app/Principal/PrincipalHomePage.dart';
import 'package:app/RoleDecisionPage.dart';
import 'package:app/Student/StudentHomePage.dart';
import 'package:app/Teacher/TeacherHomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
class RoleManager{
  var role;
  Widget HandleAuth(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").snapshots(), 
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final users = snapshot.data!.docs.toList();
          for (var user in users){
          print("Data Varmis");
          print("Sorun Burda");
          print(user.data());
          if(FirebaseAuth.instance.currentUser?.uid == user["uid"]){
              role = user["role"];
            }
          }
        }
        if(role == "Principal"){
          return PrincipalHomePage();
        }
        else if(role == "Teacher"){
          return TeacherHomePage();
        }
        else if(role == "Student"){
          print("Buraya Giriyor3");
          return StudentHomePage();
        }
        else{
          return RoleDecisionPage();
        }
      },
    );
  }
}