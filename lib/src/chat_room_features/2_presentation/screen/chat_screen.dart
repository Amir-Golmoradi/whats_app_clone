import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/chat_room_features/0_data/data_source/chat_service.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/widget/buttons.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/widget/room_col.dart';

const String backToMainPage = '/';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({
    required this.receiveUserName,
    required this.receiveUserID,
    super.key,
  });
  final String receiveUserName;
  final String receiveUserID;

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyText(
          text: widget.receiveUserName,
          style:
              typoGraphy.textTheme.titleLarge!.copyWith(color: theme.primary),
        ),
        leading: BackButton(
          color: theme.primary,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, backToMainPage);
          },
        ),
        actions: chatRoomButton.sublist(1, 3),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              theme.brightness == Brightness.dark
                  ? 'assets/images/darkBG.png'
                  : 'assets/images/lightBG.png',
            ),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: chatRoomCol(
          chatService,
          firebaseAuth,
          widget.receiveUserID,
          messageController,
          context,
        ),
      ),
    );
  }
}
