import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final bool obscureText;
  final decoration;
  // ignore: non_constant_identifier_names
  const MyTextField({Key? key, required this.controller, required this.obscureText, required this.decoration,required this.onPressed  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: decoration,
        onPressed: onPressed,
      ),
      );

  }
}
