class Message {
  final String content;
  final String sender;
  final String receiver;
  final String timeStamp;
  final bool isRead;
  final bool isSending;

  Message({
    required this.content,
    required this.sender,
    required this.receiver,
    required this.timeStamp,
    required this.isRead,
    required this.isSending,
  });
}
