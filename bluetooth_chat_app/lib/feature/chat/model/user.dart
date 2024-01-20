import 'package:bluetooth_chat_app/feature/chat/model/message.dart';

class User {
  final String username;
  final String timeStamp;
  final Message lastMessage;

  User({
    required this.username,
    required this.timeStamp,
    required this.lastMessage,
  });
}
