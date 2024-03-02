import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/src/chat_room_features/0_data/data_source/chat_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatService) : super(ChatInitial());
  final ChatService _chatService;
  Future<void> sendMessage(
    String receiveUserID,
    TextEditingController messageControllerText,
  ) async {
    if (messageControllerText.text.isNotEmpty) {
      await _chatService.sendMessage(
        receiveUserID.trim(),
        messageControllerText.text,
      );
      messageControllerText.clear();
    }
  }
}
