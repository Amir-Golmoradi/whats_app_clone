import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/app_route.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/login_signup_connector.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const TabRoute();
          } else {
            return const LoginSignUpConnector();
          }
        },
      ),
    );
  }
}
