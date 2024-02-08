import 'package:achat_app/constants.dart';
import 'package:achat_app/models/user_model.dart';
import 'package:achat_app/widgets/load_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final String id = "ChatPage";
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
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
          LoadChat(
              messages: messages,
              scrollController: _scrollController,
              user: user),
          Container(
            margin: const EdgeInsets.only(
              top: 12,
              left: 17,
              right: 17,
              bottom: 20,
            ),
            child: TextField(
              controller: _textController,
              onSubmitted: (data) => _sendMessage(data, user),
              decoration: InputDecoration(
                hintText: "Message",
                hintStyle: const TextStyle(
                  color: kPrimeryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () => _sendMessage(_textController.text, user),
                  icon: const Icon(
                    Icons.send,
                    color: kPrimeryColor,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                    borderSide: BorderSide(color: kPrimeryColor)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                    borderSide: BorderSide(color: kPrimeryColor)),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _sendMessage(String data, UserModel user) {
    if (_textController.text.trim().isNotEmpty) {
      messages.add({
        "message": data,
        "date": DateTime.now(),
        "id": user.user.user!.uid,
      });
      _textController.clear();
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }
}
