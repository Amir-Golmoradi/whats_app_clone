import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/sign_up_screen.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/footer_action.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/sign_up/signup_button.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/textfields/confirm_password.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/textfields/email.dart';

import 'package:whats_app_clone/src/auth_features/2_presentation/widget/textfields/password.dart';

class SignUpCol extends StatelessWidget {
  const SignUpCol({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.widget,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final SignUpPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailTextInput(emailController),
        SizedBox(height: 0.16.dp),
        PasswordTextInput(passwordController),
        SizedBox(height: 0.16.dp),
        ConfirmPasswordInput(confirmPasswordController),
        SizedBox(height: 0.3.dp),
        SignUpButton(
          emailController,
          passwordController,
          confirmPasswordController,
        ),
        SizedBox(height: 0.2.dp),
        FooterAction(widget: widget),
      ],
    );
  }
}
