import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/ui/views/login_view.dart';
import 'package:tasky/features/home/ui/widgets/home_view_body.dart';

import '../widgets/add_task_form.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/icons/logo.png'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
                child: Image.asset('assets/icons/logout-icon.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'Log out',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ],
      ),
      body: HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: AddTaskForm(),
                  ),
                );
              });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Color(0xFF24252C),
        child: Image.asset('assets/icons/add.png'),
      ),
    );
  }
}


