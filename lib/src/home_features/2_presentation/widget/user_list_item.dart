import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/screen/chat_screen.dart';

class UserListItem extends StatefulWidget {
  const UserListItem(
      {Key? key, required this.document, required this.firebaseAuth})
      : super(key: key);
  final DocumentSnapshot document;
  final FirebaseAuth firebaseAuth;
  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = widget.document.data() as Map<String, dynamic>;
    if (widget.firebaseAuth.currentUser!.email != data['email']) {
      return Card(
        child: ListTile(
          title: Text(data['email']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatRoomScreen(
                    receiveUserName: data['email'], receiveUserID: data['uid']),
              ),
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
