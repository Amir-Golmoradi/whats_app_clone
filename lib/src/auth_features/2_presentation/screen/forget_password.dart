// ignore_for_file: inference_failure_on_instance_creation, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/auth_gate.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final resetPWController = TextEditingController();

  @override
  void dispose() {
    resetPWController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: resetPWController.text.trim(),
      );
      return showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text('Password reset link sent! Check your eamil'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthGate(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyText(
                text: 'Forgot Password',
                style: typoGraphy.textTheme.bodyLarge!.copyWith(
                  color: theme.brightness == Brightness.dark
                      ? Colors.grey[200]
                      : theme.primary,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'fira code',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyText(
                text:
                    """Enter the email address with your account and we'll send an email with confirmation to reset your password.""",
                style: typoGraphy.textTheme.bodyMedium!.copyWith(
                  color: theme.brightness == Brightness.dark
                      ? Colors.grey[200]
                      : theme.primary,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'fira code',
                ),
              ),
            ),
            // Text Field for Reset password
            SizedBox(height: 0.3.dp),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyTextField(
                controller: resetPWController,
                hintText: 'Backup Email',
                obsecureText: false,
                icon: const Icon(Icons.password_rounded),
              ),
            ),

            SizedBox(height: 0.3.dp),
            Center(
              child: ElevatedButton(
                onPressed: passwordReset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.inversePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  fixedSize: Size(
                    Adaptive.w(33.sp),
                    Adaptive.h(11.sp),
                  ),
                ),
                child: MyText(
                  text: 'Reset Password',
                  style: typoGraphy.textTheme.titleLarge!.copyWith(
                    color: theme.background,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
