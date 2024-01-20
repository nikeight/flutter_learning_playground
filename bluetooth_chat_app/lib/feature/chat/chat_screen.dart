import 'package:bluetooth_chat_app/feature/chat/component/chat_bubble_component.dart';
import 'package:bluetooth_chat_app/feature/chat/model/message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
                    message: messageProps.content,
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
                    message: messageProps.content,
                    timeStamp: messageProps.timeStamp,
                  ),
                ),
              );
      },
    );
  }
}

final dummyChatList = [
  Message(
      content: "Hey",
      sender: "Niket",
      receiver: "Bobby",
      timeStamp: DateTime.now().day.toString(),
      isRead: true,
      isSending: true),
  Message(
      content: "Hello",
      sender: "Bobby",
      receiver: "Niket",
      timeStamp: DateTime.now().month.toString(),
      isRead: true,
      isSending: false),
  Message(
      content: "Wanna play chess?",
      sender: "Niket",
      receiver: "Bobby",
      timeStamp: DateTime.now().hour.toString(),
      isRead: true,
      isSending: true),
  Message(
      content: "Sure",
      sender: "Bobby",
      receiver: "Niket",
      timeStamp: DateTime.now().day.toString(),
      isRead: true,
      isSending: false),
  Message(
      content: "Sending the game challenge link",
      sender: "Niket",
      receiver: "Bobby",
      timeStamp: DateTime.now().day.toString(),
      isRead: true,
      isSending: true),
];
