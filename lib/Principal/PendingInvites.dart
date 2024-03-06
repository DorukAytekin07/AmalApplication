// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/PagesUI/PendingTeachers.dart';
import 'package:app/Principal/PrincipalHomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class PendingInvitesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Pending Invites"),
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        actions: <Widget>[
          PrincipalHomePage().Settings(context)
        ],
      ),
      drawer: PrincipalHomePage().PrincipalDrawer(context),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("pendingteachers").snapshots(), 
                builder: (context, snapshot) {
                  List<Row> missions = [];
                  if(snapshot.hasData){
                    final teachers = snapshot.data!.docs.toList();
                    for(var teacher in teachers){
                      final pendingTeacherList = PendingTeachers().UI(teacher["name"],teacher["email"],teacher["password"],teacher["major"],teacher.id);
                      missions.add(pendingTeacherList);
                    }
                  }
                return Expanded(
                  child: ListView(
                    children: missions
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}