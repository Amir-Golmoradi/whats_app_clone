import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';

class PasswordTextInput extends StatelessWidget {
  const PasswordTextInput(this.passwordController, {super.key});

  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: passwordController,
      hintText: AppMessage.password.tr,
      obsecureText: true,
      icon: const Icon(Ionicons.lock_closed),
      
    );
  }
}
