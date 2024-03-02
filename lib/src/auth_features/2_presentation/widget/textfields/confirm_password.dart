import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput(this.confirmPasswordController, {super.key});

  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: confirmPasswordController,
      hintText: 'Confirm Password',
      obsecureText: true,
      icon: const Icon(Icons.lock),
    );
  }
}
