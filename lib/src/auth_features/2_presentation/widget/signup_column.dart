import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/sign_up_screen.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/footer_action.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/signup_button.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/textfields/confirm_password.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/textfields/email.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/textfields/first_name.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/textfields/last_name.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/textfields/password.dart';

class SignUpCol extends StatelessWidget {
  const SignUpCol({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.widget,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final SignUpPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FirstNameField(firstNameController),
        SizedBox(height: 0.16.dp),
        LastNameField(lastNameController),
        SizedBox(height: 0.16.dp),
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
          firstNameController,
          lastNameController,
        ),
        SizedBox(height: 0.2.dp),
        FooterAction(widget: widget)
      ],
    );
  }
}
