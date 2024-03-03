import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';

class EmailTextInput extends StatelessWidget {
  const EmailTextInput(this.emailController, {super.key});

  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: emailController,
      hintText: AppMessage.email.tr,
      obsecureText: false,
      icon: const Icon(Ionicons.mail),
    );
  }
}
