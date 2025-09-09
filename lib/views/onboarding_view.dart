import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  static const routeName = 'OnboardingView';
  List<OnboardingData> onboardingList = getOnboardingData();
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: controller,
          itemCount: onboardingList.length,
          itemBuilder: (context, index) {
            return OnboardingWidget(
              controller: controller,
              onboardingData: onboardingList[index],
              index: index,
              onboardingList: onboardingList,
            );
          }),
    );
  }
}



List<OnboardingData> getOnboardingData() {
  return [
    OnboardingData(
        image: 'assets/images/onboarding1.png',
        title: 'Manage your tasks',
        discription:
            'You can easily manage all of your daily tasks in DoMe for free'),
    OnboardingData(
        image: 'assets/images/onboarding2.png',
        title: 'Create daily routine',
        discription:
            'In Tasky  you can create your personalized routine to stay productive'),
    OnboardingData(
        image: 'assets/images/onboarding3.png',
        title: 'Orgonaize your tasks',
        discription:
            'You can organize your daily tasks by adding your tasks into separate categories'),
  ];
}

