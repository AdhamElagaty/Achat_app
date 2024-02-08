import 'package:achat_app/constants.dart';
import 'package:achat_app/models/message_model.dart';
import 'package:achat_app/models/user_model.dart';
import 'package:achat_app/widgets/buble_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoadChat extends StatelessWidget {
  const LoadChat(
      {super.key,
      required this.messages,
      required this.scrollController,
      required this.user});

  final CollectionReference messages;
  final ScrollController scrollController;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kMDate, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (var data in snapshot.data!.docs) {
            messagesList.add(MessageModel.fromJson(data));
          }
          return Expanded(
            child: ListView.builder(
              reverse: true,
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return messagesList[index].id == user.user.user!.uid
                    ? BubleChatSender(
                        message: messagesList[index],
                      )
                    : BubleChatReciver(
                        message: messagesList[index],
                      );
              },
            ),
          );
        } else {
          return const Expanded(
            child: Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                CircularProgressIndicator(),
                Spacer(
                  flex: 1,
                )
              ],
            ),
          );
        }
      },
    );
  }
}
