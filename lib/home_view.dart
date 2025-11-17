import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/ui/views/login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              icon: Image.asset('assets/icons/trash-icon.png')),
        ],
      ),
    );
  }
}
