import 'package:flutter/material.dart';

class MyIconButtons extends StatelessWidget {
  const MyIconButtons({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.style,
  }) : super(key: key);

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
