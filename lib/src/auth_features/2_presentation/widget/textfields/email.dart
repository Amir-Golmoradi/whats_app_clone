import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';

class EmailTextInput extends StatelessWidget {
  const EmailTextInput(this.emailController, {super.key});

  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: emailController,
      hintText: 'Email',
      obsecureText: false,
      icon: const Icon(Ionicons.mail),
    );
  }
}
