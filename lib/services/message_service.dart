import 'dart:developer';
import 'package:achat_app/constants.dart';
import 'package:achat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> AddMessage(MessageModel message) {
    final CollectionReference messages =
        firebaseFirestore.collection(kMessagesCollection);
    return messages.add({
      "message": message.message,
      "date": message.date,
      "id": message.id,
    }).catchError((error) {
      log("Error! From MessageService(AddMessage) is:$error");
      throw (error);
    });
  }
}
