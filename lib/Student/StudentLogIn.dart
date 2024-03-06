// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, unnecessary_nullable_for_final_variable_declarations

import 'package:app/Student/StudentHomePage.dart';
import 'package:app/Student/StudentRegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentLogIn extends StatefulWidget {
  const StudentLogIn({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentLogIn> createState() => _LoginState();
}

class _LoginState extends State<StudentLogIn>{
  var passwordmode = TextInputType.visiblePassword;
  final FocusNode _focusNodePassword = FocusNode();
  bool _obscurePassword = true;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: _emailcontroller.text, 
      password: _passwordcontroller.text
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Login"),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Login to your account",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 35),
              TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _passwordcontroller,
                focusNode: _focusNodePassword,
                obscureText: _obscurePassword,
                keyboardType: passwordmode,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                          if(_obscurePassword) {
                            passwordmode = TextInputType.name;
                          }
                          else{
                            passwordmode = TextInputType.visiblePassword;
                          }
                        });  
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: (){
                  login();
                  FirebaseAuth.instance
                  .authStateChanges()
                  .listen((User? user) {
                    if (user == null) {
                      print('User is currently signed out!');
                    } else {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => StudentHomePage())
                      );
                    }
                  });
                }, 
              child: Text("Sign In")
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return StudentRegisterPage();
                        },
                      ),
                    );
                  },
                    child: const Text("Signup"),
                  ),
                ],
              ),
          ],
          )
        ),
      ),
    );
  }
}