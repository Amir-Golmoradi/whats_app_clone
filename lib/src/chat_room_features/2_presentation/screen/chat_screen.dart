import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_icon_button.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

const String backToMainPage = '/';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key, required this.receiveUserName, required this.receiveUserId})
      : super(key: key);
  final String receiveUserName;
  final String receiveUserId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyText(
          text: widget.receiveUserName,
          style: typoGraphy.textTheme.headlineMedium!
              .copyWith(color: theme.primary),
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
    );
  }
}

typedef Button = MyIconButtons;
final List<Button> chatRoomButton = [
  Button(
    icon: Icon(
      Ionicons.mic,
      size: 22.sp,
    ),
    onPressed: () {
      //access voice message
    },
  ),
  Button(
    icon: const Icon(Ionicons.videocam),
    onPressed: () {},
  ),
  Button(
    icon: const Icon(Ionicons.call_outline),
    onPressed: () {},
  ),
  Button(
    icon: const Icon(Icons.more_vert_rounded),
    onPressed: () {},
  ),
];
