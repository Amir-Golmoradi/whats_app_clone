import 'package:cloud_firestore/cloud_firestore.dart';

class Message {

  Message({
    required this.senderId,
    required this.senderName,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  factory Message.fromMap(Map<String, dynamic> map) => Message(
        senderId: map['senderId'] as String,
        senderName: map['senderEmail'] as String,
        receiverId: map['receiverId'] as String,
        message: map['message'] as String,
        timestamp: map['timestamp'] as Timestamp,
      );
  final String senderId;
  final String senderName;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Map<String, dynamic> toMap() => {
        'senderId': senderId,
        'senderEmail': senderName,
        'receiverId': receiverId,
        'message': message,
        'timestamp': timestamp,
      };
}
