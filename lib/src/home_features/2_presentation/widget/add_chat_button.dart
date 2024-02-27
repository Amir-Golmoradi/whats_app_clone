import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AddChatButton extends StatefulWidget {
  const AddChatButton({super.key, required this.theme});

  final ColorScheme theme;

  @override
  State<AddChatButton> createState() => _AddChatButtonState();
}

class _AddChatButtonState extends State<AddChatButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: widget.theme.secondary,
      child: Icon(
        Ionicons.mail,
        color: widget.theme.brightness == Brightness.dark
            ? widget.theme.background
            : widget.theme.primary,
      ),
      onPressed: () {},
    );
  }
}
