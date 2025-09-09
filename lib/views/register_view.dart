import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/views/home_view.dart';
import 'package:tasky_app/views/login_view.dart';
import 'package:tasky_app/widgets/button.dart';
import 'package:tasky_app/widgets/text_form_field_helper.dart';
class RegisterView extends StatelessWidget {
   RegisterView({super.key});

  static const String routeName = 'RegisterView';
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:80 ,
                ),
                Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF404147)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Username',
                  style: TextStyle(
                      color: Color(0xFF404147),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormFieldHelper(
                  hint: 'Enter your username',
                  borderRadius: BorderRadius.circular(10),
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid username';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      color: Color(0xFF404147),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormFieldHelper(
                    hint: 'Enter your email',
                    onChanged: (value){
                      email = value;
                    },
                    borderRadius: BorderRadius.circular(10),
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid email';
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: Color(0xFF404147),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormFieldHelper(
                  onChanged: (value){
                    password = value;
                  },
                  isPassword: true,
                  suffixWidget: Image.asset('assets/icons/eye.png'),
                  hint: 'password...',
                  borderRadius: BorderRadius.circular(10),
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid password';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Confirm Password',
                  style: TextStyle(
                      color: Color(0xFF404147),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormFieldHelper(
                  isPassword: true,
                  suffixWidget: Image.asset('assets/icons/eye.png'),
                  hint: 'password...',
                  borderRadius: BorderRadius.circular(10),
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid password';
                    }
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                Button(text: 'Register' , onTap: () async{
                  try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                    log('$email');
                    log('$password');
                    Navigator.pushNamed(context, HomeView.routeName);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    log(e.toString());
                  }
                },),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ? ",
                      style: TextStyle(
                          color: Color(0xFF6E6A7C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginView.routeName);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xFF5F33E1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
