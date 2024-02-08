import 'package:achat_app/constants.dart';
import 'package:achat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BubleChatReciver extends StatelessWidget {
  const BubleChatReciver({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: 17,
          right: 13,
          top: 20,
          bottom: 4,
        ),
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
            bottomRight: Radius.circular(26),
          ),
          color: kPrimeryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              DateFormat.jm().format(message.date),
              style: const TextStyle(
                color: Color.fromARGB(255, 208, 208, 208),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BubleChatSender extends StatelessWidget {
  const BubleChatSender({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(
          left: 17,
          right: 8,
          top: 20,
          bottom: 4,
        ),
        margin: const EdgeInsets.only(
          left: 65,
          right: 12,
          top: 6,
          bottom: 6,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
            bottomLeft: Radius.circular(26),
          ),
          color: Color(0xff006D84),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              DateFormat.jm().format(message.date),
              style: const TextStyle(
                color: Color.fromARGB(255, 208, 208, 208),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
