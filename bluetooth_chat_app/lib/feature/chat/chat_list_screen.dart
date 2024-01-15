import 'package:bluetooth_chat_app/feature/chat/chat_bubble_component.dart';
import 'package:bluetooth_chat_app/feature/chat/model/chat.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messageWidth = MediaQuery.of(context).size.width / 2;
    return ListView.builder(
      itemCount: dummyChatList.length,
      itemBuilder: (context, index) {
        final messageProps = dummyChatList[index];
        return messageProps.isSending
            ? Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: messageWidth,
                  child: ChatBubbleComponent(
                    isRead: messageProps.isRead,
                    isSending: messageProps.isSending,
                    message: messageProps.message,
                    timeStamp: messageProps.timeStamp,
                  ),
                ),
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: messageWidth,
                  child: ChatBubbleComponent(
                    isRead: messageProps.isRead,
                    isSending: messageProps.isSending,
                    message: messageProps.message,
                    timeStamp: messageProps.timeStamp,
                  ),
                ),
              );
      },
    );
  }
}

final dummyChatList = [
  Chat(
      message: "Hey",
      sender: "Niket",
      receiver: "Bobby",
      timeStamp: DateTime.now().day.toString(),
      isRead: true,
      isSending: true),
  Chat(
      message: "Hello",
      sender: "Bobby",
      receiver: "Niket",
      timeStamp: DateTime.now().month.toString(),
      isRead: true,
      isSending: false),
  Chat(
      message: "Wanna play chess?",
      sender: "Niket",
      receiver: "Bobby",
      timeStamp: DateTime.now().hour.toString(),
      isRead: true,
      isSending: true),
  Chat(
      message: "Sure",
      sender: "Bobby",
      receiver: "Niket",
      timeStamp: DateTime.now().day.toString(),
      isRead: true,
      isSending: false),
  Chat(
      message: "Sending the game challenge link",
      sender: "Niket",
      receiver: "Bobby",
      timeStamp: DateTime.now().day.toString(),
      isRead: true,
      isSending: true),
];
