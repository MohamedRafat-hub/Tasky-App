import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/views/login_view.dart';
import 'package:tasky_app/views/onboarding_view.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});
  static const routeName = 'AmimatedSplashScreen';

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}
class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3) , (){
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F33E1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInLeft(child: Image.asset('assets/images/task-logo.png'),duration: Duration(milliseconds: 900),),
            BounceInDown(from: 50,child: Image.asset('assets/images/y-logo.png') , delay: Duration(milliseconds: 900) , duration: Duration(milliseconds: 1400),),
          ]
        ),
      ),
    );
  }
}
