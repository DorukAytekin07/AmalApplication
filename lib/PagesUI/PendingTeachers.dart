// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, file_names, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:app/Services/Auth.dart';
import 'package:app/Services/Store.dart';
import 'package:flutter/material.dart';

class PendingTeachers{
  Row UI(String name,String email,String password ,String major ,var id){
    return Row(
      children: [
        Column(
          children:[
            Text("Name:"+name,style: TextStyle(fontSize: 20,color: Colors.black87)),
            Text("Email:"+email,style: TextStyle(fontSize: 20,color: Colors.black87)),
            Text("Password:"+password,style: TextStyle(fontSize: 20,color: Colors.black87)),
            Text("Major:"+major,style: TextStyle(fontSize: 20,color: Colors.black87)),
          ] 
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                if(AuthFunctions().teacherRegisterWithEmailAndPassword(email, password, name, major) != null){
                  await StoreService().pendingteacherCollection.doc(id).delete();
                }
              }, 
              child: Text("Accept",style: TextStyle(fontSize: 20,color: Colors.black87))
            ),
            ElevatedButton(
              onPressed: ()async{
                await StoreService().pendingteacherCollection.doc(id).delete();
              }, 
              child: Text("Reject",style: TextStyle(fontSize: 20,color: Colors.black87))
            )
          ],
        )
      ]
    );
  }
}
