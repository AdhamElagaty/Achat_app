import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.onTap});

  final String text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
