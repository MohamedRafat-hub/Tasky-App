import 'package:flutter/material.dart';
import 'package:tasky_app/views/amimated_splash_screen.dart';
import 'package:tasky_app/views/home_view.dart';
import 'package:tasky_app/views/login_view.dart';
import 'package:tasky_app/views/onboarding_view.dart';
import 'package:tasky_app/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AnimatedSplashScreen.routeName,
      routes: {
        LoginView.routeName : (context) => LoginView(),
        RegisterView.routeName : (context) => RegisterView(),
        HomeView.routeName : (context) => HomeView(),
        OnboardingView.routeName : (context) => OnboardingView(),
        AnimatedSplashScreen.routeName : (context) => AnimatedSplashScreen(),
      },
    );
  }
}
