import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String hintText; 
  final TextEditingController controller;
  final EdgeInsets margin;
  // final EdgeInsets padding;
  // final flex;
  final double? width;
  final double? height;
  final bool obscureText;
  // validation
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    // this.flex = 0,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    // required this.padding,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    // validator
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      margin: margin,
      // padding: padding,
      width: width,
      height: height,
      child: Column(
        children: [
    
          TextFormField(
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              filled: true,
              fillColor: Colors.transparent,
              label: Text(hintText),
              hintText: hintText,
            ),
            controller: controller,
            validator: validator,
          )
    
        ],
      ),
    );
  }
}