import 'package:flutter/material.dart';

class ChatBubbleComponent extends StatelessWidget {
  final bool isSending;
  final String message;
  final String timeStamp;
  final bool isRead;

  const ChatBubbleComponent(
      {super.key,
      required this.isSending,
      required this.message,
      required this.timeStamp,
      required this.isRead});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSending ? Colors.blue.shade600 : Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timeStamp,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 10),
              ),
              isRead
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
