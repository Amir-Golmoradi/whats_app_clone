// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({required this.text, super.key, this.style});
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
