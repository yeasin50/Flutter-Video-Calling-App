const String keySender = "senderUId";
const String keyReceiver = "receiverUI";
const String keyText = "message";
const String keyTime = "sentTime";
const String keySent = "sent";
const String keyDelivered = "delivered";

class Message {
  final String senderUId;
  final String receiverUId;
  final String text;
  final DateTime sentTime;
  bool isSent;
  bool isDelivered;

  Message({
    required this.senderUId,
    required this.receiverUId,
    required this.text,
    required this.sentTime,
    this.isSent = false,
    this.isDelivered = false,
  });

  Map<String, dynamic> toMap() {
    return {
      keySender: senderUId,
      keyReceiver: receiverUId,
      keyText: text,
      keyTime: sentTime.toIso8601String(),
      keySent: isSent,
      keyDelivered: isDelivered,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderUId: json[keySender],
      receiverUId: json[keyReceiver],
      text: json[keyText],
      sentTime: json[keyTime],
      isSent: json[keySent],
      isDelivered: json[keyDelivered],
    );
  }
}
