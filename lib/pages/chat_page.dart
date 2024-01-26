import 'package:achat_app/constants.dart';
import 'package:achat_app/widgets/buble_chat.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  final String id = "ChatPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimeryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogoImagePath,
              height: 50,
              color: Colors.white,
            ),
            const Text(
              "Achat",
              style: TextStyle(
                color: Colors.white,
                fontSize: 29,
              ),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BubleChat();
                }),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 12,
              left: 17,
              right: 17,
              bottom: 20,
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Message",
                hintStyle: TextStyle(
                  color: kPrimeryColor,
                ),
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimeryColor,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                    borderSide: BorderSide(color: kPrimeryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                    borderSide: BorderSide(color: kPrimeryColor)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
