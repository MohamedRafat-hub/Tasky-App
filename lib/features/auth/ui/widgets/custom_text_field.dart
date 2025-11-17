import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key, required this.hint,this.suffixIcon,
     this.controller
  });
  final String hint;
  final String? suffixIcon;
   TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (data){
        if(data == null || data!.isEmpty )
          {
            return 'Field is required';
          }
      },
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
