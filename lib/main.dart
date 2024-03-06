// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, unused_import, empty_statements, unnecessary_import, avoid_print

import 'package:app/PageDecision.dart';
import 'package:app/Principal/PrincipalHomePage.dart';
import 'package:app/RoleManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'RoleDecisionPage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(32, 63, 129, 1.0),
        ),
      ),
      home:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot){
          if(snapshot.hasData && snapshot.hasData != null ){
            print("Buraya");
            return RoleManager().HandleAuth();
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print("Buraya Girmiyo");
          return RoleDecisionPage();
        },
      ),
    );
  }
}

