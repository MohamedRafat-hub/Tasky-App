import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hint,this.suffixIcon
  });
  final String hint;
  final String? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey , fontSize: 14),
        suffixIcon: suffixIcon !=null ?  Image.asset(suffixIcon!) : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
