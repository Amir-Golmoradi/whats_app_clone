import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';

class PasswordTextInput extends StatelessWidget {
  const PasswordTextInput(this.passwordController, {Key? key}) : super(key: key);

  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: passwordController,
      hintText: 'Password',
      obsecureText: true,
      icon: const Icon(Ionicons.lock_closed),
      
    );
  }
}
