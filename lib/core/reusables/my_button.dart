// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.child, required this.style, super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
