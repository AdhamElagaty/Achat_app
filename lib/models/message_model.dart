import 'package:achat_app/constants.dart';

class MessageModel {
  final String message;
  final DateTime date;
  final String id;

  MessageModel({required this.message, required this.date, required this.id});
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
        message: jsonData[kMessage],
        date: jsonData[kMDate].toDate(),
        id: jsonData[kMUserid]);
  }
}
