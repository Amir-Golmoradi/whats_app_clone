import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Calls Screen",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
