// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

class StoreService{

  var uid;

  StoreService({ this.uid });

  final CollectionReference pendingteacherCollection = FirebaseFirestore.instance.collection("pendingteachers");
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");

  Future addTeacherToPending(String name, String major,String email,String password) async {
    var data = {"name":name, "major":major, "email":email, "password":password};
    return await pendingteacherCollection.add(data);
  } 
  Future addTeacherToUsers(String name, String major,String email,String password,String uid,String role) async {
    var data = {"name":name, "major":major, "email":email, "password":password,"uid":uid,"role":role};
    return await usersCollection.add(data);
  }
  Future addStudentToUsers(String name,String classgrade,String email,String password,String uid,String role) async {
    var data = {"name":name,"classgrade":classgrade, "email":email, "password":password,"uid":uid,"role":role};
    return await usersCollection.add(data);
  }
}