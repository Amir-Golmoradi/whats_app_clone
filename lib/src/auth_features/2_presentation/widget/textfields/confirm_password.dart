import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput(this.confirmPasswordController, {super.key});

  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: confirmPasswordController,
      hintText: AppMessage.confirmPassword.tr,
      obsecureText: true,
      icon: const Icon(Icons.lock),
    );
  }
}
