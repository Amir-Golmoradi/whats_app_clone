import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/src/chat_room_features/0_data/data_source/chat_service.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/widget/messages/message_list_item.dart';

Widget messageList(
  ChatService chatService,
  FirebaseAuth firebaseAuth,
  String receiveUserID,
) =>
    StreamBuilder(
      stream:
          chatService.getMessage(receiveUserID, firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MyText(text: 'Error${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return MyText(
            text: AppMessage.pleaseWait.tr,
          );
        } else {
          return ListView(
            children: snapshot.data!.docs
                .map(
                  (document) => messageListItem(document, context),
                )
                .toList(),
          );
        }
      },
    );
