class Chat {
  final String message;
  final String sender;
  final String receiver;
  final String timeStamp;
  final bool isRead;
  final bool isSending;

  Chat({
    required this.message,
    required this.sender,
    required this.receiver,
    required this.timeStamp,
    required this.isRead,
    required this.isSending,
  });
}
