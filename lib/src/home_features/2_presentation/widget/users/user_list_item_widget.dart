import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:whats_app_clone/src/chat_room_features/0_data/data_source/chat_service.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/widget/users/user_card.dart';

Widget buildUserListItem(DocumentSnapshot document, BuildContext context) {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final ChatService chatService = ChatService();

  Map<String, dynamic> data = document.data() as Map<String, dynamic>;

  return auth.currentUser!.email != data['email']
      ? Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: (context) =>
                    chatService.deleteMessage(data['email']),
                borderRadius: BorderRadius.circular(18),
                backgroundColor: Colors.redAccent[400]!,
                foregroundColor: Colors.white,
                icon: Icons.delete_rounded,
                label: "Delete",
              ),
            ],
          ),
          child: UserListItemCard(document: document),
        )
      : Container();
}
