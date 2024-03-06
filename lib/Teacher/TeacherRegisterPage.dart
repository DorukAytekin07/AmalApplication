// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_import,

import 'package:app/Services/Auth.dart';
import 'package:app/Services/Store.dart';
import 'package:flutter/material.dart';

class TeacherRegisterPage extends StatefulWidget {
  const TeacherRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TeacherRegisterPage> createState() => _TeacherRegister();
}

class _TeacherRegister extends State<TeacherRegisterPage>{
  bool _obscurePassword = true;
  var passwordmode = TextInputType.visiblePassword;
  final FocusNode _focusNodePassword = FocusNode();
  final _namecontroller = TextEditingController();
  final _majorcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Teacher Register"),
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
                "Register",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 35),
              TextFormField(
                controller: _namecontroller,
                keyboardType: TextInputType.name,
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
                controller: _majorcontroller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Major",
                  prefixIcon: const Icon(Icons.class_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
                      
                        if(_obscurePassword) {
                          passwordmode = TextInputType.name;
                          _obscurePassword = false;
                        }
                        else{
                          passwordmode = TextInputType.visiblePassword;
                          _obscurePassword = true;
                        }
                      });  
                    },
                    icon: _obscurePassword 
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined)
                  ),
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
                  StoreService().addTeacherToPending(_namecontroller.text,_majorcontroller.text, _emailcontroller.text, _passwordcontroller.text);
                  _majorcontroller.clear();
                  _namecontroller.clear();
                  _emailcontroller.clear();
                  _passwordcontroller.clear();
                }, 
              child: Text("Register")
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Login"),
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