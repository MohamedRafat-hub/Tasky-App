import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasky_app/views/login_view.dart';

import '../models/onboarding_model.dart';
import '../views/home_view.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget(
      {super.key,
        required this.onboardingData,
        required this.index,
        required this.controller,
        required this.onboardingList});

  OnboardingData onboardingData;
  int index;
  PageController controller;
  List<OnboardingData> onboardingList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(onboardingData.image),
        SizedBox(
          height: 23,
        ),
        SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
              spacing: 10,
              radius: 10,
              dotWidth: 15,
              dotHeight: 15,
              dotColor: Colors.grey,
              activeDotColor: Color(0xff744EE5),
            )),
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                onboardingData.title,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF24252C)),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                onboardingData.discription,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6E6A7C),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                // padding: EdgeInsets.all(20),
                onPressed: () {
                  index < onboardingList.length - 1
                      ? controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear)
                      : Navigator.pushReplacementNamed(
                      context, LoginView.routeName);
                },
                child: Text(
                  index < onboardingList.length - 1 ? 'Next' : 'Get started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                color: Color(0xFF5F33E1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                height: 48,
              )),
        )
      ],
    );
  }
}