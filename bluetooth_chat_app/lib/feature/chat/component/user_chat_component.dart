import 'package:bluetooth_chat_app/feature/chat/model/user.dart';
import 'package:flutter/material.dart';

class UserChatComponent extends StatelessWidget {
  final User user;

  const UserChatComponent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            user.username,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.lastMessage.content,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 10),
              ),
              user.lastMessage.isRead
                  ? const Icon(
                      Icons.check,
                      size: 10,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.check_circle_outline,
                      size: 10,
                      color: Colors.grey,
                    )
            ],
          )
        ],
      ),
    );
  }
}
