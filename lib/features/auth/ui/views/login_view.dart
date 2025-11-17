import 'package:flutter/material.dart';
import 'package:tasky/constants.dart';
import 'package:tasky/features/auth/ui/views/register_view.dart';
import 'package:tasky/features/auth/ui/widgets/custom_button.dart';
import 'package:tasky/features/auth/ui/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
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
              Text('Email' , style: TextStyle(fontSize: 16),),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                hint: 'enter Email...',
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
                height: 70,
              ),
              CustomButton(
                buttonName: 'Login',
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account? ' , style: TextStyle(color: Colors.grey , fontSize: 14),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RegisterView.routeName);
                    },
                      child: Text('Register' , style: TextStyle(fontSize: 16 , color: KPrimaryColor))),
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
    );
  }
}



