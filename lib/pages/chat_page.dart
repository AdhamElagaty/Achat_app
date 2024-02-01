import 'package:achat_app/constants.dart';
import 'package:achat_app/model/message_model.dart';
import 'package:achat_app/widgets/buble_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    UserCredential user =
        ModalRoute.of(context)!.settings.arguments as UserCredential;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kMDate, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (var data in snapshot.data!.docs) {
            messagesList.add(MessageModel.fromJson(data));
          }
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
                      reverse: true,
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == user.user!.uid
                            ? BubleChatSender(
                                message: messagesList[index].message,
                              )
                            : BubleChatReciver(
                                message: messagesList[index].message,
                              );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 12,
                    left: 17,
                    right: 17,
                    bottom: 20,
                  ),
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (data) {
                      messages.add({
                        "message": data,
                        "date": DateTime.now(),
                        "id": user.user!.uid,
                      });
                      _textController.clear();
                      _scrollController.animateTo(
                        _scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    decoration: const InputDecoration(
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
        } else {
          return const Center(
            child: Text("Error!"),
          );
        }
      },
    );
  }
}
