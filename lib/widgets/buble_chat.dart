import 'package:achat_app/constants.dart';
import 'package:flutter/material.dart';

class BubleChat extends StatelessWidget {
  const BubleChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(
          left: 15,
          right: 65,
          top: 6,
          bottom: 6,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(26),
          ),
          color: kPrimeryColor,
        ),
        child: const Text(
          "Hi! My Name is Adham",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
