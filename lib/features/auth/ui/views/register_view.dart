import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/constants.dart';
import 'package:tasky/features/auth/ui/views/login_view.dart';
import 'package:tasky/features/auth/ui/widgets/custom_button.dart';
import 'package:tasky/features/auth/ui/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'RegisterView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
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
                hint: 'Password...',
                suffixIcon: 'assets/icons/frame-icon.png',
              ),
              SizedBox(
                height: 70,
              ),
              CustomButton(
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
    );
  }
}
