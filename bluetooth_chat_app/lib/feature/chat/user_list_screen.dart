import 'package:bluetooth_chat_app/feature/chat/component/user_chat_component.dart';
import 'package:bluetooth_chat_app/feature/chat/model/message.dart';
import 'package:bluetooth_chat_app/feature/chat/model/user.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyUserListScreen.length,
      itemBuilder: (context, index) {
        final user = dummyUserListScreen[index];
        return UserChatComponent(user: user);
      },
    );
  }
}

final dummyUserListScreen = [
  User(
    username: 'Magnus Carlse',
    timeStamp: '12/12/12',
    lastMessage: Message(
        content: "Hey",
        sender: "Niket",
        receiver: "Bobby",
        timeStamp: DateTime.now().day.toString(),
        isRead: true,
        isSending: true),
  ),
  User(
    username: 'Robert James',
    timeStamp: '12/12/12',
    lastMessage: Message(
        content: "Hey",
        sender: "Niket",
        receiver: "Bobby",
        timeStamp: DateTime.now().day.toString(),
        isRead: true,
        isSending: true),
  ),
];
