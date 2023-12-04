import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, left: 8, right: 8, bottom: 7),
      height: 42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.white),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 19,
            color: Color(0xFF274460),
          ),
        ),
      ),
    );
  }
}
