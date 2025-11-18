import 'dart:developer';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tasky/constants.dart';
import 'package:tasky/features/auth/ui/views/register_view.dart';
import 'package:tasky/features/auth/ui/widgets/custom_button.dart';
import 'package:tasky/features/auth/ui/widgets/custom_text_field.dart';

import '../../../home/ui/views/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: email,
                    hint: 'enter Email...',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: password,
                    hint: 'Password...',
                    suffixIcon: 'assets/icons/frame-icon.png',
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          isLoading = true;
                          setState(() {});
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text, password: password.text);
                          isLoading = false;
                          setState(() {});
                          Navigator.pushReplacementNamed(
                              context, HomeView.routeName);
                        } on FirebaseAuthException catch (e) {
                          isLoading = false;
                          setState(() {});
                          if (e.code == 'user-not-found') {
                            log('No user found for that email.');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No user found for that email.') , backgroundColor: Colors.red,),
                            );
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Wrong password provided for that user.') , backgroundColor: Colors.red,),
                            );
                          }
                          else
                            {
                              log('There was an error please tyr again');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('There was an error please tyr again') , backgroundColor: Colors.red,),
                              );
                            }
                        }
                      }
                    },
                    buttonName: 'Login',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterView.routeName);
                          },
                          child: Text('Register',
                              style:
                                  TextStyle(fontSize: 16, color: KPrimaryColor))),
                    ],
                  ),
                  // Center(
                  //   child: Text.rich(TextSpan(
                  //     text: 'Don’t have an account? ',
                  //     style: TextStyle(color: Colors.grey , fontSize: 14),
                  //     children: [
                  //       TextSpan(text: 'Register' , style: TextStyle(fontSize: 16 , color: KPrimaryColor))
                  //     ],
                  //   )),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
