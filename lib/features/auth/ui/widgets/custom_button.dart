import 'package:flutter/material.dart';
import 'package:tasky/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.buttonName,
  });
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: KPrimaryColor, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
