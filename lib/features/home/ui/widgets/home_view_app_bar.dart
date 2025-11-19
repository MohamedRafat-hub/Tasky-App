import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../auth/ui/views/login_view.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              onTap: () {

                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure you want to log out?' , style: TextStyle(fontSize: 16),),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text('Cancel')),
                      TextButton(onPressed: ()async{
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(context, LoginView.routeName);
                      }, child: Text('Logout' , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold , fontSize:16 ),)),
                    ],
                  );
                });

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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}