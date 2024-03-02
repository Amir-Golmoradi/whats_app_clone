import 'package:flutter/material.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/login_screen.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/sign_up_screen.dart';

class LoginSignUpConnector extends StatefulWidget {
  const LoginSignUpConnector({super.key});

  @override
  State<LoginSignUpConnector> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignUpConnector> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return SignUpPage(onTap: togglePages);
    }
  }
}
