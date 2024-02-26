import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    this.onPressed,
    required this.child,
    required this.style,
  }) : super(key: key);

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
