import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_app_clone/core/reusables/my_icon_button.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';
import 'package:whats_app_clone/src/chat_room_features/0_data/data_source/chat_service.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/blocs/cubit/chat_cubit.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/widget/messages/message_list.dart';

Column chatRoomCol(
  ChatService chatService,
  FirebaseAuth firebaseAuth,
  String receiveUserID,
  TextEditingController messageController,
  BuildContext context,
) {
  return Column(
    children: [
      Expanded(
        child: messageList(chatService, firebaseAuth, receiveUserID),
      ),
      _buildMessageInput(receiveUserID, messageController, context),
    ],
  );
}

Widget _buildMessageInput(String receiveUserID,
    TextEditingController messageController, BuildContext context) {
  final sendMessage = BlocProvider.of<ChatCubit>(context).sendMessage;
  return Row(
    children: [
      Expanded(
        child: MyTextField(
          controller: messageController,
          hintText: 'Enter Message',
          obsecureText: false,
          icon: const Icon(null),
        ),
      ),
      MyIconButtons(
          icon: const Icon(Ionicons.arrow_up),
          onPressed: () => sendMessage(receiveUserID, messageController)),
    ],
  );
}
