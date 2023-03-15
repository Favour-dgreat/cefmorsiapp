import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const MyButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: MediaQuery.of(context).size.width *
              0.8, // Will take 50% of screen space
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: HexColor('#309C96'),
              borderRadius: BorderRadius.circular(15.0)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )),
    );
  }
}
