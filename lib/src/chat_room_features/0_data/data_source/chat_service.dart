// ignore_for_file: flutter_style_todos, cascade_invocations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app_clone/src/chat_room_features/1_domain/model/message_model.dart';

typedef ListOfString = List<String>;

class ChatService {
  // get instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    //Todo 1: get current user info
    final currentUserID = _firebaseAuth.currentUser!.uid;
    final currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final timestamp = Timestamp.now();
    // final userDoc = _firestore.collection('users').doc(currentUserID);

    // Todo 2: Create a new message
    final newMessage = Message(
      senderId: currentUserID,
      senderName: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    // Todo 3: construct chat room Id
    final ids = [currentUserID, receiverId];
    // sort the ids
    ids.sort();

    // combine the ids into single string to use as chatRoomId
    final chatRoomId = ids.join('_');

    //Todo 4: add new message to firestore
    await _firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }
  //Todo 5: GET MESSAGES

  Stream<QuerySnapshot> getMessage(String userId, String anotherUserId) {
    final ids = [userId, anotherUserId];
    ids.sort();
    final chatRoomID = ids.join('_');

    return _firestore
        .collection('chat_room')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

// Todo 6: DELETE MESSAGE

  Future<void> deleteMessage(String messageId) async {
    return _firestore.collection('chat_room').doc(messageId).delete();
  }
}
