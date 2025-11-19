import 'package:flutter/material.dart';
import 'package:tasky/features/home/ui/widgets/custom_floating_action_button.dart';
import 'package:tasky/features/home/ui/widgets/home_view_body.dart';
import '../widgets/home_view_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeViewAppBar(),
      body: HomeViewBody(),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}






