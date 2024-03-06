// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, unused_local_variable, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:app/Principal/ClassesPage.dart';
import 'package:app/Principal/PendingInvites.dart';
import 'package:app/Principal/Settings.dart';
import 'package:app/Principal/StaffPage.dart';
import 'package:app/RoleDecisionPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrincipalHomePage extends StatelessWidget{

  Widget PrincipalDrawer(context){
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
              ],
            )
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: Text("Home Page"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => PrincipalHomePage())
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.class_rounded),
              title: const Text('Classes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => ClassesPage())
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: const Text('Teachers'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => StaffPage())
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.group_add_rounded),
              title: const Text('Pending Invites'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => PendingInvitesPage())
                );
              },
            ),
            ]
          ),
        );
  }
  Widget Settings(context){
    return IconButton(
      icon: Icon(Icons.settings_rounded),
      onPressed:(){
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => SettingsPage())
        );
      }, 
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          Settings(context),
        ],
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body:Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(FirebaseAuth.instance.currentUser!.email.toString(),style: TextStyle(fontSize: 25)),
            ElevatedButton(onPressed: (){   
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => RoleDecisionPage())
              );
            }, 
            child: Text("Sign Out",style: TextStyle(fontSize: 25)),
            style: ButtonStyle(),
            ),
          ],
        ) 
      ),
      drawer: PrincipalDrawer(context)
    );
  }
}
