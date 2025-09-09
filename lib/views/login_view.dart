import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/views/home_view.dart';
import 'package:tasky_app/views/register_view.dart';
import 'package:tasky_app/widgets/button.dart';
import 'package:tasky_app/widgets/text_form_field_helper.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  static const String routeName = 'LoginView';
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF404147)),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      color: Color(0xFF404147),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormFieldHelper(
                  onChanged: (value){
                    email = value;
                  },
                  hint: 'Enter your email',
                  borderRadius: BorderRadius.circular(10),
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid email';
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: Color(0xFF404147),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
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
                  hint: 'Enter your password',
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
                Button(text: 'Login' , onTap: ()async{
                  try {
                    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email!,
                        password: password!
                    );
                    Navigator.pushNamed(context, HomeView.routeName);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have an account ? " , style: TextStyle(color: Color(0xFF6E6A7C) , fontSize: 15 , fontWeight: FontWeight.w400),),
                    GestureDetector(onTap: (){
                      Navigator.pushNamed(context, RegisterView.routeName);
                    },child: Text('Register' , style: TextStyle(color: Color(0xFF5F33E1) , fontSize: 15 , fontWeight: FontWeight.w400),)),
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
