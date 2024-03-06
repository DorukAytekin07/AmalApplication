// ignore_for_file: unnecessary_null_comparison, file_names, avoid_print, unused_field, unused_element

import 'package:app/Services/Store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'User.dart';
class AuthFunctions{
  final _auth = FirebaseAuth.instance;

  UserAmal? _userFromFirebase(User user){
    return user != null ? UserAmal(uid : user.uid) : null;
  }


  Future teacherRegisterWithEmailAndPassword(String email, String password,String name,String major) async{
    try {
      FirebaseApp app = await Firebase.initializeApp(name: 'secondary', options: Firebase.app().options);
      UserCredential result = await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await StoreService(uid: user!.uid).addTeacherToUsers(name,major,email,password,user.uid,"Teacher");
      app.delete();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future studentRegisterWithEmailAndPassword(String name,String email, String password,String classgrade) async{
    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await StoreService(uid: user!.uid).addStudentToUsers(name,classgrade,email,password,user.uid,"Student");
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}