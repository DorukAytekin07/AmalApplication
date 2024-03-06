// ignore_for_file: non_constant_identifier_names, file_names, unnecessary_import, prefer_const_constructors

import 'package:app/Principal/PrincipalLogIn.dart';
import 'package:app/Student/StudentLogIn.dart';
import 'package:app/Teacher/TeacherLogIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class PageManager{
  Future<void> TeacherLogin(BuildContext context) {
      return Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => TeacherLogIn())
      );
  }
  Future<void> PrincipalLogin(BuildContext context) {
      return Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => PrincipalLogIn())
    );
  }
  Future<void> StudentLogin(BuildContext context) {
      return Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => StudentLogIn())
    );
  }
  Future DecisionPage(BuildContext context) {
      return Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => TeacherLogIn())
    );
  }
}