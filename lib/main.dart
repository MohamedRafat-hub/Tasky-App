import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/ui/views/login_view.dart';
import 'package:tasky/features/auth/ui/views/register_view.dart';
import 'package:tasky/home_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Tasky());
}

class Tasky extends StatelessWidget {
  const Tasky({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginView.routeName: (context) => LoginView(),
        RegisterView.routeName: (context) => RegisterView(),
        HomeView.routeName : (context)=>HomeView(),
      },
      initialRoute: FirebaseAuth.instance.currentUser == null ? LoginView.routeName : HomeView.routeName,
    );
  }
}
