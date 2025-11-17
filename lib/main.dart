import 'package:flutter/material.dart';
import 'package:tasky/features/auth/ui/views/login_view.dart';
import 'package:tasky/features/auth/ui/views/register_view.dart';

void main()
{
  runApp(Tasky());
}

class Tasky extends StatelessWidget {
  const Tasky({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginView.routeName : (context)=>LoginView(),
        RegisterView.routeName : (context)=>RegisterView(),
      },
      initialRoute: LoginView.routeName,
    );
  }
}
