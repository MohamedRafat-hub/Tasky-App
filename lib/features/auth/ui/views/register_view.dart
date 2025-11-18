import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tasky/constants.dart';
import 'package:tasky/features/auth/ui/views/login_view.dart';
import 'package:tasky/features/auth/ui/widgets/custom_button.dart';
import 'package:tasky/features/auth/ui/widgets/custom_text_field.dart';

import '../../../home/ui/views/home_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const routeName = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState>formKey = GlobalKey();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text('Username' , style: TextStyle(fontSize: 16),),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: username,
                    hint: 'enter username...',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Email' , style: TextStyle(fontSize: 16),),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: email,
                    hint: 'enter email...',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Password' , style: TextStyle(fontSize: 16),),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: password,
                    hint: 'Password...',
                    suffixIcon: 'assets/icons/frame-icon.png',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Confirm password' , style: TextStyle(fontSize: 16),),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: confirmPassword,
                    hint: 'Password...',
                    suffixIcon: 'assets/icons/frame-icon.png',
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  CustomButton(
                    onTap: () async{
                      if(formKey.currentState!.validate())
                        {
                          try {
                            isLoading = true;
                            setState(() {

                            });
                            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                            isLoading = false;
                            setState(() {

                            });
                            log('User created');
                            Navigator.pushReplacementNamed(context, HomeView.routeName);
                          } on FirebaseAuthException catch (e) {
                            isLoading = false;
                            setState(() {

                            });
                            if (e.code == 'weak-password') {
                              log('The password provided is too weak.');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('The password provided is too weak.') , backgroundColor: Colors.red,),
                              );
                            } else if (e.code == 'email-already-in-use') {
                              log('The account already exists for that email.');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('The account already exists for that email.') , backgroundColor: Colors.red,),
                              );
                            }
                          } catch (e) {
                            isLoading = false;
                            setState(() {
                            });
                            log(e.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('There was an error please tyr again') , backgroundColor: Colors.red,),
                            );
                          }
                        }
                    },
                    buttonName: 'Register',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ' , style: TextStyle(color: Colors.grey , fontSize: 14),),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, LoginView.routeName);
                          },
                          child: Text('Login' , style: TextStyle(fontSize: 16 , color: KPrimaryColor))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
