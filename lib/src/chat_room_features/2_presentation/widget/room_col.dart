import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_icon_button.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';
import 'package:whats_app_clone/src/chat_room_features/0_data/data_source/chat_service.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/blocs/cubit/chat_cubit.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/widget/messages/message_list.dart';

Widget chatRoomCol(
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

Widget _buildMessageInput(
  String receiveUserID,
  TextEditingController messageController,
  BuildContext context,
) {
  final sendMessage = BlocProvider.of<ChatCubit>(context).sendMessage;
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: MyTextField(
            controller: messageController,
            hintText: AppMessage.enterMessage.tr,
            obsecureText: false,
            icon: const Icon(null),
          ),
        ),
      ),
      if (messageController.text.isEmpty)
        CircleAvatar(
          backgroundColor: Colors.teal,
          child: MyIconButtons(
            icon: Icon(
              Ionicons.mic,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {},
          ),
        )
      else
        CircleAvatar(
          backgroundColor: Colors.teal,
          child: MyIconButtons(
            icon: Icon(
              Ionicons.send,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () => sendMessage(receiveUserID, messageController),
          ),
        ),
    ],
  );
}
