import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        spacing: 5,
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset('assets/images/empty-home-view.png'),
          SizedBox(
            height: 10,
          ),
          Text(
            'What do you want to do today?',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Tap + to add your tasks',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}