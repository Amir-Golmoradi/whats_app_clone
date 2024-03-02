// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class MyIconButtons extends StatelessWidget {
  const MyIconButtons({
    required this.icon, required this.onPressed, super.key,
    this.style,
  });

  final Widget icon;
  final void Function() onPressed;
  final ButtonStyle? style;
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: style,
    );
  }
}
